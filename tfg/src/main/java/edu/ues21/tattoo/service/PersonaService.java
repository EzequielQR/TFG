package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Persona;

public interface PersonaService {
	int add(Persona persona);
	List<Persona> getAll();
	Persona getById(int id);
	void update(Persona persona);
	void delete(Persona persona);
	void delete(int id);
}
