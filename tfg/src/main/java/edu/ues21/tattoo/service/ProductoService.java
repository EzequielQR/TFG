package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.Producto;

public interface ProductoService {
	int add(Producto producto);
	List<Producto> getAll();
	List<Producto> getByBrand(String brandName);
	Producto getById(int id);
	Producto getByFields(int marcaId, int productoId, String caracteristica);
	void update(Producto producto);
	void delete(Producto producto);
	void delete(int id);
	List<Producto> getListByArray(int[] id);
	List<Integer> getAvailableProductsByAppointment(int appointmentId);
	List<Producto> removeElements(List<Producto> listaProductosUtilizados, int[] idProducts);
}
