package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Tatuador;

public interface TatuadorRepository {
	int add(Tatuador tatuador);
	List<Tatuador> getAll();
	Tatuador getById(int id);
	Tatuador getByPersonId(int idPerson);
	void update(Tatuador tatuador);
	void delete(Tatuador tatuador);
	void delete(int id);
}
