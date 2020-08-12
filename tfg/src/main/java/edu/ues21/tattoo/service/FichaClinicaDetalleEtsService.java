package edu.ues21.tattoo.service;

import java.util.List;

import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;

public interface FichaClinicaDetalleEtsService {
	int add(FichaClinicaDetalleEts fichaClinicaDetalleEts);
	List<FichaClinicaDetalleEts> getAll();
	FichaClinicaDetalleEts getById(int id);
	void update(FichaClinicaDetalleEts fichaClinicaDetalleEts);
	void delete(FichaClinicaDetalleEts fichaClinicaDetalleEts);
	void delete(int id);
}
