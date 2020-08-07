package edu.ues21.tattoo.service.impl;

import java.security.SecureRandom;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Usuario;
import edu.ues21.tattoo.domain.repository.UsuarioRepository;
import edu.ues21.tattoo.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService{

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public String add(String nombre, String apellido) {
		// TODO Auto-generated method stub
		return usuarioRepository.add(createUsuario(nombre, apellido));
	}

	@Override
	public Usuario getById(String username) {
		// TODO Auto-generated method stub
		return usuarioRepository.getById(username);
	}

	@Override
	public void update(Usuario usuario) {
		// TODO Auto-generated method stub
		usuarioRepository.update(usuario);
	}

	@Override
	public void disable(String username) {
		// TODO Auto-generated method stub
		usuarioRepository.disable(username);
	}

	@Override
	public Usuario check(String username, String password) {
		// TODO Auto-generated method stub
		Usuario user = usuarioRepository.getById(username);
		
		if(user != null && BCrypt.checkpw(password, user.getContraseniaHash()))
			return user;
		else
			return null;
	}
	
	private Usuario createUsuario(String nombre, String apellido) {
		Usuario u = new Usuario();
		u.setActivo(true);
		u.setUltimoCambio(new Date());
		u.setNombre(createName(nombre, apellido));
		u.setContraseniaHash(generateBCryptHash(generateRandomRawPassword()));
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
	
	private String generateBCryptHash(String rawPassword) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(rawPassword);
		return hashedPassword;
	}
	
	private String createName(String nombre, String apellido) {
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

}
