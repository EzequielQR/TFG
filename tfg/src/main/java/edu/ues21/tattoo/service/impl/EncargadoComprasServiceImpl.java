package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.repository.EncargadoComprasRepository;
import edu.ues21.tattoo.service.EncargadoComprasService;

@Service
public class EncargadoComprasServiceImpl implements EncargadoComprasService{

	@Autowired
	private EncargadoComprasRepository encargadoComprasRepository;

	@Override
	public int add(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		return encargadoComprasRepository.add(encargadoCompras);
	}

	@Override
	public List<EncargadoCompras> getAll() {
		// TODO Auto-generated method stub
		return encargadoComprasRepository.getAll();
	}

	@Override
	public EncargadoCompras getById(int id) {
		// TODO Auto-generated method stub
		return encargadoComprasRepository.getById(id);
	}

	@Override
	public void update(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		encargadoComprasRepository.update(encargadoCompras);
	}

	@Override
	public void delete(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		encargadoComprasRepository.delete(encargadoCompras);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		encargadoComprasRepository.delete(id);
	}
	
}
