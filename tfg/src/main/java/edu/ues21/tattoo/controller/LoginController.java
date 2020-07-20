package edu.ues21.tattoo.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.domain.Usuario;
import edu.ues21.tattoo.service.UsuarioService;
import edu.ues21.tattoo.util.UserUtil;

@Controller
public class LoginController {
	
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String processLogin(@RequestParam(name="username") String usuario, 
							   @RequestParam(name="rawPassword") String rawPassword) {
		Usuario user = usuarioService.check(usuario, rawPassword);
		
		if (user != null) {
			UserUtil.setUsuario(user);
			return "redirect:/home";
		} else {
			return "redirect:/error";
		}
	}
	
}
