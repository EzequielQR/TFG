package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Categoria;

public interface CategoriaService {
	int add(Categoria categoria);
	List<Categoria> getAll();
	Categoria getById(int id);
	List<Categoria> getByTipo(int tipo);
	Categoria getByName(String name);
	void update(Categoria categoria);
	void delete(Categoria categoria);
	void delete(int id);
}
