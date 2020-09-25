package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Producto;

public interface ProductoService {
	int add(Producto producto);
	List<Producto> getAll();
	Producto getById(int id);
	Producto getByFields(int marcaId, int productoId, String caracteristica);
	void update(Producto producto);
	void delete(Producto producto);
	void delete(int id);
}
