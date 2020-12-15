package edu.ues21.tattoo.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/backup")
public class BackupController {

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String show(Model model) {
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		return "backup";
	}
	
}
