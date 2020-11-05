package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class TurnoRepositoryImpl implements TurnoRepository{

	@Override
	public int add(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(turno);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Turno> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Turno");
		List<Turno> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Turno getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Turno turno = (Turno) session.get(Turno.class, id);
		session.getTransaction().commit();
		return turno;
	}
	
	@Override
	public List<Turno> getAllByTattoist(int idTattoist){
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("SELECT t FROM Turno t WHERE t.tatuador.id = :idTattooer");
		query.setInteger("idTattooer", idTattoist);
		List<Turno> list = query.list();
		session.getTransaction().commit();
		return list;
	}
	
	@Override
	public List<Turno> getAllByTattoistAndSpecificDate(int idTattoist, String fechaInicio, String fechaFin){
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("SELECT t FROM Turno t WHERE (t.tatuador.id = :idTattooer) "
										+ "AND (t.fechaInicio BETWEEN :inicio AND :fin) "
										+ "OR (t.fechaFin BETWEEN :inicio AND :fin)");
		query.setInteger("idTattooer", idTattoist);
		
		query.setString("inicio", fechaInicio);
		query.setString("fin", fechaFin);
		
		List<Turno> list = query.list();
		session.getTransaction().commit();
		return list;
	}
	
	@Override
	public void update(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(turno);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Turno turno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(turno);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Turno where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}
	
	@Override
	public void insertTurnosHASproductos(int turnoId, int productoId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		SQLQuery query = session.createSQLQuery("INSERT INTO turnos_has_productos VALUES(:turno_id, :prod_id)");
		query.setInteger("turno_id", turnoId);
		query.setInteger("prod_id", productoId);
		
		query.executeUpdate();
		session.getTransaction().commit();
	}

	@Override
	public void deleteAllByCustomerId(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Turno where cliente.id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	@Override
	public void deleteAllByTattoistId(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Turno where tatuador.id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}