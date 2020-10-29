package edu.ues21.tattoo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.repository.EncargadoComprasRepository;
import edu.ues21.tattoo.domain.repository.RecepcionistaRepository;
import edu.ues21.tattoo.domain.repository.TatuadorRepository;
import edu.ues21.tattoo.domain.repository.UsuarioRepository;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private TatuadorRepository tatuadorRepository;
	@Autowired
	private EncargadoComprasRepository encargadoComprasRepository;
	@Autowired
	private RecepcionistaRepository recepcionistaRepository;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		edu.ues21.tattoo.domain.Usuario usuario = usuarioRepository.getById(username);
		
		GrantedAuthority granthedAuthority = getRole(usuario.getNombre());
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(granthedAuthority);
		
		UserDetails userDetails = new org.springframework.security.core.userdetails.User
				(usuario.getNombre(), usuario.getContraseniaHash(), authorities);
		
		return userDetails;
	}
	
	private GrantedAuthority getRole(String username) {
		
		if(username.equalsIgnoreCase("admin"))
			return new SimpleGrantedAuthority("ADMIN");
		else if(tatuadorRepository.getByUsername(username) != null)
				return new SimpleGrantedAuthority("TATTOOIST");
		else if(encargadoComprasRepository.getByUsername(username) != null)
			return new SimpleGrantedAuthority("MANAGER");
		else if(recepcionistaRepository.getByUsername(username) != null)
			return new SimpleGrantedAuthority("RECEPTIONIST");
		else
			return new SimpleGrantedAuthority("CUSTOMER");
	}

}