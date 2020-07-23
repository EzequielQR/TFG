package edu.ues21.tattoo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.repository.TatuadorRepository;
import edu.ues21.tattoo.service.TatuadorService;

@Service
public class TatuadorServiceImpl implements TatuadorService{

	@Autowired
	private TatuadorRepository tatuadorRepository;

	@Override
	public int add(Tatuador tatuador) {
		// TODO Auto-generated method stub
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
		
		//TODO: Inspeccionar que ocurre cuando no existen tatuadores
		for(int index = 0; index < listTattooist.size(); index++) {
			//TODO: Inspeccionar que ocurre cuando un tatuador no tiene turnos!!!!!!!!
			
			if(listTattooist.get(index).getTurnos() != null) {
			
				for(int subIndex = 0; subIndex < listTattooist.get(index).getTurnos().size(); subIndex++) {
					if(fmt.format
							(listTattooist.get(index).getTurnos().get(subIndex).getFechaInicio())
							.equals(fmt.format(new Date())) == false) {
						listTattooist.get(index).getTurnos().remove(subIndex);
					}
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
}
