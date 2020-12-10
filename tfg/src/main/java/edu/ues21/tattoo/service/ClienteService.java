package edu.ues21.tattoo.service;

import java.util.Date;
import java.util.List;

import edu.ues21.tattoo.domain.Cliente;

public interface ClienteService {
	int add(Cliente cliente);
	List<Cliente> getAll();
	Cliente getById(int id);
	Cliente getByPersonId(int idPerson);
	void update(Cliente cliente);
	void delete(Cliente cliente);
	void delete(int id);
	void sendMailAppointment(String fullName, Date fecha, String correoElectronico);
	Cliente getByUsername(String username);
}
