package edu.ues21.tattoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.EncargadoCompras;
import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;
import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;
import edu.ues21.tattoo.domain.Persona;
import edu.ues21.tattoo.domain.Recepcionista;
import edu.ues21.tattoo.domain.Tatuador;
import edu.ues21.tattoo.domain.Usuario;
import edu.ues21.tattoo.service.CategoriaService;
import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.EncargadoComprasService;
import edu.ues21.tattoo.service.FichaClinicaDetalleEtsService;
import edu.ues21.tattoo.service.FichaClinicaDetallePielService;
import edu.ues21.tattoo.service.FichaClinicaService;
import edu.ues21.tattoo.service.PersonaService;
import edu.ues21.tattoo.service.RecepcionistaService;
import edu.ues21.tattoo.service.TatuadorService;
import edu.ues21.tattoo.service.UsuarioService;

@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {

	@Autowired
	private PersonaService personaService;
	@Autowired
	private TatuadorService tatuadorService;
	@Autowired
	private RecepcionistaService recepcionistaService;
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private EncargadoComprasService encargadoComprasService;
	@Autowired
	private CategoriaService categoriaService;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private FichaClinicaService fichaClinicaService;
	@Autowired
	private FichaClinicaDetallePielService fichaClinicaDetallePielService;
	@Autowired
	private FichaClinicaDetalleEtsService fichaClinicaDetalleEtsService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String show(Model model) {
		model.addAttribute("personas", personaService.getAll());
		return "usuario_visualizar";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("nuevaPersona", new Persona());
		model.addAttribute("listaTipoDocumentos", categoriaService.getByTipo(1));
		model.addAttribute("listaRoles", categoriaService.getByTipo(4));
		return "usuario_crear";
	}
	
	@RequestMapping(value="/crear", method = RequestMethod.POST)
	public String create(@ModelAttribute("nuevaPersona") Persona nuevaPersona,
						 @RequestParam("usuarioDocumento") String dni,
						 @RequestParam("usuarioRol") String rol,
						 @RequestParam(required = false, name = "tatuadorAlias") String alias,
						 @RequestParam(required = true, name="action") String btnPressed) {
		nuevaPersona.setTipoDocumento(categoriaService.getByName(dni));
		nuevaPersona.setRol(categoriaService.getByName(rol));
		nuevaPersona.setId(personaService.add(nuevaPersona));
		
		Usuario usuario = new Usuario();
		
		if(!rol.equalsIgnoreCase("cliente")) {
			usuario.setNombre(usuarioService.add(nuevaPersona.getNombre(), 
							   nuevaPersona.getApellido(),
							   nuevaPersona.getCorreoElectronico()));
			
		}
		
		switch (rol.toLowerCase()) {
		case "tatuador":
			Tatuador tatuador = new Tatuador();
			tatuador.setPseudonimo(alias);
			tatuador.setPersona(nuevaPersona);
			tatuador.setUsuario(usuario);
			
			tatuadorService.add(tatuador);
			break;
			
		case "cliente":
			Cliente cliente = new Cliente();
			FichaClinica fichaClinica = new FichaClinica();
			FichaClinicaDetallePiel fichaClinicaDetallePiel = new FichaClinicaDetallePiel();
			FichaClinicaDetalleEts fichaClinicaDetalleEts = new FichaClinicaDetalleEts();

			fichaClinicaDetalleEts.setId(fichaClinicaDetalleEtsService.add(fichaClinicaDetalleEts));
			fichaClinicaDetallePiel.setId(fichaClinicaDetallePielService.add(fichaClinicaDetallePiel));
			
			fichaClinica.setFichaClinicaDetalleEts(fichaClinicaDetalleEts);
			fichaClinica.setFichaClinicaDetallePiel(fichaClinicaDetallePiel);
			fichaClinica.setId(fichaClinicaService.add(fichaClinica));
			
			cliente.setPersona(nuevaPersona);
			cliente.setFichaClinica(fichaClinica);
			
			int idCliente = clienteService.add(cliente);
			
			if(btnPressed.equalsIgnoreCase("ficha_clinica")) {
				//TODO: Ir a pantalla: fichas clinicas.JSP
				break;
			}
			
			break;
			
		case "encargado de compras":
			EncargadoCompras encargadoCompras = new EncargadoCompras();
			encargadoCompras.setPersona(nuevaPersona);
			encargadoCompras.setUsuario(usuario);
			
			encargadoComprasService.add(encargadoCompras);
			break;
			
		case "recepcionista":
			Recepcionista recepcionista = new Recepcionista();
			recepcionista.setPersona(nuevaPersona);
			recepcionista.setUsuario(usuario);
			
			recepcionistaService.add(recepcionista);
			break;

		default:
			System.err.println("Rol no soportado");
			break;
		}
		
		return "redirect:/usuario/mostrar";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxcall", method = RequestMethod.GET)
	public String populateModal(@RequestParam("person_id") int id) {
		Persona persona = personaService.getById(id);
		Object generic = new Object();
		
		switch (persona.getRol().getNombre().toLowerCase()) {
		case "tatuador":
			generic = tatuadorService.getByPersonId(id);
			break;
			
		case "cliente":
			generic = clienteService.getByPersonId(id);
			break;
			
		case "encargado de compras":
			generic = encargadoComprasService.getByPersonId(id);
			break;
			
		case "recepcionista":
			generic = recepcionistaService.getByPersonId(id);
			break;
			
		default:
			System.err.println("Rol no soportado");
			break;
		}
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			return mapper.writeValueAsString(generic);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "error";
	}
}