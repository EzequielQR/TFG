package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Producto;

public interface ProductoRepository {
	int add(Producto producto);
	List<Producto> getAll();
	List<Producto> getByBrand(int brandId);
	Producto getById(int id);
	Producto getByFields(int marcaId, int productoId, String caracteristica);
	void update(Producto producto);
	void delete(Producto producto);
	void delete(int id);
	List<Integer> getAvailableProductsByAppointment(int appointmentId);
}
