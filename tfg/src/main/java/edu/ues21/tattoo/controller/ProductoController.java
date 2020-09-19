package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ues21.tattoo.service.ProductoService;

@Controller
@RequestMapping(value = "/stock")
public class ProductoController {

	@Autowired
	private ProductoService productoService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String mostrar() {
		return "producto_visualizar";
	}
	
}
