package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Recepcionista;
import edu.ues21.tattoo.domain.repository.RecepcionistaRepository;
import edu.ues21.tattoo.service.RecepcionistaService;

@Service
public class RecepcionistaServiceImpl implements RecepcionistaService{

	@Autowired
	private RecepcionistaRepository recepcionistaRepository;

	@Override
	public int add(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		return recepcionistaRepository.add(recepcionista);
	}

	@Override
	public List<Recepcionista> getAll() {
		// TODO Auto-generated method stub
		return recepcionistaRepository.getAll();
	}

	@Override
	public Recepcionista getById(int id) {
		// TODO Auto-generated method stub
		return recepcionistaRepository.getById(id);
	}

	@Override
	public Recepcionista getByPersonId(int idPerson) {
		// TODO Auto-generated method stub
		return recepcionistaRepository.getByPersonId(idPerson);
	}
	
	@Override
	public void update(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		recepcionistaRepository.update(recepcionista);
	}

	@Override
	public void delete(Recepcionista recepcionista) {
		// TODO Auto-generated method stub
		recepcionistaRepository.delete(recepcionista);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		recepcionistaRepository.delete(id);
	}
	
}
