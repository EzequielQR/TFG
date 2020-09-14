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
		//TODO: FIXME Linea 21: NullPointerExcecption
		model.addAttribute("nombre", UserUtil.getUsuario(null).getNombre());
		model.addAttribute("list", tatuadorService.getTattooistWithActualAppointments());

		return "home";
	}
	
}
