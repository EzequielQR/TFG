package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Categoria;
import edu.ues21.tattoo.domain.repository.CategoriaRepository;
import edu.ues21.tattoo.service.CategoriaService;

@Service
public class CategoriaServiceImpl implements CategoriaService{

	@Autowired
	private CategoriaRepository categoriaRepository;
	
	@Override
	public int add(Categoria categoria) {
		// TODO Auto-generated method stub
		return categoriaRepository.add(categoria);
	}

	@Override
	public List<Categoria> getAll() {
		// TODO Auto-generated method stub
		return categoriaRepository.getAll();
	}

	@Override
	public Categoria getById(int id) {
		// TODO Auto-generated method stub
		return categoriaRepository.getById(id);
	}
	
	@Override
	public List<Categoria> getByTipo(int tipo) {
		// TODO Auto-generated method stub
		return categoriaRepository.getByTipo(tipo);
	}

	@Override
	public Categoria getByName(String name) {
		// TODO Auto-generated method stub
		return categoriaRepository.getByName(name);
	}
	
	@Override
	public void update(Categoria categoria) {
		// TODO Auto-generated method stub
		categoriaRepository.update(categoria);
	}

	@Override
	public void delete(Categoria categoria) {
		// TODO Auto-generated method stub
		categoriaRepository.delete(categoria);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		categoriaRepository.delete(id);
	}

}