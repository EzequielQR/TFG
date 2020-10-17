package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ues21.tattoo.service.TatuadorService;

@Controller
public class HomeController {
	
	@Autowired
	private TatuadorService tatuadorService;

	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String welcome(Model model) {
		//TODO: Remove Clavito
		model.addAttribute("nombre", "CLAVITO");
		model.addAttribute("list", tatuadorService.getTattooistWithActualAppointments());

		return "home";
	}
	
}
