package edu.ues21.tattoo.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.util.StdDateFormat;

import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.PersonaService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.TurnoService;

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
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String create() {
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
		//TODO: FIXME remove hardcoded userlogged
		turno.setIniciadoPor(personaService.getById(11));
		turno.setListaProductosUtilizados(null);
		turno.setPrioridad(categoriaService.getById(Integer.parseInt(prioridadId)));
		turno.setSenia(Integer.parseInt(senia));
		turno.setTatuador(tatuadorService.getById(Integer.parseInt(tatuadorId)));
		turno.setTipoTatuaje(categoriaService.getById(Integer.parseInt(estiloTatuajeId)));

		turnoService.add(turno);
		
		if(btnPressed.equalsIgnoreCase("save"))
			return "redirect:/turno/mostrar";
		else
			return "redirect:/panel-asistente";
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
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String editAppointment(@RequestParam(required = true, name = "id-turno") String idAppointment, 
								  Model model) {
		model.addAttribute("turno", turnoService.getById(Integer.parseInt(idAppointment)));
		return "turno_editar";
	}

}