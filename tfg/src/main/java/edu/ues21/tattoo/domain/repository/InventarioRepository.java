package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Inventario;

public interface InventarioRepository {
	int add(Inventario inventario);
	List<Inventario> getAll();
	Inventario getById(int id);
	void update(Inventario inventario);
	void delete(Inventario inventario);
	void delete(int id);
}
