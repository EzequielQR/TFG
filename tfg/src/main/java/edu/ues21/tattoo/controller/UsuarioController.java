package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.service.PersonaService;

@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {

	@Autowired
	private PersonaService personaService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String show(Model model) {
		model.addAttribute("personas", personaService.getAll());
		return "visualizar-usuario";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(Model model) {
		return "crearUsuario";
	}
	
	@RequestMapping(value="/crear", method = RequestMethod.POST)
	public String processNewUser(Model model) {
		return "redirect:/usuario/mostrar";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxcall", method = RequestMethod.GET)
	public String populateModal(@RequestParam("person_id") int id) {
		Persona p = personaService.getById(id);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			return mapper.writeValueAsString(p);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
}
