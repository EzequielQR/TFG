package edu.ues21.tattoo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.service.TurnoService;

@Controller
@RequestMapping(value = "/turno")
public class TurnoController {
	
	@Autowired
	private TurnoService turnoService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String create() {
		return "turno_visualizar";
	}
	
	//http://localhost:8080/tfg/turno/populateCalendar?start=2020-07-26&end=2020-09-06&_=1598590740208
	@ResponseBody
	@RequestMapping(value = "/populateCalendar", method = RequestMethod.GET)
	public String populateCalendar() {
		List<EventDTO> list = turnoService.getAllEventDTO();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list));
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}

}