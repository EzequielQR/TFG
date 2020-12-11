package edu.ues21.tattoo.controller;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.UsuarioService;

@Controller
public class HomeController {
	
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private ClienteService clienteService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String welcome(Model model) {
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			model.addAttribute("nombre", user.getUsername());
			model.addAttribute("fechaUltimoCambio", usuarioService.getById(user.getUsername()).getUltimoCambio());
		}
		
		model.addAttribute("list", tatuadorService.getTattooistWithActualAppointments());
		return "home";
	}
	
	@RequestMapping(value = "/error403", method = RequestMethod.GET)
	public String error403(Model model) {
		boolean isCustomer = false;
		String username = "";
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			username = user.getUsername();
			
			model.addAttribute("nombre", username);
			
			Iterator<? extends GrantedAuthority> itr = user.getAuthorities().iterator();
			
			while(itr.hasNext()) {
				GrantedAuthority authority = itr.next();
				
				if(authority.getAuthority().equalsIgnoreCase("customer")) 
					isCustomer = true;
			}
		}
		
		if(isCustomer == true) {
			model.addAttribute("idCliente", clienteService.getByUsername(username).getId());
			return "error403";
		}
		else
			return "error403";
	}
	
}
