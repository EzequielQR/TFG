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
import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.EncargadoComprasService;
import edu.ues21.tattoo.service.PersonaService;
import edu.ues21.tattoo.service.RecepcionistaService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.UsuarioService;

@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {

	@Autowired
	private PersonaService personaService;
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private RecepcionistaService recepcionistaService;
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private EncargadoComprasService encargadoComprasService;
	@Autowired
	private UsuarioService usuarioService;
	
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
		Persona persona = personaService.getById(id);
		Object generic = new Object();
		
		switch (persona.getRol().getNombre().toLowerCase()) {
		case "tatuador":
			generic = tatuadorService.getByPersonId(id);
			break;
			
		case "cliente":
			generic = clienteService.getByPersonId(id);
			break;
			
		case "encargado de compras":
			generic = encargadoComprasService.getByPersonId(id);
			break;
			
		case "recepcionista":
			generic = recepcionistaService.getByPersonId(id);
			break;
			
		default:
			System.err.println("Rol no soportado");
			break;
		}
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			System.out.println(mapper.writeValueAsString(persona));
			System.out.println(mapper.writeValueAsString(generic));
			
			return mapper.writeValueAsString(persona);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
}
