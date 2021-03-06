package edu.ues21.tattoo.service.impl;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.CredMail;
import edu.ues21.tattoo.domain.Usuario;
import edu.ues21.tattoo.domain.repository.UsuarioRepository;
import edu.ues21.tattoo.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService{

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public String add(String nombre, String apellido, String correoElectronico) {
		// TODO Auto-generated method stub
		String username = createUsername(nombre, apellido);
		String rawPassword = generateRandomRawPassword();
		
		sendMail(correoElectronico, username, rawPassword);
		return usuarioRepository.add(createUsuario(username, rawPassword));
	}

	@Override
	public Usuario getById(String username) {
		// TODO Auto-generated method stub
		return usuarioRepository.getById(username);
	}

	@Override
	public void update(Usuario usuario) {
		// TODO Auto-generated method stub
		usuario.setUltimoCambio(new Date());
		usuarioRepository.update(usuario);
	}

	@Override
	public void disable(String username) {
		// TODO Auto-generated method stub
		usuarioRepository.disable(username);
	}

	@Override
	public boolean check(String rawPassword, String hashedPassword) {
		// TODO Auto-generated method stub
		return BCrypt.checkpw(rawPassword, hashedPassword);
	}
	
	private Usuario createUsuario(String username, String rawPassword) {
		Usuario u = new Usuario();
		u.setActivo(true);
		u.setNombre(username);
		u.setContraseniaHash(generateBCryptHash(rawPassword));
		return u;
	}
	
	private String generateRandomRawPassword() {
	    final String MAYUSCULAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    final String MINUSCULAS = MAYUSCULAS.toLowerCase();
	    final String NUMEROS = "0123456789";
	    
	    final String CARACTERES_ALFANUMERICOS = MAYUSCULAS + MINUSCULAS + NUMEROS;
	    
	    SecureRandom rnd = new SecureRandom();
	    StringBuilder sb = new StringBuilder(6);
	    
	    for(int i = 0; i < 6; i++) {
	    	sb.append(CARACTERES_ALFANUMERICOS.charAt(rnd.nextInt(CARACTERES_ALFANUMERICOS.length())));
	    }
		
		return sb.toString();
	}
	
	@Override
	public String generateBCryptHash(String rawPassword) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(rawPassword);
		return hashedPassword;
	}
	
	private String createUsername(String nombre, String apellido) {
		String username = generateName(nombre, apellido);
		
		if(usuarioRepository.getById(username) == null)
			return username;
		else {
			for(int i = 1;;i++) {
				String newUsername = username + i;
				
				if(usuarioRepository.getById(newUsername) == null)
					return newUsername;
			}
		}
	}
	
	// \\s -> Para matchear "single white space character"
	private String generateName(String nombre, String apellido) {
		String username = nombre.substring(0, 1).toLowerCase() +
				apellido.toLowerCase().trim().replaceAll("\\s", "");
		
		return username;
	}

	private void sendMail(String mailDestino, String username, String rawPassword) {
		//TODO FIXME: Read both constants via external file.
		final String MAIL_ORIGEN = CredMail.ACCOUNT.getMail();
		final String PASSWORD = CredMail.ACCOUNT.getPassword();
		
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
		
		Message message = prepareMesage(session, MAIL_ORIGEN, mailDestino, username, rawPassword);
		
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
			message = prepareMesage(session, MAIL_ORIGEN, mailDestino, username, rawPassword);
			try {
				Transport.send(message);
			} catch (MessagingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	private Message prepareMesage(Session session, String mailOrigen, String mailDestino, String username,
								  String rawPassword) {
		// TODO Auto-generated method stub
		final String TITULO_CORREO = "Datos de acceso";
		final String CUERPO_MENSAJE_HTML = "A continuación, se proporciona su cuenta y contraseña.<br>" + " "
									  + "No comparta estos datos con nadie.<br><br>"
									  + "<b>Nombre de cuenta:&nbsp;</b>" + username + "<br>"
									  + "<b>Contraseña:&nbsp;</b>" + rawPassword;
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailOrigen));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailDestino));
			
			message.setSubject(TITULO_CORREO);
			message.setContent(CUERPO_MENSAJE_HTML, "text/html");
			
			return message;
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
