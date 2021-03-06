package edu.ues21.tattoo.service.impl;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.customsearch.Customsearch;
import com.google.api.services.customsearch.CustomsearchRequestInitializer;
import com.google.api.services.customsearch.model.Result;
import com.google.api.services.customsearch.model.Search;

import edu.ues21.tattoo.domain.CredCloudinary;
import edu.ues21.tattoo.domain.CredGoogleCustomSearch;
import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.service.TurnoService;

@Service
public class TurnoServiceImpl implements TurnoService{
	
	@Autowired
	private TurnoRepository turnoRepository;

	@Override
	public int add(Turno turno) {
		// TODO Auto-generated method stub
		return turnoRepository.add(turno);
	}

	@Override
	public List<Turno> getAll() {
		// TODO Auto-generated method stub
		return turnoRepository.getAll();
	}

	@Override
	public List<EventDTO> getAllEventDTO() {
		// TODO Auto-generated method stub
		return turnoToDTO(turnoRepository.getAll());
	}

	
	@Override
	public Turno getById(int id) {
		// TODO Auto-generated method stub
		return turnoRepository.getById(id);
	}

	@Override
	public void update(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.update(turno);
	}

	@Override
	public void delete(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.delete(turno);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		turnoRepository.delete(id);
	}

	@Override
	public boolean tattoistHasAvailableSlot(int idTattoist, Date dateStart, Date dateEnd) {
		// TODO Auto-generated method stub
		Date dateStartHourOffset = modifyHoursToJavaUtilDate(dateStart, -1);
		Date dateEndHourOffset = modifyHoursToJavaUtilDate(dateEnd, +1);

		String fechaInicioOffsetString = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dateStartHourOffset);
		String fechaFinOffsetString = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dateEndHourOffset);
		
		List<Turno> listaTurnos = turnoRepository.getAllByTattoistAndSpecificDate
				(idTattoist, fechaInicioOffsetString, fechaFinOffsetString);
		
		if(listaTurnos.isEmpty())
			return true;
		else {
			for (Turno turno : listaTurnos) {
				if(turno.getTatuador().getId() == idTattoist) {
					return false;
				}
			}
			return true;
		}
	}
	
	private List<EventDTO> turnoToDTO(List<Turno> listaTurnos){
		List<EventDTO> listaDTO = new ArrayList<>();
		
		if(listaTurnos.isEmpty() == false) {
			for(int i = 0; i < listaTurnos.size();i++) {
				EventDTO eventDTO = new EventDTO();
				
				eventDTO.setId(listaTurnos.get(i).getId());
				eventDTO.setStart(listaTurnos.get(i).getFechaInicio());
				eventDTO.setEnd(listaTurnos.get(i).getFechaFin());
				eventDTO.setTitle(listaTurnos.get(i).getDescripcion());
				eventDTO.setColor(listaTurnos.get(i).getTatuador().getColor());
				
				listaDTO.add(eventDTO);
			}
			return listaDTO;
		} else {
			return listaDTO;
		}
			
	}
	
	private Date modifyHoursToJavaUtilDate(Date date, int hours) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    calendar.add(Calendar.HOUR_OF_DAY, hours);
	    return calendar.getTime();
	}

	@Override
	public String getImagesJSON(String query) {
		// TODO Auto-generated method stub
		
		for(CredGoogleCustomSearch cred : CredGoogleCustomSearch.values()) {
			
			String cx = cred.getCx();
			String apiKey = cred.getApiKey();
			
			List<Result> resultList = new ArrayList<Result>();
			ObjectMapper mapper = new ObjectMapper();
			ArrayNode arrayNodeFilteredResults = mapper.createArrayNode();
			
			try {
				Customsearch customSearch = new Customsearch.Builder
						(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), 
								null).setApplicationName("TFG")
									 .setGoogleClientRequestInitializer(new CustomsearchRequestInitializer(apiKey))
									 .build();
				
				Customsearch.Cse.List listCustomSearch = customSearch.cse().list(query);
				listCustomSearch.setCx(cx);
				listCustomSearch.setNum(10L);
				
				for(long index = 1; index <= 41; index += 10){
					listCustomSearch.setStart(index);
					Search results = listCustomSearch.execute();
					java.util.List<Result> listQuery = results.getItems();
					resultList.addAll(listQuery);
				}
				System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultList));
				
				ArrayNode arrayNodeResults = mapper.valueToTree(resultList);
				Iterator<JsonNode> itr = arrayNodeResults.iterator();
				
				while (itr.hasNext()) {
					JsonNode inmutableJSONnode = (JsonNode) itr.next();
					String URL = inmutableJSONnode.get("pagemap").get("metatags").get(0).get("og:image").toString().replace("\"", "");
				
					ObjectNode auxNode = mapper.createObjectNode();
					auxNode.put("img-url", URL);
					
					arrayNodeFilteredResults.add(auxNode);
				}
				
				System.out.println(arrayNodeFilteredResults);
				
				return arrayNodeFilteredResults.toString();
				
			} catch (GeneralSecurityException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		return null;
	}
	
	@Override
	public List<String> getImagesList(String query) {
		// TODO Auto-generated method stub
		List<String> finalResult = new ArrayList<String>();

		for(CredGoogleCustomSearch cred : CredGoogleCustomSearch.values()) {
			
			String cx = cred.getCx();
			String apiKey = cred.getApiKey();
			
			List<Result> resultList = new ArrayList<Result>();
			ObjectMapper mapper = new ObjectMapper();
			
			try {
				Customsearch customSearch = new Customsearch.Builder
						(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), 
								null).setApplicationName("TFG")
									 .setGoogleClientRequestInitializer(new CustomsearchRequestInitializer(apiKey))
									 .build();
				
				Customsearch.Cse.List listCustomSearch = customSearch.cse().list(query);
				listCustomSearch.setCx(cx);
				listCustomSearch.setNum(10L);
				
				for(long index = 1; index <= 41; index += 10){
					listCustomSearch.setStart(index);
					Search results = listCustomSearch.execute();
					java.util.List<Result> listQuery = results.getItems();
					resultList.addAll(listQuery);
				}
				System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultList));
				
				ArrayNode arrayNodeResults = mapper.valueToTree(resultList);
				Iterator<JsonNode> itr = arrayNodeResults.iterator();
				
				while (itr.hasNext()) {
					JsonNode inmutableJSONnode = (JsonNode) itr.next();
					String URL = inmutableJSONnode.get("pagemap").get("metatags").get(0).get("og:image").toString().replace("\"", "");
					finalResult.add(URL);
				}
				
				return finalResult;
				
			} catch (GeneralSecurityException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		return null;
	}
	
	private String auxiliarGetImagesJSON(String query) {

		for(CredGoogleCustomSearch cred : CredGoogleCustomSearch.values()) {
			
			String cx = cred.getCx();
			String apiKey = cred.getApiKey();
			
			Customsearch customsearch = new Customsearch(new NetHttpTransport(),new JacksonFactory(), 
					new HttpRequestInitializer() {
						public void initialize(HttpRequest httpRequest) {
							// set connect and read timeouts //7000
							httpRequest.setConnectTimeout(3 * 600000);
							httpRequest.setReadTimeout(3 * 600000);
						}
			});
			
			try {
				Customsearch.Cse.List list = customsearch.cse().list(query);
				list.setKey(apiKey);
				//The Programmable Search Engine ID to use for this request.
				list.setCx(cx);
				//Number of search results to return. Valid values are integers between 1 and 10, inclusive.
				//Maximum value for num is 10.
				list.setNum(10L);
				//The index of the first result to return. The default number of results per page is 10, so,
				//&start=11 would start at the top of the second page of results. 
				//Note: The JSON API will never return more than 100 results, even if more than 100 documents
				//match the query, so setting the sum of start + num to a number greater than 100 will produce 
				//an error.
				//0L AND 1L will produce the same results.
				//11L: Second page.
				//21L: Third page.
				//91L: Last page.
				//92L: Error
				list.setStart(1L);
				Search results = list.execute();
				java.util.List<Result> resultList = results.getItems();
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultList);
				
				return json;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		return null;
	}

	@Override
	public void insertTurnosHASproductos(int idTurno, int idProducto) {
		// TODO Auto-generated method stub
		turnoRepository.insertTurnosHASproductos(idTurno, idProducto);
	}

	@Override
	public String translateStyleTattoo(String style) {
		// TODO Auto-generated method stub
		switch (style) {
			case "Acuarela (Watercolor)" 			: return "watercolor acuarela";
			case "Anime (Manga Comic)"   			: return "anime manga comic";
			case "Biomechanical"		 			: return "biomechanical";
			case "Blackwork"			 			: return "blackwork";
			case "Celta (Celtic)"				 	: return "celtic celta";
			case "Chicano"				 			: return "chicano chicanos";
			case "Japones (Oriental)"	 			: return "japanese oriental japan";
			case "Lettering"			 			: return "lettering";
			case "Maori"			     			: return "maori polynesian";
			case "Neotradicional (Neotraditional)"	: return "neotraditional neo traditional neotradi";
			case "New School"						: return "new school";
			case "Old School (Traditional)"			: return "old school";
			case "Puntillismo (Dotwork)"			: return "dotwork dot work puntillismo";
			case "Realismo (Black and Grey)"		: return "realistic realism black and grey";
			case "Realismo (Color)"					: return "realistic realism color";
			case "Sketch"							: return "sketch";
			case "Trash Polka"						: return "trash polka";
			case "Tribal"							: return "tribal";
			default 								: return "";
		}
	}

	@Override
	public List<Turno> getAppointmentsWithCloudinaryPhotos() {
		// TODO Auto-generated method stub
		return setUrlCloudinary(turnoRepository.getAppointmentsWithCloudinaryPhotos());
	}

	@Override
	public void deleteCloudinaryField(int idTurno) {
		// TODO Auto-generated method stub
		turnoRepository.deleteCloudinaryField(idTurno);
	}

	@Override
	public List<Turno> filterAppointmentWithCloudinaryPhotos(String description, String nickTattoist, 
															 String styleTattoo) {
		// TODO Auto-generated method stub
		List<Turno> appointmentsWithCloudinaryPhotos = turnoRepository.getAppointmentsWithCloudinaryPhotos();
		Iterator<Turno> itr = appointmentsWithCloudinaryPhotos.iterator();
		
		while(itr.hasNext() && !nickTattoist.equalsIgnoreCase("all")) {

			if(itr.next().getTatuador().getPseudonimo().equalsIgnoreCase(nickTattoist) == false) 
				itr.remove();
			
		}
		
		itr = appointmentsWithCloudinaryPhotos.iterator();
		
		while(itr.hasNext() && description != null  && !description.equalsIgnoreCase("") ) {
			
			if(itr.next().getDescripcion().contains(description) == false)
				itr.remove();
			
			
		}
		
		itr = appointmentsWithCloudinaryPhotos.iterator();
		
		while(itr.hasNext() && !styleTattoo.equalsIgnoreCase("all")) {
			
			if(itr.next().getTipoTatuaje().getNombre().equalsIgnoreCase(styleTattoo) == false)
				itr.remove();
				
		}
		
		return setUrlCloudinary(appointmentsWithCloudinaryPhotos);
	}
	
	private List<Turno> setUrlCloudinary(List<Turno> listAppointment){
		
		Cloudinary c = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", CredCloudinary.ACCOUNT.getCloudName(),
				"api_key", CredCloudinary.ACCOUNT.getApiKey(),
				"api_secret", CredCloudinary.ACCOUNT.getApiSecret()));
		
		for(int i = 0; i < listAppointment.size(); i++) {
			try {
				Map result = c.api().resource(listAppointment.get(i).getPublicId(), ObjectUtils.emptyMap());
				listAppointment.get(i).setPublicId(result.get("url").toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return listAppointment;
	}

}