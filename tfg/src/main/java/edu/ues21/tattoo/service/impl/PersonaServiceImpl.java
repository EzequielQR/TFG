package edu.ues21.tattoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.domain.Recepcionista;
import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.repository.ClienteRepository;
import edu.ues21.tattoo.domain.repository.EncargadoComprasRepository;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetalleEtsRepository;
import edu.ues21.tattoo.domain.repository.FichaClinicaDetallePielRepository;
import edu.ues21.tattoo.domain.repository.FichaClinicaRepository;
import edu.ues21.tattoo.domain.repository.PersonaRepository;
import edu.ues21.tattoo.domain.repository.RecepcionistaRepository;
import edu.ues21.tattoo.domain.repository.TatuadorRepository;
import edu.ues21.tattoo.domain.repository.TurnoRepository;
import edu.ues21.tattoo.domain.repository.UsuarioRepository;
import edu.ues21.tattoo.service.PersonaService;

@Service
public class PersonaServiceImpl implements PersonaService{

	@Autowired
	private PersonaRepository personaRepository;
	@Autowired
	private TatuadorRepository tatuadorRepository;
	@Autowired
	private EncargadoComprasRepository encargadoComprasRepository;
	@Autowired
	private RecepcionistaRepository recepcionistaRepository;
	@Autowired
	private ClienteRepository clienteRepository;
	@Autowired
	private FichaClinicaRepository fichaClinicaRepository;
	@Autowired
	private FichaClinicaDetalleEtsRepository fichaClinicaDetalleEtsRepository;
	@Autowired
	private FichaClinicaDetallePielRepository fichaClinicaDetallePielRepository;
	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private TurnoRepository turnoRepository;
	
	@Override
	public int add(Persona persona) {
		// TODO Auto-generated method stub
		return personaRepository.add(persona);
	}

	@Override
	public List<Persona> getAll() {
		// TODO Auto-generated method stub
		return personaRepository.getAll();
	}

	@Override
	public Persona getById(int id) {
		// TODO Auto-generated method stub
		return personaRepository.getById(id);
	}

	@Override
	public void update(Persona persona) {
		// TODO Auto-generated method stub
		personaRepository.update(persona);
	}

	@Override
	public void delete(Persona persona) {
		// TODO Auto-generated method stub
		personaRepository.delete(persona);
	}

	@Override
	public void delete(int id, String role) {
		// TODO Auto-generated method stub
		if(role.equalsIgnoreCase("cliente")) {
			Cliente cliente = clienteRepository.getByPersonId(id);

			turnoRepository.deleteAllByCustomerId(cliente.getId());
			
			fichaClinicaDetallePielRepository.delete(cliente.getFichaClinica().getFichaClinicaDetallePiel().getId());
			fichaClinicaDetalleEtsRepository.delete(cliente.getFichaClinica().getFichaClinicaDetalleEts().getId());
			fichaClinicaRepository.delete(cliente.getFichaClinica().getId());
			
			clienteRepository.delete(cliente.getId());
		}
		else if(role.equalsIgnoreCase("tatuador")) {
			Tatuador tatuador = tatuadorRepository.getByPersonId(id);
			
			turnoRepository.deleteAllByTattoistId(tatuador.getId());
			
			usuarioRepository.disable(tatuador.getUsuario().getNombre());
			tatuadorRepository.delete(tatuador.getId());
		}
		else if(role.equalsIgnoreCase("recepcionista")) {
			Recepcionista recepcionista = recepcionistaRepository.getByPersonId(id);
			
			usuarioRepository.disable(recepcionista.getUsuario().getNombre());
			recepcionistaRepository.delete(recepcionista.getId());
		}
		else {
			EncargadoCompras encargado = encargadoComprasRepository.getByPersonId(id);
			
			usuarioRepository.disable(encargado.getUsuario().getNombre());
			encargadoComprasRepository.delete(encargado.getId());
		}
		
		personaRepository.delete(id);
	}

	@Override
	public Persona getByUsername(String username) {
		// TODO Auto-generated method stub
		Tatuador tatuador = tatuadorRepository.getByUsername(username);
		
		if(tatuador != null)
			return tatuador.getPersona();
		else {
			EncargadoCompras encargadoCompras = encargadoComprasRepository.getByUsername(username);
			
			if(encargadoCompras != null)
				return encargadoCompras.getPersona();
			else {
				Recepcionista recepcionista = recepcionistaRepository.getByUsername(username);
				
				if(recepcionista != null)
					return recepcionistaRepository.getByUsername(username).getPersona();
				else
					return null;
			}
			
		}
	}

}
