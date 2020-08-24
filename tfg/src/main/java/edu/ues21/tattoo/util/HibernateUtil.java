package edu.ues21.tattoo.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import edu.ues21.tattoo.domain.Categoria;
import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;
import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;
import edu.ues21.tattoo.domain.Inventario;
import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.Recepcionista;
import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.Turno;
import edu.ues21.tattoo.domain.Usuario;

public class HibernateUtil {
	
	private static SessionFactory factory;

	private static Configuration getInitializedConfiguration() {
		AnnotationConfiguration config = new AnnotationConfiguration();
		//Add all your JPA annotated classes here
		config.addAnnotatedClass(Categoria.class);
		config.addAnnotatedClass(Cliente.class);
		config.addAnnotatedClass(EncargadoCompras.class);
		config.addAnnotatedClass(FichaClinica.class);
		config.addAnnotatedClass(FichaClinicaDetalleEts.class);
		config.addAnnotatedClass(FichaClinicaDetallePiel.class);
		config.addAnnotatedClass(Inventario.class);
		config.addAnnotatedClass(Persona.class);
		config.addAnnotatedClass(Producto.class);
		config.addAnnotatedClass(Recepcionista.class);
		config.addAnnotatedClass(Tatuador.class);
		config.addAnnotatedClass(Turno.class);
		config.addAnnotatedClass(Usuario.class);
		config.configure();
		return config;
	}
	
//	public static void recreateDatabase() {
//		Configuration config = HibernateUtil.getInitializedConfiguration();
//		new SchemaExport(config).create(true, true);
//	}
	
	private static Session getSession(){
		if(factory==null) {
			Configuration config = HibernateUtil.getInitializedConfiguration();
			factory = config.buildSessionFactory();
		}
		Session session = factory.getCurrentSession();
		return session;
	}
	
	public static Session beginTransaction() {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		return session;
	}
	
	public static void commitTransaction() {
		HibernateUtil.getSession().getTransaction().commit();
	}
	
	public static void closeSession() {
		HibernateUtil.getSession().close();
	}
	
	public static void rollbackTransaction() {
		HibernateUtil.getSession().getTransaction().rollback();
	}
	
}
