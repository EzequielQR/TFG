package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetallePielRepository;
import edu.ues21.tattoo.service.FichaClinicaDetallePielService;

@Service
public class FichaClinicaDetallePielServiceImpl implements FichaClinicaDetallePielService{

	@Autowired
	private FichaClinicaDetallePielRepository fichaClinicaDetallePielRepository;
	
	@Override
	public int add(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		return fichaClinicaDetallePielRepository.add(fichaClinicaDetallePiel);
	}

	@Override
	public List<FichaClinicaDetallePiel> getAll() {
		// TODO Auto-generated method stub
		return fichaClinicaDetallePielRepository.getAll();
	}

	@Override
	public FichaClinicaDetallePiel getById(int id) {
		// TODO Auto-generated method stub
		return fichaClinicaDetallePielRepository.getById(id);
	}

	@Override
	public void update(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		fichaClinicaDetallePielRepository.update(fichaClinicaDetallePiel);
	}

	@Override
	public void delete(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		fichaClinicaDetallePielRepository.delete(fichaClinicaDetallePiel);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		fichaClinicaDetallePielRepository.delete(id);
	}

}