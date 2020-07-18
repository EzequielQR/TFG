package edu.ues21.tattoo.domain.repository;

import java.util.List;

import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;

public interface FichaClinicaDetallePielRepository {
	int add(FichaClinicaDetallePiel fichaClinicaDetallePiel);
	List<FichaClinicaDetallePiel> getAll();
	FichaClinicaDetallePiel getById(int id);
	void update(FichaClinicaDetallePiel fichaClinicaDetallePiel);
	void delete(FichaClinicaDetallePiel fichaClinicaDetallePiel);
	void delete(int id);
}
