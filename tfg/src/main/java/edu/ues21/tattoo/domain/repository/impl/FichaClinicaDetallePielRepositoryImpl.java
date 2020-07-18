package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetallePielRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class FichaClinicaDetallePielRepositoryImpl implements FichaClinicaDetallePielRepository{

	@Override
	public int add(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(fichaClinicaDetallePiel);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<FichaClinicaDetallePiel> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from FichaClinicaDetallePiel");
		List<FichaClinicaDetallePiel> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public FichaClinicaDetallePiel getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		FichaClinicaDetallePiel fichaClinicaDetallePiel = (FichaClinicaDetallePiel) session.get
				(FichaClinicaDetallePiel.class, id);
		session.getTransaction().commit();
		return fichaClinicaDetallePiel;
	}

	@Override
	public void update(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(fichaClinicaDetallePiel);
		session.getTransaction().commit();
	}

	@Override
	public void delete(FichaClinicaDetallePiel fichaClinicaDetallePiel) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(fichaClinicaDetallePiel);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete FichaClinicaDetallePiel where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}