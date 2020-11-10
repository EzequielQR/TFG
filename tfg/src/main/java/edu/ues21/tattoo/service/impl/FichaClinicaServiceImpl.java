package edu.ues21.tattoo.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;

import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.repository.FichaClinicaRepository;
import edu.ues21.tattoo.service.FichaClinicaService;
import io.grpc.Channel;
import io.grpc.Grpc;

@Service
public class FichaClinicaServiceImpl implements FichaClinicaService{
	
	@Autowired
	private FichaClinicaRepository fichaClinicaRepository;

	@Override
	public int add(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.add(fichaClinica);
	}

	@Override
	public List<FichaClinica> getAll() {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.getAll();
	}

	@Override
	public FichaClinica getById(int id) {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.getById(id);
	}

	@Override
	public void update(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.update(fichaClinica);
	}

	@Override
	public void delete(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.delete(fichaClinica);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.delete(id);
	}
	
	@Override
	public Map<String, String> digitalTransformation(String path) {
		// TODO Auto-generated method stub
		try {
			return getFields(detectTextGoogle(path));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Map<String, String> digitalTransformation(byte[] data) {
		// TODO Auto-generated method stub
		try {
			return getFields(detectTextGoogle(data));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private void detectText(String filePath, PrintStream out) throws Exception, IOException {
        List<AnnotateImageRequest> requests = new ArrayList<>();

        ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

        Image img = Image.newBuilder().setContent(imgBytes).build();
        Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
        AnnotateImageRequest request =
                AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
        requests.add(request);

        try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {
            BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
            List<AnnotateImageResponse> responsesList = response.getResponsesList();

            for (AnnotateImageResponse res : responsesList) {
                if (res.hasError()) {
                    out.printf("Error: %s\n", res.getError().getMessage());
                    return;
                }

                // For full list of available annotations, see http://g.co/cloud/vision/docs
                for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
                    out.printf("Text: %s\n", annotation.getDescription());
                    //out.printf("Position : %s\n", annotation.getBoundingPoly());
                }
            }
            vision.close();
        }
        
    }
	
	//C:\\Users\\eezeq\\Pictures\\ficha clinica\\j\\ms-font.jpeg
	private String detectTextGoogle(String filePath) throws Exception, IOException {
		// Initialize client that will be used to send requests. This client only needs to be created
	    // once, and can be reused for multiple requests. After completing all of your requests, call
	    // the "close" method on the client to safely clean up any remaining background resources.
	    try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {

	      // Reads the image file into memory
	      Path path = Paths.get(filePath);
	      byte[] data = Files.readAllBytes(path);
	      ByteString imgBytes = ByteString.copyFrom(data);

	      // Builds the image annotation request
	      List<AnnotateImageRequest> requests = new ArrayList<>();
	      Image img = Image.newBuilder().setContent(imgBytes).build();
	      Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
	      AnnotateImageRequest request =
	          AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	      requests.add(request);

	      // Performs detection on the image file
	      BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responsesList = response.getResponsesList();
	      
	      vision.close();
	      return responsesList.get(0).getTextAnnotationsList().get(0).getDescription().trim();

	  }

    }
	
	private String detectTextGoogle(byte[] data) throws Exception, IOException {
		// Initialize client that will be used to send requests. This client only needs to be created
	    // once, and can be reused for multiple requests. After completing all of your requests, call
	    // the "close" method on the client to safely clean up any remaining background resources.
		
		String j = "{\r\n" + 
				"  \"type\": \"service_account\",\r\n" + 
				"  \"project_id\": \"my-project-1601784728368\",\r\n" + 
				"  \"private_key_id\": \"a3e4da1424e00671ca056590722e62ed4580875f\",\r\n" + 
				"  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDb5/VEkb9Aby80\\nQ0j0cp2ED+xpRxr50AkBET/3pIRmNWVUWH1k5RcslO1eYaYtDCuWOpdZ+RFdrJUf\\nPt+813FgMlxJmMSQFC5VrJRa14htHyUY+6cN3lf6CVstTmqOoxwc2l8+MX5ATKcc\\n+rQvhcaGb36MjKsJIUrAn0yGQcbQroyDRM8O8ZYp0bVN2ZJjcfaOX7tozSuV9E84\\nFxd2twmMZlAgOJK8NPlSik6AzxU79ysAt0y0nN8I46foWz52DIm8yc3wnaHYdv6U\\npzCc3znJMd4oDZzvB136j4jVfiHkLrzduPoj48/RqoQvNRAMQhqq64BQxhvEqYRE\\nuyC2a6whAgMBAAECggEABYly/l+dlUefZIVbr0T6BJbajOGMkzTq3x8iMU/wAftO\\n8ndaa+mNQnL7AYz7oEd9yvXtdOddqbJEXHGqtEBn80Q9WOCK9XY+nuteHmXuIlI+\\nDsGaWJHsPOhSpoLCkdYXSX4xlvkrzL5pWERTOF2ZzK1+vhb2IQAYt94i8P/zu7IX\\nbpVo5YG+jdx/LgX7UuUIgGSZeN1wZ3Uf66Us3ls/5uoB2NH0SRIXWB/EJ+fgOoLm\\nbxEDETZENfFtYB6ou40xG0iXDr3hHtHhZdhvWjdR3ITk1JMV23oIqWn6GReCVQMU\\nspQs2lbzquUs9kmQsgIb5sHKElL0wCVkt1c/E3RDGQKBgQD/GJ7QWutS6HtjThRq\\n7b9KL8aQuZTyXuvi77M+YFpxrIwso6qBCvsrMTgrdwxMgi+GuIyhXXCRT5owHh09\\nONqINcFlzlPqhmDaf+SmXi83BSapzEo9hzDOtDCigDMjcFVC5JXKeedf26HXCPvZ\\nGjuIiOfJ+39pqDQThrRdFf156QKBgQDcr2tV9n/YE3dR5iWi0KbDV3cxUnqts8LD\\nx0yER3boU+kljK56GPS0IVetr98xTrGttjozibJlJ/opVxWYLT8+8n6q1NMnDG24\\n7ArS54fMVjQ5OxmVMNG1nzSaV8IxHy0Vavi6Lp9BYntE66dsuo4FmNdjZLBajsZA\\nNJQSE6+FeQKBgQDesSOTSIu+qO1uV69DWaFwphx2I0x/+ZV7Wz3i6kKKkdMc9RPX\\n6zoxDpq2dwrpj4zl0x4RkHzAnflAoEluNL+xwRvAQErJpd3PYW6+PeKB6aFDAfCd\\nnfNhv7PlaH08JsiHyP1q8NinuhiinFkfweLO4pVWopMsLYaotSOnT5ckYQKBgHmy\\n70FHn3bcPUfX4FdqMxy0ZlG3x1l1MWnfxU2JT4SNiZwgebNxgbi4Tm7E9xNs70T5\\nohz7yXpJUoZrtMfn4+Hlvn6cwRjenL+Gw+1MqzG/NCt/cPs6IdvDwTGAReHq7GTM\\nSf/6Z+6ZzZrTTdADDQD/KYBxbWNzKtcLZ8CURI4ZAoGANLF3RLOL8pP9j0vg861L\\nDCVmarNSHq5J6mVgmKqOPO/sgP+ERHTQzgCMj8ZfcJx5mJompEVXwFSBBX74wRr+\\nJx+D31DowuLplj6y2Jog08jJSSAoGAg7VBTtycxOWM9jU6e3icrGVGsf9enqmRDy\\n/GGQQ+Dpj28naPL+GMQyr4U=\\n-----END PRIVATE KEY-----\\n\",\r\n" + 
				"  \"client_email\": \"tfg-241@my-project-1601784728368.iam.gserviceaccount.com\",\r\n" + 
				"  \"client_id\": \"110913763640910028348\",\r\n" + 
				"  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\r\n" + 
				"  \"token_uri\": \"https://oauth2.googleapis.com/token\",\r\n" + 
				"  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\r\n" + 
				"  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/tfg-241%40my-project-1601784728368.iam.gserviceaccount.com\"\r\n" + 
				"}\r\n";
		
		InputStream fileInput = new ByteArrayInputStream(j.getBytes());
		
		Credentials c = ServiceAccountCredentials.fromStream(fileInput);
		
		ImageAnnotatorSettings settings = ImageAnnotatorSettings.newBuilder()
				.setCredentialsProvider(FixedCredentialsProvider.create(c)).build();
		
	    try (ImageAnnotatorClient vision = ImageAnnotatorClient.create(settings)) {

	      // Reads the image file into memory
	      ByteString imgBytes = ByteString.copyFrom(data);

	      // Builds the image annotation request
	      List<AnnotateImageRequest> requests = new ArrayList<>();
	      Image img = Image.newBuilder().setContent(imgBytes).build();
	      Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
	      AnnotateImageRequest request =
	          AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	      requests.add(request);

	      // Performs detection on the image file
	      BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responsesList = response.getResponsesList();
	      
	      vision.close();
	      return responsesList.get(0).getTextAnnotationsList().get(0).getDescription().trim();

	  }

    }
	
	private Map<String, String> getFields(String stringOCR) {
		Map<String, String> fields = new HashMap<String, String>();
		
		int indexName = stringOCR.indexOf("Nombre:");
		int indexSurname = stringOCR.indexOf("Apellido:");
		int indexSex = stringOCR.indexOf("Sexo:");
		int indexAge = stringOCR.indexOf("Edad:");
		int indexJob = stringOCR.indexOf("Ocupación:");
		int indexAddress = stringOCR.indexOf("Dirección:");
		int indexCity = stringOCR.indexOf("Ciudad:");
		int indexProvince = stringOCR.indexOf("Provincia:");
		int indexCountry = stringOCR.indexOf("País:");
		int indexEmail = stringOCR.indexOf("E-mail:");
		int indexPhone = stringOCR.indexOf("Teléfono:");
		int indexBloodType = stringOCR.indexOf("Tipo de Sangre:");
		int indexRHfactor = stringOCR.indexOf("RH:");
		
		int indexEndFirstPart = stringOCR.indexOf("DATOS SOBRE SALUD:");
		
		int indexCardiac = stringOCR.indexOf("Cardiacos:");
		int indexCardiacDetails = stringOCR.indexOf("Especifique:", indexCardiac);
		int indexSkin = stringOCR.indexOf("Piel:");
		int indexSkinDetails = stringOCR.indexOf("Especifique:", indexSkin);
		int indexCirculation = stringOCR.indexOf("Circulación:");
		int indexCirculationDetails = stringOCR.indexOf("Especifique:", indexCirculation);
		int indexAllergies = stringOCR.indexOf("Alergias:");
		int indexAllergiesDetails = stringOCR.indexOf("Especifique:", indexAllergies);
		int indexDiabetes = stringOCR.indexOf("Diabetes:");
		int indexSmoking = stringOCR.indexOf("Tabaquismo:");
		int indexAlcoholUse = stringOCR.indexOf("¿Consumió alcohol en las últimas 24 horas?:");
		int indexDrugsUse = stringOCR.indexOf("¿Consumió drogas en las últimas 24 horas?:");
		int indexPregnant = stringOCR.indexOf("Embarazada:");
		int indexEpilepsy = stringOCR.indexOf("Epilepsia:");
		int indexMedication = stringOCR.indexOf("¿Consume medicamentos?");
		int indexMedicationDetails = stringOCR.indexOf("Especifique:", indexMedication);
		int indexHypertension = stringOCR.indexOf("Hipertensión:");
		int indexHIV = stringOCR.indexOf("VIH/SIDA:");
		int indexHepatitis = stringOCR.indexOf("Hepatitis B:");
		int indexHPV = stringOCR.indexOf("HPV:");
		int indexSyphilis = stringOCR.indexOf("Sífilis:");
		
		final String NAME = stringOCR.substring(indexName + 7, indexSurname).trim();
		final String SURNAME = stringOCR.substring(indexSurname + 9, indexSex).trim();
		final String SEX = stringOCR.substring(indexSex + 5, indexAge).trim();
		final String AGE = stringOCR.substring(indexAge + 5, indexJob).trim();
		final String JOB = stringOCR.substring(indexJob + 10, indexAddress).trim();
		final String ADDRESS = stringOCR.substring(indexAddress + 10, indexCity).trim();
		final String CITY = stringOCR.substring(indexCity + 7, indexProvince).trim();
		final String PROVINCE = stringOCR.substring(indexProvince + 10, indexCountry).trim();
		final String COUNTRY = stringOCR.substring(indexCountry + 5, indexEmail).trim();
		final String EMAIL = stringOCR.substring(indexEmail + 7, indexPhone).trim();
		final String PHONE = stringOCR.substring(indexPhone + 9, indexBloodType).trim();
		final String BLOOD_TYPE = stringOCR.substring(indexBloodType + 15, indexRHfactor).trim();
		final String RH_FACTOR = stringOCR.substring(indexRHfactor + 3, indexEndFirstPart).trim();
		
		final String CARDIAC_BOOLEAN = stringOCR.substring(indexCardiac + 10, indexCardiacDetails).trim();
		final String CARDIAC_DETAILS = stringOCR.substring(indexCardiacDetails + 12, indexSkin).trim();
		final String SKIN_BOOLEAN = stringOCR.substring(indexSkin + 5, indexSkinDetails).trim();
		final String SKIN_DETAILS = stringOCR.substring(indexSkinDetails + 12, indexCirculation).trim();
		final String CIRCULATION_BOOLEAN = stringOCR.substring(indexCirculation + 12, indexCirculationDetails).trim();
		final String CIRCULATION_DETAILS = stringOCR.substring(indexCirculationDetails + 12, indexAllergies).trim();
		final String ALLERGIES_BOOLEAN = stringOCR.substring(indexAllergies + 9, indexAllergiesDetails).trim();
		final String ALLERGIES_DETAILS = stringOCR.substring(indexAllergiesDetails + 12, indexDiabetes).trim();
		final String DIABETES_BOOLEAN = stringOCR.substring(indexDiabetes + 9, indexSmoking).trim();
		final String SMOOKING_BOOLEAN = stringOCR.substring(indexSmoking + 11, indexAlcoholUse).trim();
		final String ALCOHOL_USE_BOOLEAN = stringOCR.substring(indexAlcoholUse + 43, indexDrugsUse).trim();
		final String DRUG_USE_BOOLEAN = stringOCR.substring(indexDrugsUse + 42, indexPregnant).trim();
		final String PREGNANT_BOOLEAN = stringOCR.substring(indexPregnant + 11, indexEpilepsy).trim();
		final String EPILEPSY_BOOLEAN = stringOCR.substring(indexEpilepsy + 10, indexMedication).trim();
		final String MEDICATION_BOOLEAN = stringOCR.substring(indexMedication + 22, indexMedicationDetails).trim();
		final String MEDICATION_DETAILS = stringOCR.substring(indexMedicationDetails + 12, indexHypertension).trim();
		final String HYPERTENSION_BOOLEAN = stringOCR.substring(indexHypertension + 13, indexHIV).trim();
		final String HIV_BOOLEAN = stringOCR.substring(indexHIV + 9, indexHepatitis).trim();
		final String HEPATITIS_BOOLEAN = stringOCR.substring(indexHepatitis + 12, indexHPV).trim();
		final String HPV_BOOLEAN = stringOCR.substring(indexHPV + 4, indexSyphilis).trim();
		final String SYPHILIS_BOOLEAN = stringOCR.substring(indexSyphilis + 8, stringOCR.length()).trim();
		
		//34 Keys
		fields.put("name", NAME);
		fields.put("surname", SURNAME);
		fields.put("sex", SEX);
		fields.put("age", AGE);
		fields.put("job", JOB);
		fields.put("address", ADDRESS);
		fields.put("city", CITY);
		fields.put("province", PROVINCE);
		fields.put("country", COUNTRY);
		fields.put("email", EMAIL);
		fields.put("phone", PHONE);
		fields.put("bloodType", BLOOD_TYPE);
		fields.put("rhFactor", RH_FACTOR);
		
		fields.put("cardiacBoolean", detectBoolean(CARDIAC_BOOLEAN));
		fields.put("cardiacDetails", CARDIAC_DETAILS);
		fields.put("skinBoolean", detectBoolean(SKIN_BOOLEAN));
		fields.put("skinDetails", SKIN_DETAILS);
		fields.put("circulationBoolean", detectBoolean(CIRCULATION_BOOLEAN));
		fields.put("circulationDetails", CIRCULATION_DETAILS);
		fields.put("allergiesBoolean", detectBoolean(ALLERGIES_BOOLEAN));
		fields.put("allergiesDetails", ALLERGIES_DETAILS);
		fields.put("diabetesBoolean", detectBoolean(DIABETES_BOOLEAN));
		fields.put("smookingBoolean", detectBoolean(SMOOKING_BOOLEAN));
		fields.put("alcoholUseBoolean", detectBoolean(ALCOHOL_USE_BOOLEAN));
		fields.put("drugUseBoolean", detectBoolean(DRUG_USE_BOOLEAN));
		fields.put("pregnantBoolean", detectBoolean(PREGNANT_BOOLEAN));
		fields.put("epilepsyBoolean", detectBoolean(EPILEPSY_BOOLEAN));
		fields.put("medicationBoolean", detectBoolean(MEDICATION_BOOLEAN));
		fields.put("medicationDetails", MEDICATION_DETAILS);
		fields.put("hypertensionBoolean", detectBoolean(HYPERTENSION_BOOLEAN));
		fields.put("hivBoolean", detectBoolean(HIV_BOOLEAN));
		fields.put("hepatitisBoolean", detectBoolean(HEPATITIS_BOOLEAN));
		fields.put("hpvBoolean", detectBoolean(HPV_BOOLEAN));
		fields.put("syphilisBoolean", detectBoolean(SYPHILIS_BOOLEAN));
		
		return fields;
	}
	
	private String detectBoolean(String booleanField) {
		
		if(booleanField.replaceAll("\\s", "").length() == 4)
			return "";

		int openParenthesis = booleanField.indexOf("(");
		int closeParenthesis = booleanField.indexOf(")");
		
		if(openParenthesis == -1 && closeParenthesis == -1)
			return "";
		else if(openParenthesis != -1) {
			String booleanSelection = booleanField.substring(openParenthesis + 1, openParenthesis + 3).trim();
			
			if(booleanSelection.equalsIgnoreCase("si"))
				return "true";
			else
				return "false";
		}
		else if(closeParenthesis != -1) {
			String booleanSelection = booleanField.substring(closeParenthesis - 2, closeParenthesis).trim();
			
			if(booleanSelection.equalsIgnoreCase("si"))
				return "true";
			else
				return "false";
		}
		else
			return "";
	}

}