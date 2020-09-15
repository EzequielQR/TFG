package edu.ues21.tattoo.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.service.TurnoService;

@Service
public class TurnoServiceImpl implements TurnoService{
	
	@Autowired
	private TurnoRepository turnoRepository;

	@Override
	public int add(Turno turno) {
		// TODO Auto-generated method stub
		return turnoRepository.add(turno);
	}

	@Override
	public List<Turno> getAll() {
		// TODO Auto-generated method stub
		return turnoRepository.getAll();
	}

	@Override
	public List<EventDTO> getAllEventDTO() {
		// TODO Auto-generated method stub
		return turnoToDTO(turnoRepository.getAll());
	}

	
	@Override
	public Turno getById(int id) {
		// TODO Auto-generated method stub
		return turnoRepository.getById(id);
	}

	@Override
	public void update(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.update(turno);
	}

	@Override
	public void delete(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.delete(turno);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		turnoRepository.delete(id);
	}

	@Override
	public boolean tattoistHasAvailableSlot(int idTattoist, Date dateStart, Date dateEnd) {
		// TODO Auto-generated method stub
		Date dateStartHourOffset = modifyHoursToJavaUtilDate(dateStart, -1);
		Date dateEndHourOffset = modifyHoursToJavaUtilDate(dateEnd, +1);

		String dayStartString = new SimpleDateFormat("yyyy-MM-dd").format(dateStart);
		String fechaInicioOffsetString = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dateStartHourOffset);
		String fechaFinOffsetString = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dateEndHourOffset);
		
		List<Turno> listaTurnos = turnoRepository.getAllByTattoistAndSpecificDate
				(idTattoist, dayStartString, fechaInicioOffsetString, fechaFinOffsetString);
		
		if(listaTurnos.isEmpty())
			return true;
		else
			return false;
	}
	
	private List<EventDTO> turnoToDTO(List<Turno> listaTurnos){
		List<EventDTO> listaDTO = new ArrayList<>();
		
		if(listaTurnos.isEmpty() == false) {
			for(int i = 0; i < listaTurnos.size();i++) {
				EventDTO eventDTO = new EventDTO();
				
				eventDTO.setId(listaTurnos.get(i).getId());
				eventDTO.setStart(listaTurnos.get(i).getFechaInicio());
				eventDTO.setEnd(listaTurnos.get(i).getFechaFin());
				eventDTO.setTitle(listaTurnos.get(i).getDescripcion());
				eventDTO.setColor(listaTurnos.get(i).getTatuador().getColor());
				
				listaDTO.add(eventDTO);
			}
			return listaDTO;
		} else {
			return listaDTO;
		}
			
	}
	
	private Date modifyHoursToJavaUtilDate(Date date, int hours) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    calendar.add(Calendar.HOUR_OF_DAY, hours);
	    return calendar.getTime();
	}

}