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

import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.TurnoService;

@Controller
@RequestMapping(value = "/backup")
public class BackupController {

	@Autowired
	private TurnoService turnoService;
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private CategoriaService categoriaService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String show(Model model) {
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listAppointment", turnoService.getAppointmentsWithCloudinaryPhotos());
		model.addAttribute("listTattooist", tatuadorService.getAll());
		model.addAttribute("listTattooStyle", categoriaService.getByTipo(5));
		
		return "backup";
	}
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public String delete(@RequestParam(required = true, name = "id-turno") int idAppointment) {
		turnoService.deleteCloudinaryField(idAppointment);
		return "redirect:/backup";
	}
	
	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	public String filter(@RequestParam(required = false, name = "description") String description,
			             @RequestParam(required = false, name = "tattooist-nickname") String nickTattoist,
			             @RequestParam(required = false, name = "id-style-tattoo") String styleTattoo,
			             Model model){
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listAppointment", 
				turnoService.filterAppointmentWithCloudinaryPhotos(description, nickTattoist,styleTattoo));
		model.addAttribute("listTattooist", tatuadorService.getAll());
		model.addAttribute("listTattooStyle", categoriaService.getByTipo(5));
		
		return "backup";
	}
}
