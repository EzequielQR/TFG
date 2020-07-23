package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.util.UserUtil;

@Controller
public class HomeController {
	
	@Autowired
	private TatuadorService tatuadorService;

	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String welcome(Model model) {
		model.addAttribute("nombre", UserUtil.getUsuario().getNombre());
		
		//No hacer un getAll. Hacer un getByFecha. Por ende, traer los turnos de la fecha de hoy.
		model.addAttribute("list", tatuadorService.getTattooistWithActualAppointments());
		
		return "home";
	}
	
}
