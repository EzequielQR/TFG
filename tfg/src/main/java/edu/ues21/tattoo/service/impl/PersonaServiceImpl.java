package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.domain.repository.PersonaRepository;
import edu.ues21.tattoo.service.PersonaService;

@Service
public class PersonaServiceImpl implements PersonaService{

	@Autowired
	private PersonaRepository personaRepository;
	
	@Override
	public int add(Persona persona) {
		// TODO Auto-generated method stub
		return personaRepository.add(persona);
	}

	@Override
	public List<Persona> getAll() {
		// TODO Auto-generated method stub
		return personaRepository.getAll();
	}

	@Override
	public Persona getById(int id) {
		// TODO Auto-generated method stub
		return personaRepository.getById(id);
	}

	@Override
	public void update(Persona persona) {
		// TODO Auto-generated method stub
		personaRepository.update(persona);
	}

	@Override
	public void delete(Persona persona) {
		// TODO Auto-generated method stub
		personaRepository.delete(persona);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		personaRepository.delete(id);
	}

}
