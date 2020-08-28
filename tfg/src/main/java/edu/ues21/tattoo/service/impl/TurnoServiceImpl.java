package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.service.TurnoService;

@Service
public class TurnoServiceImpl implements TurnoService{
	
	@Autowired
	private TurnoRepository turnoRepository;

	@Override
	public int add(Turno turno) {
		// TODO Auto-generated method stub
		return turnoRepository.add(turno);
	}

	@Override
	public List<Turno> getAll() {
		// TODO Auto-generated method stub
		return turnoRepository.getAll();
	}

	@Override
	public Turno getById(int id) {
		// TODO Auto-generated method stub
		return turnoRepository.getById(id);
	}

	@Override
	public void update(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.update(turno);
	}

	@Override
	public void delete(Turno turno) {
		// TODO Auto-generated method stub
		turnoRepository.delete(turno);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		turnoRepository.delete(id);
	}

}