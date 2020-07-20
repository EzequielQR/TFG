package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetalleEtsRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class FichaClinicaDetalleEtsRepositoryImpl implements FichaClinicaDetalleEtsRepository{

	@Override
	public int add(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(fichaClinicaDetalleEts);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<FichaClinicaDetalleEts> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from FichaClinicaDetalleEts");
		List<FichaClinicaDetalleEts> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public FichaClinicaDetalleEts getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		FichaClinicaDetalleEts fichaClinicaDetalleEts = (FichaClinicaDetalleEts) session.get
				(FichaClinicaDetalleEts.class, id);
		session.getTransaction().commit();
		return fichaClinicaDetalleEts;
	}

	@Override
	public void update(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(fichaClinicaDetalleEts);
		session.getTransaction().commit();
	}

	@Override
	public void delete(FichaClinicaDetalleEts fichaClinicaDetalleEts) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(fichaClinicaDetalleEts);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete FichaClinicaDetalleEts where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}