package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Inventario;
import edu.ues21.tattoo.domain.repository.InventarioRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class InventarioRepositoryImpl implements InventarioRepository{

	@Override
	public int add(Inventario inventario) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(inventario);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Inventario> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Inventario");
		List<Inventario> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Inventario getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Inventario inventario = (Inventario) session.get(Inventario.class, id);
		session.getTransaction().commit();
		return inventario;
	}

	@Override
	public void update(Inventario inventario) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(inventario);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Inventario inventario) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(inventario);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Inventario where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}