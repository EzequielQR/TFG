package edu.ues21.tattoo.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.util.StdDateFormat;

import edu.ues21.tattoo.domain.CredCloudinary;
import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.PersonaService;
import edu.ues21.tattoo.service.ProductoService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.TurnoService;
import edu.ues21.tattoo.service.UsuarioService;

@Controller
@RequestMapping(value = "/turno")
public class TurnoController {
	
	@Autowired
	private TurnoService turnoService;
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private CategoriaService categoriaService;
	@Autowired
	private PersonaService personaService;
	@Autowired
	private ProductoService productoService;
	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String showCalendar(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		model.addAttribute("listTatuadores", tatuadorService.getAll());
		return "turno_visualizar";
	}
	
	//http://localhost:8080/tfg/turno/populateCalendar?start=2020-07-26&end=2020-09-06&_=1598590740208
	@ResponseBody
	@RequestMapping(value = "/populateCalendar", method = RequestMethod.GET)
	public String populateCalendar() {
		List<EventDTO> list = turnoService.getAllEventDTO();
		
		/*
		DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		String string1 = "2020-08-12T12:00:00";
		
		- - -
		
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm");
	    df.setTimeZone(TimeZone.getTimeZone("UTC"));
	 
	    Date date = df.parse("01-01-1970 01:00");
		*/
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			StdDateFormat stdDateFormat = new StdDateFormat();
			
			//https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
			stdDateFormat.setTimeZone(TimeZone.getTimeZone("America/Argentina/Cordoba"));
			stdDateFormat.withColonInTimeZone(true);
			
			//Without the line above, the date will be show as unix time stamp.
			mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
			mapper.setDateFormat(stdDateFormat);
			System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list));
			
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/redirectToCreation", method = RequestMethod.POST)
	public String redirectToCreate(@RequestParam(required = true, name = "fecha-elegida") String fechaElegida) {
		return "redirect:/turno/crear?fecha-elegida=" + fechaElegida;
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String createAppointment(@RequestParam(required = true, name = "fecha-elegida") String fechaElegida,
									Model model){
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("fecha_hidden", fechaElegida);
		model.addAttribute("listaPrioridades", categoriaService.getByTipo(2));
		model.addAttribute("listaEstiloTatuajes", categoriaService.getByTipo(5));
		model.addAttribute("listaTatuadores", tatuadorService.getAll());
		model.addAttribute("listaClientes", clienteService.getAll());
		
		return "turno_crear";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public String createAppointment(@RequestParam(required = true, name = "fecha-elegida") String fechaElegida,
									@RequestParam(required = true, name = "hour_start") String horaInicio,
									@RequestParam(required = true, name = "hour_end") String horaFin,
									@RequestParam(required = true, name = "advance_payment") String senia,
									@RequestParam(required = true, name = "priority_id") String prioridadId,
									@RequestParam(required = true, name = "tattooist_id") String tatuadorId,
									@RequestParam(required = true, name = "tattoo_style_id") String estiloTatuajeId,
									@RequestParam(required = true, name = "customer_id") String clienteId,
									@RequestParam(required = false, name = "description")String descripcion,
									@RequestParam(required = true, name = "action") String btnPressed,
									@RequestParam(required = false, name = "query") String query,
									@RequestParam(required = false, name = "place_tattoo") String placeTattoo,
									@RequestParam(required = false, name = "skin_color") String skinColor,
									@RequestParam(required = false, name = "size_tattoo") String sizeTattoo,
									Model model){
		Turno turno = new Turno();
		turno.setCliente(clienteService.getById(Integer.parseInt(clienteId)));
		turno.setDescripcion(descripcion);
		turno.setEstado(categoriaService.getByName("Abierto"));
		try {
			turno.setFechaInicio(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(fechaElegida + " " + horaInicio));
			turno.setFechaFin(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(fechaElegida + " " + horaFin));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			turno.setUsuario(usuarioService.getById(user.getUsername()));
		}
		
		turno.setListaProductosUtilizados(null);
		turno.setPrioridad(categoriaService.getById(Integer.parseInt(prioridadId)));
		turno.setSenia(Integer.parseInt(senia));
		turno.setTatuador(tatuadorService.getById(Integer.parseInt(tatuadorId)));
		turno.setTipoTatuaje(categoriaService.getById(Integer.parseInt(estiloTatuajeId)));

		int idTurno = turnoService.add(turno);
		
		clienteService.sendMailAppointment(turno.getCliente().getPersona().getApellido() 
				+ ", " + turno.getCliente().getPersona().getNombre(),
				turno.getFechaInicio(),
				turno.getCliente().getPersona().getCorreoElectronico());
		
		if(btnPressed.equalsIgnoreCase("save"))
			return "redirect:/turno/mostrar";
		else
			return "redirect:/panel-asistente/opciones?id-turno=" + idTurno + 
					"&estilo=" + turno.getTipoTatuaje().getNombre() + 
					"&query="  + query +
					"&place_tattoo=" + (placeTattoo != null && !placeTattoo.trim().isEmpty() ? placeTattoo : "") +
					"&skin_color=" + (skinColor != null && !skinColor.trim().isEmpty() ? skinColor : "") +
					"&size_tattoo=" + (sizeTattoo != null && !sizeTattoo.trim().isEmpty() ? sizeTattoo : "");
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxAppointmentDetails", method = RequestMethod.GET)
	public String populateAppointmentDetailsModal(@RequestParam("id_appointment") int idAppointment) {
		Turno turno = turnoService.getById(idAppointment);
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			StdDateFormat stdDateFormat = new StdDateFormat();

			//https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
			stdDateFormat.setTimeZone(TimeZone.getTimeZone("America/Argentina/Cordoba"));
			stdDateFormat.withColonInTimeZone(true);
			
			//Without the line above, the date will be show as unix time stamp.
			mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
			mapper.setDateFormat(stdDateFormat);
			System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(turno));
			
			if(turno.getPublicId() != null && !turno.getPublicId().trim().isEmpty()){
				try {
					Cloudinary c = new Cloudinary(ObjectUtils.asMap(
							"cloud_name", CredCloudinary.ACCOUNT.getCloudName(),
							"api_key", CredCloudinary.ACCOUNT.getApiKey(),
							"api_secret", CredCloudinary.ACCOUNT.getApiSecret()));
					
					Map result = c.api().resource(turno.getPublicId(), ObjectUtils.emptyMap());
					turno.setPublicId(result.get("url").toString());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return mapper.writeValueAsString(turno);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
	
	@RequestMapping(value = "/actionDetailsAppointment", method = RequestMethod.POST)
	public String redirectToActionDetailsAppointment(
								@RequestParam(required = true, name = "id-appointment") String idAppointment,
								@RequestParam(required = true, name = "btn-action") String btnAction) {
		if(btnAction.equalsIgnoreCase("edit")) {
			return "redirect:/turno/editar?id-turno=" + idAppointment;
		} else {
			turnoService.delete(Integer.parseInt(idAppointment));
			return "redirect:/turno/mostrar";
		}
	}
	
	@RequestMapping(value = "/actionAddproductsToAppointment", method = RequestMethod.POST)
	public String addProductsToAppointment(
								@RequestParam(required = true, name = "id-appointment") int idAppointment,
								@RequestParam(required = true, name = "prodId[]") int[] idProducts) {
		
		Turno turno = turnoService.getById(idAppointment);
		List<Producto> list = productoService.getListByArray(idProducts);
			
		//Se hace merge
		list.addAll(turno.getListaProductosUtilizados());
		
		turno.setListaProductosUtilizados(list);
		turnoService.update(turno);
		
		return "redirect:/turno/mostrar";
	}
	
	@RequestMapping(value = "/actionDeleteproductsToAppointment", method = RequestMethod.POST)
	public String deleteProductsToAppointment(
							@RequestParam(required = true, name = "id-appointment") int idAppointment,
							@RequestParam(required = true, name = "prodId[]") int[] idProducts) {
		
		Turno turno = turnoService.getById(idAppointment);
		
		List<Producto> root = turno.getListaProductosUtilizados();
		
		turno.setListaProductosUtilizados(productoService.removeElements(turno.getListaProductosUtilizados(),
																		 idProducts));
		turnoService.update(turno);
		
		return "redirect:/turno/mostrar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String editAppointment(@RequestParam(required = true, name = "id-turno") String idAppointment, 
								  Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("turno", turnoService.getById(Integer.parseInt(idAppointment)));
		
		model.addAttribute("listaPrioridades", categoriaService.getByTipo(2));
		model.addAttribute("listaEstiloTatuajes", categoriaService.getByTipo(5));
		model.addAttribute("listaTatuadores", tatuadorService.getAll());
		model.addAttribute("listaClientes", clienteService.getAll());
		
		return "turno_editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String editAppointment(@RequestParam(required = true, name = "id-turno") String idAppointment,
								  @RequestParam(required = true, name = "fecha-elegida") String fechaElegida,
								  @RequestParam(required = true, name = "hour_start") String horaInicio,
								  @RequestParam(required = true, name = "hour_end") String horaFin,
								  @RequestParam(required = true, name = "advance_payment") String senia,
								  @RequestParam(required = true, name = "priority_id") String prioridadId,
								  @RequestParam(required = true, name = "tattooist_id") String tatuadorId,
								  @RequestParam(required = true, name = "tattoo_style_id") String estiloTatuajeId,
								  @RequestParam(required = true, name = "customer_id") String clienteId,
								  @RequestParam(required = false, name = "description")String descripcion,
								  @RequestParam(required = true, name = "action") String btnPressed,
								  @RequestParam(required = false, name = "selected-file") MultipartFile selectedFile,
								  @RequestParam(required = false, name = "query") String query,
								  @RequestParam(required = false, name = "place_tattoo") String placeTattoo,
								  @RequestParam(required = false, name = "skin_color") String skinColor,
								  @RequestParam(required = false, name = "size_tattoo") String sizeTattoo,
								  Model model) {
		Turno turno = turnoService.getById(Integer.parseInt(idAppointment));
		
		turno.setCliente(clienteService.getById(Integer.parseInt(clienteId)));
		turno.setDescripcion(descripcion);
		turno.setEstado(categoriaService.getByName("Abierto"));
		
		try {
			turno.setFechaInicio(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(fechaElegida + " " + horaInicio));
			turno.setFechaFin(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(fechaElegida + " " + horaFin));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		turno.setPrioridad(categoriaService.getById(Integer.parseInt(prioridadId)));
		turno.setSenia(Integer.parseInt(senia));
		turno.setTatuador(tatuadorService.getById(Integer.parseInt(tatuadorId)));
		turno.setTipoTatuaje(categoriaService.getById(Integer.parseInt(estiloTatuajeId)));
		
		if(selectedFile != null && !selectedFile.isEmpty()) {
			try {
				byte[] bytes = selectedFile.getBytes();
				
				Cloudinary c = new Cloudinary(ObjectUtils.asMap(
						"cloud_name", CredCloudinary.ACCOUNT.getCloudName(),
						"api_key", CredCloudinary.ACCOUNT.getApiKey(),
						"api_secret", CredCloudinary.ACCOUNT.getApiSecret()));
				
				Map result = c.uploader().upload(bytes, ObjectUtils.emptyMap());
				turno.setPublicId(result.get("public_id").toString());
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
				
		}
		
		turnoService.update(turno);
		
		String params = (placeTattoo != null && !placeTattoo.trim().isEmpty() ? placeTattoo : "")
				+ " " 
				+ (skinColor != null && !skinColor.trim().isEmpty() ? skinColor : "")
				+ " "
				+ (sizeTattoo != null && !sizeTattoo.trim().isEmpty() ? sizeTattoo : "");
		
		if(btnPressed.equalsIgnoreCase("edit"))
			return "redirect:/turno/mostrar";
		else
			return "redirect:/panel-asistente/editar?id-turno=" + turno.getId() +
					"&estilo=" + turno.getTipoTatuaje().getNombre() + 
					"&img=" + turno.getImagenURL() +
					"&query=" + query +
					"&params=" + params.trim();
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxUpdateDraggedEvent", method = RequestMethod.GET)
	public String updateDraggedAppointment(@RequestParam("id_appointment") int idAppointment,
										   @RequestParam("picked_date") String stringPickedDate) {
		
		Turno turno = turnoService.getById(idAppointment);
		
		try {
			//stringPickedDate = 2020-09-03T11:38:58
			Date pickedDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(stringPickedDate);
			
			String newDate = new SimpleDateFormat("yyyy-MM-dd").format(pickedDate);
			String hourStart = new SimpleDateFormat("HH:mm").format(turno.getFechaInicio());
			String hourEnd = new SimpleDateFormat("HH:mm").format(turno.getFechaFin());
			
			Date fechaInicio = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(newDate + " " + hourStart);
			Date fechaFin = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(newDate + " " + hourEnd);
			
			
			if(turnoService.tattoistHasAvailableSlot(turno.getTatuador().getId(), fechaInicio, fechaFin)) {
				turno.setFechaInicio(fechaInicio);
				turno.setFechaFin(fechaFin);

				turnoService.update(turno);
				
				return "success";
			}
			else {
				return "not-available";
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "parse-error";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxCreateTableTab2", method = RequestMethod.GET)
	public String createTableTab2AvailableProducts(@RequestParam("id_appointment") int idAppointment) {
		
		List<Integer> listId = productoService.getAvailableProductsByAppointment(idAppointment);
		
		if(listId != null && !listId.isEmpty()) {
			List<Producto> listProducto = new ArrayList<Producto>();
			
			for(int i = 0; i < listId.size(); i ++)
				listProducto.add(productoService.getById(listId.get(i)));
		
			ObjectMapper mapper = new ObjectMapper();
			
			try {
				return mapper.writeValueAsString(listProducto);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "not-found-available-products";
	}

	@ResponseBody
	@RequestMapping(value = "/ajaxDeletePhotoPostSession", method = RequestMethod.GET)
	public String deletePhotoPostSession(@RequestParam("id_appointment") int idAppointment) {

		Turno turno = turnoService.getById(idAppointment);
		
		try {
			Cloudinary c = new Cloudinary(ObjectUtils.asMap(
					"cloud_name", CredCloudinary.ACCOUNT.getCloudName(),
					"api_key", CredCloudinary.ACCOUNT.getApiKey(),
					"api_secret", CredCloudinary.ACCOUNT.getApiSecret()));
			
			c.uploader().destroy(turno.getPublicId(), ObjectUtils.emptyMap());
			
			turno.setPublicId(null);
			turnoService.update(turno);

			return "success";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
}