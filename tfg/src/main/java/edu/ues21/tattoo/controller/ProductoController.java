package edu.ues21.tattoo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.util.StdDateFormat;

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
	public String creationBrand(@RequestParam(required = true, name = "marca-modal") String brandName,
								@RequestParam(required = false, name = "idProduct") String idProduct) {
		Categoria categoria = new Categoria();
		categoria.setDescripcion("Tipos de Marcas");
		categoria.setNombre(brandName);
		categoria.setTipo(6);
		
		categoriaService.add(categoria);
		
		if(idProduct == null)
			return "redirect:/stock/crear";
		else
			return "redirect:/stock/editar?id=" + idProduct;
	}
	
	@RequestMapping(value = "/redirectToCreationProduct", method = RequestMethod.POST)
	public String creationProduct(@RequestParam(required = true, name = "producto-modal") String productName,
								  @RequestParam(required = false, name = "idProduct") String idProduct) {
		Categoria categoria = new Categoria();
		categoria.setDescripcion("Tipos de Productos");
		categoria.setNombre(productName);
		categoria.setTipo(7);
		
		categoriaService.add(categoria);
		
		if(idProduct == null)
			return "redirect:/stock/crear";
		else
			return "redirect:/stock/editar?id=" + idProduct;
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String edit(@RequestParam(required = true, name = "id") int idProduct, Model model) {
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("product", productoService.getById(idProduct));
		
		model.addAttribute("listaMarcas", categoriaService.getByTipo(6));
		model.addAttribute("listaProductos", categoriaService.getByTipo(7));
		
		return "producto_editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String edit(@RequestParam(required = true, name = "idProduct") int idProduct,
					   @RequestParam(required = true, name = "brand-id") String marcaId,
					   @RequestParam(required = true, name = "product-id") String productoId,
					   @RequestParam(required = true, name = "quantity") String cantidad,
					   @RequestParam(required = false, name = "color-ink") String colorTinta,
					   @RequestParam(required = false, name = "description") String caracteristica) {
		Producto producto = productoService.getById(idProduct);
		
		producto.setCantidad(Integer.parseInt(cantidad));
		producto.setMarca(categoriaService.getById(Integer.parseInt(marcaId)));
		producto.setTipoProducto(categoriaService.getById(Integer.parseInt(productoId)));

		if(productoId.equalsIgnoreCase("117"))
			producto.setCaracteristica("Color: " + colorTinta);
		else if(caracteristica.isEmpty())
			producto.setCaracteristica("No aplica");
		else
			producto.setCaracteristica(caracteristica);
		
		productoService.update(producto);
		
		return "redirect:/stock/mostrar";
	}
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public String eliminar(@RequestParam(required = true, name = "id-producto") String idProducto) {
		productoService.delete(Integer.parseInt(idProducto));
		return "redirect:/stock/mostrar";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxcallprod", method = RequestMethod.GET)
	public String populateModal(@RequestParam("product_id") int id) {
		Producto producto = productoService.getById(id);
		
		List<Object> collection = new ArrayList<Object>();
		collection.add(producto);
		collection.add(producto.getListaTurnos());
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			StdDateFormat stdDateFormat = new StdDateFormat();
			
			//https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
			stdDateFormat.setTimeZone(TimeZone.getTimeZone("America/Argentina/Cordoba"));
			stdDateFormat.withColonInTimeZone(true);
			
			//Without the line above, the date will be show as unix time stamp.
			mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
			mapper.setDateFormat(stdDateFormat);
			
			return mapper.writeValueAsString(collection);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
	
}