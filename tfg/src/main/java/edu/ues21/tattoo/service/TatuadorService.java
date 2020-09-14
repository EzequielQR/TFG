package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Tatuador;

public interface TatuadorService {
	int add(Tatuador tatuador);
	List<Tatuador> getAll();
	List<Tatuador> getTattooistWithActualAppointments();
	Tatuador getById(int id);
	Tatuador getByPersonId(int idPerson);
	void update(Tatuador tatuador);
	void delete(Tatuador tatuador);
	void delete(int id);
	List<Tatuador> getTattoistWithActualAppointments();
}
