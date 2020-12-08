package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.UsuarioService;

@Controller
public class HomeController {
	
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private UsuarioService usuarioService;
	
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
		return "error403";
	}
	
}
