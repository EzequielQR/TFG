package edu.ues21.tattoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.ClienteService;
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
			mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
			mapper.setDateFormat(new StdDateFormat().withColonInTimeZone(true));
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
		model.addAttribute("listaTatuadores", tatuadorService.getAll());
		model.addAttribute("listaClientes", clienteService.getAll());
		
		return "turno_crear";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public String createAppointment(@RequestParam(required = true, name = "fecha-elegida") String fechaElegida,
									String descripcion,
									Model model){
		System.out.println("POST: " +fechaElegida);
		return "";
	}

}