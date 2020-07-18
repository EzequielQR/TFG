package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Tatuador;

public interface TatuadorRepository {
	int add(Tatuador tatuador);
	List<Tatuador> getAll();
	Tatuador getById(int id);
	void update(Tatuador tatuador);
	void delete(Tatuador tatuador);
	void delete(int id);
}
