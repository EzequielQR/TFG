package edu.ues21.tattoo.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.CredMail;
import edu.ues21.tattoo.domain.repository.ClienteRepository;
import edu.ues21.tattoo.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService{

	@Autowired
	private ClienteRepository clienteRepository;

	@Override
	public int add(Cliente cliente) {
		// TODO Auto-generated method stub
		return clienteRepository.add(cliente);
	}

	@Override
	public List<Cliente> getAll() {
		// TODO Auto-generated method stub
		return clienteRepository.getAll();
	}

	@Override
	public Cliente getById(int id) {
		// TODO Auto-generated method stub
		return clienteRepository.getById(id);
	}

	@Override
	public Cliente getByPersonId(int idPerson) {
		// TODO Auto-generated method stub
		return clienteRepository.getByPersonId(idPerson);
	}

	@Override
	public Cliente getByUsername(String username) {
		// TODO Auto-generated method stub
		return clienteRepository.getByUsername(username);
	}	
	
	@Override
	public void update(Cliente cliente) {
		// TODO Auto-generated method stub
		clienteRepository.update(cliente);
	}

	@Override
	public void delete(Cliente cliente) {
		// TODO Auto-generated method stub
		clienteRepository.delete(cliente);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		clienteRepository.delete(id);
	}

	@Override
	public void sendMailAppointment(String fullName, Date fecha, String correoElectronico) {
		//TODO FIXME: Read both constants via external file.
		final String MAIL_ORIGEN = CredMail.ACCOUNT.getMail();
		final String PASSWORD = CredMail.ACCOUNT.getPassword();
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy 'Hora:' HH:mm");
		String dateString = formatter.format(fecha); 
		
		Properties properties = new Properties();
		
		//SSL:
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		 
		
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(MAIL_ORIGEN, PASSWORD);
			}
		});
		
		Message message = prepareMesage(session, MAIL_ORIGEN, correoElectronico, fullName, dateString);
		
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			
			properties.clear();
			//TLS:
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			
			session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication(MAIL_ORIGEN, PASSWORD);
				}
			});
			
			message = prepareMesage(session, MAIL_ORIGEN, correoElectronico, fullName, dateString);
			try {
				Transport.send(message);
			} catch (MessagingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}		
	}

	private Message prepareMesage(Session session, String mailOrigen, String mailDestino, 
			String fullName, String fecha) {
		// TODO Auto-generated method stub
		final String TITULO_CORREO = "Recordatorio de Turno";
		final String CUERPO_MENSAJE_HTML = "Estimado/a:"
							+ "&nbsp;" + fullName + "&nbsp;"
							+ "le recordamos que tiene un turno el día:"
							+ "&nbsp;<strong>" + fecha + "</strong>&nbsp;"
							+ "<br>"
							+ "En caso de no asistir, se ruega avisar con 24hrs de anticipación."
							+ "<br>"
							+ "A continuación, se adjunta un archivo con las recomendaciones pre y post sesión."
							+ "<br><br>"
							+ "Atte. El equipo de 94-20";
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailOrigen));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailDestino));
			
			message.setSubject(TITULO_CORREO);
			
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(CUERPO_MENSAJE_HTML, "text/html");
			
			//Attachment
			MimeBodyPart attachment = new MimeBodyPart();
			try {
				ClassLoader loader = getClass().getClassLoader();
				URL resource = loader.getResource("test.docx");
				attachment.attachFile(new File(resource.toURI()));
			} catch (IOException | URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			attachment.setFileName("Recomendaciones pre-sesion.docx");
			//End attachment				
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			multipart.addBodyPart(attachment);
			
			message.setContent(multipart);
			
			return message;
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}