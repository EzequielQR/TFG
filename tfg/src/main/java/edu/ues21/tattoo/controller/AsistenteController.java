package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.service.TurnoService;

@Controller
@RequestMapping(value = "/panel-asistente")
public class AsistenteController {
	
	@Autowired
	private TurnoService turnoService;
	
	@RequestMapping(value = "/opciones", method = RequestMethod.GET)
	public String asistente(@RequestParam(required = true, name = "id-turno") String idAppointment,
							@RequestParam(required = true, name = "estilo") String estilo,
							@RequestParam(required = false, name = "query") String query,
							Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listImg", turnoService.getImagesList(estilo + " " + query));
		model.addAttribute("idTurno", idAppointment);
		model.addAttribute("estilo", estilo);
		model.addAttribute("query", query);
		
		return "panel_asistente_crear";
	}
	
	@RequestMapping(value = "/guardar", method = RequestMethod.GET)
	public String guardar(@RequestParam(required = true, name = "id-turno") String idAppointment,
						  @RequestParam(required = true, name = "img") String imgURL) {
		Turno turno = turnoService.getById(Integer.parseInt(idAppointment));
		turno.setImagenURL(imgURL);
		turnoService.update(turno);
		
		return "redirect:/turno/mostrar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String editar(@RequestParam(required = true, name = "id-turno") String idAppointment,
						 @RequestParam(required = true, name = "estilo") String estilo,
						 @RequestParam(required = true, name = "img") String image,
						 @RequestParam(required = false, name = "query") String query,
						 Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listImg", turnoService.getImagesList(estilo + " " + query));
		model.addAttribute("idTurno", idAppointment);
		model.addAttribute("imgTurno", image);
		model.addAttribute("estilo", estilo);
		model.addAttribute("query", query);
		
		return "panel_asistente_editar";
	}

}