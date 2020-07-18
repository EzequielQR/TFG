package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.repository.EncargadoComprasRepository;
import edu.ues21.tattoo.util.HibernateUtil;

public class EncargadoComprasRepositoryImpl implements EncargadoComprasRepository{

	@Override
	public int add(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(encargadoCompras);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<EncargadoCompras> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from EncargadoCompras");
		List<EncargadoCompras> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public EncargadoCompras getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		EncargadoCompras encargadoCompras = (EncargadoCompras) session.get(EncargadoCompras.class, id);
		session.getTransaction().commit();
		return encargadoCompras;
	}

	@Override
	public void update(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(encargadoCompras);
		session.getTransaction().commit();
	}

	@Override
	public void delete(EncargadoCompras encargadoCompras) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(encargadoCompras);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from EncargadoCompras where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}