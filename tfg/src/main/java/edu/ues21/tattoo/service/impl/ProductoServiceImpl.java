package edu.ues21.tattoo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.repository.CategoriaRepository;
import edu.ues21.tattoo.domain.repository.ProductoRepository;
import edu.ues21.tattoo.service.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoRepository productoRepository;
	@Autowired
	private CategoriaRepository categoriaRepository;
	
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
	public Producto getByFields(int marcaId, int productoId, String caracteristica) {
		// TODO Auto-generated method stub
		return productoRepository.getByFields(marcaId, productoId, caracteristica);
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

	@Override
	public List<Producto> getByBrand(String brandName) {
		// TODO Auto-generated method stub
		int idBrand = categoriaRepository.giveIdByName(brandName);
		return productoRepository.getByBrand(idBrand);
	}

	@Override
	public List<Producto> getListByArray(int[] id) {
		// TODO Auto-generated method stub
		List<Producto> list = new ArrayList<Producto>();
		
		for(int index = 0; index < id.length; index++) {
			Producto p = productoRepository.getById(id[index]);
			p.setCantidad(p.getCantidad() - 1);
			
			list.add(p);
		}
		
		return list;
	}

	@Override
	public List<Integer> getAvailableProductsByAppointment(int appointmentId) {
		// TODO Auto-generated method stub
		return productoRepository.getAvailableProductsByAppointment(appointmentId);
	}

	@Override
	public List<Producto> removeElements(List<Producto> listaProductosUtilizados, int[] idProducts) {
		// TODO Auto-generated method stub
		for(int i = 0; i < listaProductosUtilizados.size(); i++) {
			
			for(int j = 0; j < idProducts.length; j++) {
				
				if(listaProductosUtilizados.get(i).getId() == idProducts[j]) {
					listaProductosUtilizados.remove(i);
					
					Producto p = productoRepository.getById(idProducts[j]);
					p.setCantidad(p.getCantidad() + 1);
					productoRepository.update(p);
					
					break;
				}
			}
			
		}
		
		return listaProductosUtilizados;
	}

}