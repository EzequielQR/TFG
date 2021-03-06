package edu.ues21.tattoo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Color;
import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TatuadorRepository;
import edu.ues21.tattoo.service.TatuadorService;

@Service
public class TatuadorServiceImpl implements TatuadorService{

	@Autowired
	private TatuadorRepository tatuadorRepository;

	@Override
	public int add(Tatuador tatuador) {
		// TODO Auto-generated method stub
		tatuador.setColor(getAvailableColor());
		return tatuadorRepository.add(tatuador);
	}

	@Override
	public List<Tatuador> getAll() {
		// TODO Auto-generated method stub
		return tatuadorRepository.getAll();
	}

	@Override
	public List<Tatuador> getTattooistWithActualAppointments() {
		// TODO Auto-generated method stub
		List<Tatuador> listTattooist = tatuadorRepository.getAll();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int index = 0; index < listTattooist.size(); index++) {
			
			if(listTattooist.get(index).getTurnos() != null) {
				  Iterator<Turno> itr = listTattooist.get(index).getTurnos().iterator();
				  
				  while(itr.hasNext()){
					  Turno t = itr.next();
					
					  if(fmt.format(t.getFechaInicio()).equals(fmt.format(new Date())) == false) 
						  itr.remove();
				}
			}
		}
		return listTattooist;
	}
	
	@Override
	public Tatuador getById(int id) {
		// TODO Auto-generated method stub
		return tatuadorRepository.getById(id);
	}

	@Override
	public Tatuador getByPersonId(int idPerson) {
		// TODO Auto-generated method stub
		return tatuadorRepository.getByPersonId(idPerson);
	}
	
	@Override
	public void update(Tatuador tatuador) {
		// TODO Auto-generated method stub
		tatuadorRepository.update(tatuador);
	}

	@Override
	public void delete(Tatuador tatuador) {
		// TODO Auto-generated method stub
		tatuadorRepository.delete(tatuador);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		tatuadorRepository.delete(id);
	}

	private String getAvailableColor() {
		// TODO Auto-generated method stub
		List<Tatuador> tattooistList = tatuadorRepository.getAll();
		boolean flag;
		
		for(Color col : Color.values()) {
			flag = true;
			
			for(int i = 0; i < tattooistList.size(); i++) {
				
				if(tattooistList.get(i).getColor().equalsIgnoreCase(col.getHexadecimal())) {
					flag = false;
					break;
				}
				
			}
			
			if(flag == true)
				return col.getHexadecimal();
			else {
				flag = false;
			}
		}
		
		return generateRandomHexColor();
	}
	
	private String generateRandomHexColor() {
		Random random = new Random();
		int randomNumber = random.nextInt(0xffffff + 1);
		
		String colorCode = String.format("#%06x", randomNumber);
		
		return colorCode;
	}

	@Override
	public List<Tatuador> getTattoistWithActualAppointments() {
		// TODO Auto-generated method stub
		String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		return tatuadorRepository.getTattoistWithActualAppointments(fechaActual + " " + "00:00:00", 
																	fechaActual + " " + "23:59:59");
	}

}