package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.repository.ProductoRepository;
import edu.ues21.tattoo.service.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoRepository productoRepository;
	
	@Override
	public int add(Producto producto) {
		// TODO Auto-generated method stub
		return productoRepository.add(producto);
	}

	@Override
	public List<Producto> getAll() {
		// TODO Auto-generated method stub
		return productoRepository.getAll();
	}

	@Override
	public Producto getById(int id) {
		// TODO Auto-generated method stub
		return productoRepository.getById(id);
	}

	@Override
	public void update(Producto producto) {
		// TODO Auto-generated method stub
		productoRepository.update(producto);
	}

	@Override
	public void delete(Producto producto) {
		// TODO Auto-generated method stub
		productoRepository.delete(producto);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		productoRepository.delete(id);
	}

}
