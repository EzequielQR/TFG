package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.repository.ProductoRepository;
import edu.ues21.tattoo.util.HibernateUtil;

@Repository
public class ProductoRepositoryImpl implements ProductoRepository{

	@Override
	public int add(Producto producto) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		int pk = (Integer) session.save(producto);
		session.getTransaction().commit();
		return pk;
	}

	@Override
	public List<Producto> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Producto");
		List<Producto> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Producto getById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Producto producto = (Producto) session.get(Producto.class, id);
		session.getTransaction().commit();
		return producto;
	}

	@Override
	public void update(Producto producto) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.update(producto);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Producto producto) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		session.delete(producto);
		session.getTransaction().commit();
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("delete Producto where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		session.getTransaction().commit();
	}

}