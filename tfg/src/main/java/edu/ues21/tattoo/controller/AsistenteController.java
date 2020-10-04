package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.service.TurnoService;

@Controller
@RequestMapping(value = "/panel-asistente")
public class AsistenteController {
	
	@Autowired
	private TurnoService turnoService;
	
	@RequestMapping(value = "/opciones", method = RequestMethod.GET)
	public String asistente(@RequestParam(required = true, name = "id-turno") String idAppointment,
							Model model) {
		
		turnoService.getImagesJSON("");
		
		return "panel_asistente";
	}

}
