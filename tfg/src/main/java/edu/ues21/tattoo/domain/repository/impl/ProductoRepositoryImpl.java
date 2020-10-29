package edu.ues21.tattoo.domain.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
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
	public Producto getByFields(int marcaId, int productoId, String caracteristica) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("FROM Producto "
						+ "WHERE marca.id = :brandId "
						+ "AND tipoProducto.id = :productId "
						+ "AND caracteristica = :caracteristic");
		query.setInteger("brandId", marcaId);
		query.setInteger("productId", productoId);
		query.setString("caracteristic", caracteristica);
		Producto producto = (Producto) query.uniqueResult();
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
		
		SQLQuery sqlQuery = session.createSQLQuery("DELETE FROM turnos_has_productos WHERE productos_id = :id");
		sqlQuery.setInteger("id", id);
		sqlQuery.executeUpdate();
		
		Query query = session.createQuery("delete Producto where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		
		session.getTransaction().commit();
	}

	@Override
	public List<Producto> getByBrand(int brandId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		Query query = session.createQuery("from Producto p WHERE p.marca.id = :brandId");
		query.setInteger("brandId", brandId);
		List<Producto> list = query.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public List<Integer> getAvailableProductsByAppointment(int appointmentId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.beginTransaction();
		SQLQuery sqlQuery = session.createSQLQuery("SELECT productos.id FROM productos "
				+ "WHERE productos.id NOT IN (SELECT turnos_has_productos.productos_id FROM turnos_has_productos "
										   + "WHERE turnos_has_productos.turnos_id = :idAppo) "
				+ "AND productos.cantidad > 0;");
		sqlQuery.setInteger("idAppo", appointmentId);
		List<Integer> list = sqlQuery.list();
		session.getTransaction().commit();
		return list;
	}
	
}