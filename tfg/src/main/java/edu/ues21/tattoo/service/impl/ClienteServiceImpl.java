package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.repository.ClienteRepository;
import edu.ues21.tattoo.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService{

	@Autowired
	private ClienteRepository clienteRepository;

	@Override
	public int add(Cliente cliente) {
		// TODO Auto-generated method stub
		return clienteRepository.add(cliente);
	}

	@Override
	public List<Cliente> getAll() {
		// TODO Auto-generated method stub
		return clienteRepository.getAll();
	}

	@Override
	public Cliente getById(int id) {
		// TODO Auto-generated method stub
		return clienteRepository.getById(id);
	}

	@Override
	public Cliente getByPersonId(int idPerson) {
		// TODO Auto-generated method stub
		return clienteRepository.getByPersonId(idPerson);
	}
	
	@Override
	public void update(Cliente cliente) {
		// TODO Auto-generated method stub
		clienteRepository.update(cliente);
	}

	@Override
	public void delete(Cliente cliente) {
		// TODO Auto-generated method stub
		clienteRepository.delete(cliente);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		clienteRepository.delete(id);
	}
	
}
