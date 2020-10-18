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

import edu.ues21.tattoo.domain.Categoria;
import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.ProductoService;

@Controller
@RequestMapping(value = "/stock")
public class ProductoController {

	@Autowired
	private ProductoService productoService;
	@Autowired
	private CategoriaService categoriaService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String mostrar(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listaStock", productoService.getAll());
		return "producto_visualizar";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String crear(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("listaMarcas", categoriaService.getByTipo(6));
		model.addAttribute("listaProductos", categoriaService.getByTipo(7));
		return "producto_crear";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public String crear(@RequestParam(required = true, name = "brand-id") String marcaId,
						@RequestParam(required = true, name = "product-id") String productoId,
						@RequestParam(required = true, name = "quantity") String cantidad,
						@RequestParam(required = false, name = "color-ink") String colorTinta,
						@RequestParam(required = false, name = "description") String caracteristica) {
		
		Producto producto = new Producto();
		producto.setCantidad(Integer.parseInt(cantidad));
		producto.setMarca(categoriaService.getById(Integer.parseInt(marcaId)));
		producto.setTipoProducto(categoriaService.getById(Integer.parseInt(productoId)));

		if(productoId.equalsIgnoreCase("117"))
			producto.setCaracteristica("Color: " + colorTinta);
		else if(caracteristica.isEmpty())
			producto.setCaracteristica("No aplica");
		else
			producto.setCaracteristica(caracteristica);
		
		Producto existentProduct = productoService.getByFields(Integer.parseInt(marcaId), 
														 Integer.parseInt(productoId), 
														 producto.getCaracteristica());
		
		if (existentProduct == null) {
			productoService.add(producto);
		} else {
			existentProduct.setCantidad(existentProduct.getCantidad() + Integer.parseInt(cantidad));
			productoService.update(existentProduct);
		}
		
		return "redirect:/stock/mostrar";
	}

	@RequestMapping(value = "/redirectToCreationBrand", method = RequestMethod.POST)
	public String creationBrand(@RequestParam(required = true, name = "marca-modal") String brandName) {
		Categoria categoria = new Categoria();
		categoria.setDescripcion("Tipos de Marcas");
		categoria.setNombre(brandName);
		categoria.setTipo(6);
		
		categoriaService.add(categoria);
		
		return "redirect:/stock/crear";
	}
	
	@RequestMapping(value = "/redirectToCreationProduct", method = RequestMethod.POST)
	public String creationProduct(@RequestParam(required = true, name = "producto-modal") String productName) {
		Categoria categoria = new Categoria();
		categoria.setDescripcion("Tipos de Productos");
		categoria.setNombre(productName);
		categoria.setTipo(7);
		
		categoriaService.add(categoria);
		
		return "redirect:/stock/crear";
	}
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public String eliminar(@RequestParam(required = true, name = "id-producto") String idProducto) {
		productoService.delete(Integer.parseInt(idProducto));
		return "redirect:/stock/mostrar";
	}
}