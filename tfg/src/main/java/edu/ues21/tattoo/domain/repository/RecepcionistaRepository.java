package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Recepcionista;

public interface RecepcionistaRepository {
	int add(Recepcionista recepcionista);
	List<Recepcionista> getAll();
	Recepcionista getById(int id);
	Recepcionista getByPersonId(int id);
	void update(Recepcionista recepcionista);
	void delete(Recepcionista recepcionista);
	void delete(int id);
}
