package edu.ues21.tattoo.service;

import java.util.Date;
import java.util.List;

import edu.ues21.tattoo.domain.EventDTO;
import edu.ues21.tattoo.domain.Turno;

public interface TurnoService {
	int add(Turno turno);
	List<Turno> getAll();
	List<EventDTO> getAllEventDTO();
	Turno getById(int id);
	void update(Turno turno);
	void delete(Turno turno);
	void delete(int id);
	boolean tattoistHasAvailableSlot(int idTattoist, Date dateStart, Date dateEnd);
	String getImagesJSON(String query);
	List<String> getImagesList(String query);
	void insertTurnosHASproductos(int idTurno, int idProducto);
	String translateStyleTattoo(String style);
}
