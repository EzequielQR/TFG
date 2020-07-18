package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Categoria;

public interface CategoriaRepository {
	int add(Categoria categoria);
	List<Categoria> getAll();
	Categoria getById(int id);
	void update(Categoria categoria);
	void delete(Categoria categoria);
	void delete(int id);
}
