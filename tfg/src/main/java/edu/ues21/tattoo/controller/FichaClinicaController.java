package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.FichaClinicaDetalleEtsService;
import edu.ues21.tattoo.service.FichaClinicaDetallePielService;
import edu.ues21.tattoo.service.FichaClinicaService;

@Controller
@RequestMapping(value = "/ficha-clinica")
public class FichaClinicaController {
	
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private FichaClinicaService fichaClinicaService;
	@Autowired
	private FichaClinicaDetallePielService fichaClinicaDetallePielService;
	@Autowired
	private FichaClinicaDetalleEtsService fichaClinicaDetalleEtsService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String show(Model model) {
		try {
			int idClientFlashAttribute = (int) model.asMap().get("id_cliente");
			return "fichaClinica_visualizar";	
		} catch (NullPointerException e) {
			// NullPointerExcepction will execute when flash attributes doesn't exist
			return "error";
		}
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(Model model) {
		try {
			int idClienteFlashAttribute = (int) model.asMap().get("id_cliente");
			return "fichaClinica_crear";
		} catch (NullPointerException e) {
			// NullPointerExcepction will execute when flash attributes doesn't exist
			return "error";
		}
	}

}
