package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.repository.FichaClinicaRepository;
import edu.ues21.tattoo.service.FichaClinicaService;

@Service
public class FichaClinicaServiceImpl implements FichaClinicaService{
	
	@Autowired
	private FichaClinicaRepository fichaClinicaRepository;

	@Override
	public int add(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.add(fichaClinica);
	}

	@Override
	public List<FichaClinica> getAll() {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.getAll();
	}

	@Override
	public FichaClinica getById(int id) {
		// TODO Auto-generated method stub
		return fichaClinicaRepository.getById(id);
	}

	@Override
	public void update(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.update(fichaClinica);
	}

	@Override
	public void delete(FichaClinica fichaClinica) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.delete(fichaClinica);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		fichaClinicaRepository.delete(id);
	}

}