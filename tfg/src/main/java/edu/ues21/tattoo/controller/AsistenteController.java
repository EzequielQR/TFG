package edu.ues21.tattoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/panel-asistente")
public class AsistenteController {
	
	@RequestMapping(value = "/opciones", method = RequestMethod.GET)
	public String asistente(@RequestParam(required = true, name = "id-turno") String idAppointment,
							Model model) {
		return "panel_asistente";
	}

}
