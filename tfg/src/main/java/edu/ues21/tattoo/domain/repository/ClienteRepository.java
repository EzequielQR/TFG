package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.Cliente;

public interface ClienteRepository {
	int add(Cliente cliente);
	List<Cliente> getAll();
	Cliente getById(int id);
	void update(Cliente cliente);
	void delete(Cliente cliente);
	void delete(int id);
}
