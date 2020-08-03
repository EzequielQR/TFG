package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Recepcionista;

public interface RecepcionistaService {
	int add(Recepcionista recepcionista);
	List<Recepcionista> getAll();
	Recepcionista getById(int id);
	void update(Recepcionista recepcionista);
	void delete(Recepcionista recepcionista);
	void delete(int id);
}