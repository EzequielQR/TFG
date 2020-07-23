package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Persona;

public interface PersonaRepository {
	int add(Persona persona);
	List<Persona> getAll();
	Persona getById(int id);
	void update(Persona persona);
	void delete(Persona persona);
	void delete(int id);
}
