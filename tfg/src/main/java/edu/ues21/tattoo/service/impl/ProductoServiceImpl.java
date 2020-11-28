package edu.ues21.tattoo.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.CredMail;
import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.Producto;
import edu.ues21.tattoo.domain.repository.CategoriaRepository;
import edu.ues21.tattoo.domain.repository.EncargadoComprasRepository;
import edu.ues21.tattoo.domain.repository.ProductoRepository;
import edu.ues21.tattoo.service.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoRepository productoRepository;
	@Autowired
	private CategoriaRepository categoriaRepository;
	@Autowired
	private EncargadoComprasRepository encargadoComprasRepository;
	
	@Override
	public int add(Producto producto) {
		// TODO Auto-generated method stub
		return productoRepository.add(producto);
	}

	@Override
	public List<Producto> getAll() {
		// TODO Auto-generated method stub
		return productoRepository.getAll();
	}

	@Override
	public Producto getById(int id) {
		// TODO Auto-generated method stub
		return productoRepository.getById(id);
	}

	@Override
	public Producto getByFields(int marcaId, int productoId, String caracteristica) {
		// TODO Auto-generated method stub
		return productoRepository.getByFields(marcaId, productoId, caracteristica);
	}
	
	@Override
	public void update(Producto producto) {
		// TODO Auto-generated method stub
		productoRepository.update(producto);
	}

	@Override
	public void delete(Producto producto) {
		// TODO Auto-generated method stub
		productoRepository.delete(producto);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		productoRepository.delete(id);
	}

	@Override
	public List<Producto> getByBrand(String brandName) {
		// TODO Auto-generated method stub
		int idBrand = categoriaRepository.giveIdByName(brandName);
		return productoRepository.getByBrand(idBrand);
	}

	@Override
	public List<Producto> getListByArray(int[] id) {
		// TODO Auto-generated method stub
		List<Producto> list = new ArrayList<Producto>();
		
		for(int index = 0; index < id.length; index++) {
			Producto p = productoRepository.getById(id[index]);
			p.setCantidad(p.getCantidad() - 1);
			
			list.add(p);
		}
		
		return list;
	}

	@Override
	public List<Integer> getAvailableProductsByAppointment(int appointmentId) {
		// TODO Auto-generated method stub
		return productoRepository.getAvailableProductsByAppointment(appointmentId);
	}

	@Override
	public List<Producto> removeElements(List<Producto> listaProductosUtilizados, int[] idProducts) {
		// TODO Auto-generated method stub
		for(int i = 0; i < listaProductosUtilizados.size(); i++) {
			
			for(int j = 0; j < idProducts.length; j++) {
				
				if(listaProductosUtilizados.get(i).getId() == idProducts[j]) {
					listaProductosUtilizados.remove(i);
					
					Producto p = productoRepository.getById(idProducts[j]);
					p.setCantidad(p.getCantidad() + 1);
					productoRepository.update(p);
					
					break;
				}
			}
			
		}
		
		return listaProductosUtilizados;
	}

	@Override
	public void notificationLowStock() {
		// TODO Auto-generated method stub
		List<Producto> listProductLowStock = productoRepository.getProductsLowStock();
		
		if(!listProductLowStock.isEmpty()) {
			List<EncargadoCompras> listEncargadoCompras = encargadoComprasRepository.getAll();
			
			for(int i = 0; i < listEncargadoCompras.size(); i++) {
				
				if(listEncargadoCompras.get(i).getPersona().getCorreoElectronico() != null &&
						!listEncargadoCompras.get(i).getPersona().getCorreoElectronico().isEmpty())
					sendMail(listEncargadoCompras.get(i).getPersona().getCorreoElectronico(), 
						getHTMLlowProducts(listProductLowStock));
			
			}
		}
	}
	
	private String getHTMLlowProducts(List<Producto> listProductLowStock) {
		String HTML = "";
		
		for(int i = 0; i < listProductLowStock.size(); i++) {
			HTML += "<li>"
						+ "Marca:&nbsp;"
						+ listProductLowStock.get(i).getMarca().getNombre()
						+ "&nbsp;-&nbsp;"
						+ listProductLowStock.get(i).getTipoProducto().getNombre()
						+ ".&nbsp;"
						+ "Característica:&nbsp;"
						+ listProductLowStock.get(i).getCaracteristica()
						+ ".&nbsp;"
						+ "<strong>Cantidad Actual:"
						+ listProductLowStock.get(i).getCantidad()
						+ "</strong>"
					+ "</li>";
		}
		
		return HTML;
	}
	
	private void sendMail(String mailDestino, String messageLowProductsHTML) {
		//TODO FIXME: Read both constants via external file.
		final String MAIL_ORIGEN = CredMail.ACCOUNT.getMail();
		final String PASSWORD = CredMail.ACCOUNT.getPassword();
		
		Properties properties = new Properties();
		
		//SSL:
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		 
		
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(MAIL_ORIGEN, PASSWORD);
			}
		});
		
		Message message = prepareMesage(session, MAIL_ORIGEN, mailDestino, messageLowProductsHTML);
		
		try {
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			
			properties.clear();
			//TLS:
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			
			session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication(MAIL_ORIGEN, PASSWORD);
				}
			});
			
			message = prepareMesage(session, MAIL_ORIGEN, mailDestino, messageLowProductsHTML);
			try {
				Transport.send(message);
			} catch (MessagingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	private Message prepareMesage(Session session, String mailOrigen, 
								  String mailDestino, String messageLowProductsHTML) {
		// TODO Auto-generated method stub
		final String TITULO_CORREO = "Stock en estado crítico";
		final String CUERPO_MENSAJE_HTML = "A continuación, se listan los productos con stock bajo.<br><br>"
									  + "<ul>"
									  + messageLowProductsHTML
									  + "</ul>";
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailOrigen));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailDestino));
			
			message.setSubject(TITULO_CORREO);
			message.setContent(CUERPO_MENSAJE_HTML, "text/html");
			
			return message;
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	}

}