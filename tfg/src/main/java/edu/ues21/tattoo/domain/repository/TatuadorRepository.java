package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Tatuador;

public interface TatuadorRepository {
	int add(Tatuador tatuador);
	List<Tatuador> getAll();
	Tatuador getById(int id);
	Tatuador getByPersonId(int idPerson);
	Tatuador getByUsername(String username);
	void update(Tatuador tatuador);
	void delete(Tatuador tatuador);
	void delete(int id);
	List<Tatuador> getTattoistWithActualAppointments(String fechaInicio, String fechaFin);
}
