package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetalleEtsRepository;
import edu.ues21.tattoo.service.FichaClinicaDetalleEtsService;

@Service
public class FichaClinicaDetalleEtsServiceImpl implements FichaClinicaDetalleEtsService {
	
	@Autowired
	private FichaClinicaDetalleEtsRepository fichaClinicaDetalleEtsRepository;

	@Override
	public int add(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		return fichaClinicaDetalleEtsRepository.add(fichaClinicaDetalleEts);
	}

	@Override
	public List<FichaClinicaDetalleEts> getAll() {
		// TODO Auto-generated method stub
		return fichaClinicaDetalleEtsRepository.getAll();
	}

	@Override
	public FichaClinicaDetalleEts getById(int id) {
		// TODO Auto-generated method stub
		return fichaClinicaDetalleEtsRepository.getById(id);
	}

	@Override
	public void update(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		fichaClinicaDetalleEtsRepository.update(fichaClinicaDetalleEts);
	}

	@Override
	public void delete(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		fichaClinicaDetalleEtsRepository.delete(fichaClinicaDetalleEts);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		fichaClinicaDetalleEtsRepository.delete(id);
	}

}