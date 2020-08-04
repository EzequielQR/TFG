package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.EncargadoCompras;

public interface EncargadoComprasService {
	int add(EncargadoCompras encargadoCompras);
	List<EncargadoCompras> getAll();
	EncargadoCompras getById(int id);
	EncargadoCompras getByPersonId(int idPerson);
	void update(EncargadoCompras encargadoCompras);
	void delete(EncargadoCompras encargadoCompras);
	void delete(int id);
}
