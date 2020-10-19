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

import edu.ues21.tattoo.domain.repository.UsuarioRepository;

@Service
public class UserService implements UserDetailsService{

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		edu.ues21.tattoo.domain.Usuario usuario = usuarioRepository.getById(username);
		
		//TODO FIXME: Remove this. Add logic.
		GrantedAuthority granthedAuthority = new SimpleGrantedAuthority("ADMIN");
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(granthedAuthority);
		
		UserDetails userDetails = new org.springframework.security.core.userdetails.User
				(usuario.getNombre(), usuario.getContraseniaHash(), authorities);
		
		return userDetails;
	}

}
