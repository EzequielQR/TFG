package edu.ues21.tattoo.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("personas", personaService.getAll());
		return "usuario_visualizar";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
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
			
			cliente.setId(clienteService.add(cliente));
			
			if(btnPressed.equalsIgnoreCase("ficha_clinica"))
				return "redirect:/ficha-clinica/crear?id-cliente=" + cliente.getId();
			
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
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String edit(@RequestParam(required = false, name = "id") String idPersona,
			           Model model) {
		String username = "";
		boolean isCustomer = false;
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			username = user.getUsername();
			
			Iterator<? extends GrantedAuthority> itr = user.getAuthorities().iterator();
			
			while(itr.hasNext()) {
				GrantedAuthority authority = itr.next();
				
				if(authority.getAuthority().equalsIgnoreCase("customer")) 
					isCustomer = true;
			}
			model.addAttribute("nombre", username);
		}
		
		int idPerson;
		
		if(idPersona != null && isCustomer == false) {
			idPerson = Integer.parseInt(idPersona);
			model.addAttribute("customer", false);
		}
		else {
			idPerson = clienteService.getByUsername(username).getPersona().getId();
			model.addAttribute("customer", true);
		}
		
		Persona persona = personaService.getById(idPerson);
		
		model.addAttribute("persona", persona);
		model.addAttribute("listaTipoDocumentos", categoriaService.getByTipo(1));
		
		if(persona.getRol().getNombre().equalsIgnoreCase("TATUADOR")) {
			model.addAttribute("alias", tatuadorService.getByPersonId(idPerson).getPseudonimo());
		}
		
		return "usuario_editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String edit(@RequestParam(required = true, name = "id") int id,
					   @RequestParam(required = true, name = "nombre") String nombre,
					   @RequestParam(required = true, name = "apellido") String apellido,
					   @RequestParam(required = true, name = "numeroDocumento") String numeroDocumento,
					   @RequestParam(required = true, name = "correoElectronico") String correoElectronico,
					   @RequestParam(required = true, name = "telefono") String telefono,
					   @RequestParam(required = true, name = "domicilio") String domicilio,
					   @RequestParam(required = true, name = "usuarioRol") String tipoRol,
					   @RequestParam(required = true, name = "usuarioDocumento") String tipoDocumento,
					   @RequestParam(required = true, name = "action") String btnPressed,
					   @RequestParam(required = false, name = "tatuadorAlias") String aliasTatuador,
					   @RequestParam(required = true, name = "customerBoolean") boolean customer) {
		Persona persona = new Persona();

		persona.setId(id);
		persona.setNombre(nombre);
		persona.setApellido(apellido);
		persona.setNumeroDocumento(numeroDocumento);
		persona.setCorreoElectronico(correoElectronico);
		persona.setTelefono(telefono);
		persona.setDomicilio(domicilio);
		
		persona.setTipoDocumento(categoriaService.getByName(tipoDocumento));
		persona.setRol(categoriaService.getByName(tipoRol));
		personaService.update(persona);
		
		if(persona.getRol().getNombre().equalsIgnoreCase("TATUADOR")) {
			Tatuador tatuador = tatuadorService.getByPersonId(persona.getId());
			tatuador.setPseudonimo(aliasTatuador);
			tatuadorService.update(tatuador);
		}
		
		if(btnPressed.equalsIgnoreCase("ficha_clinica")) {
			Cliente cliente = clienteService.getByPersonId(persona.getId());
			return "redirect:/ficha-clinica/editar?id-cliente=" + cliente.getId();
		}
		else if(customer == false)
			return "redirect:/usuario/mostrar";
		else
			return "redirect:/usuario/editar";
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
	
	@RequestMapping(value = "/fichaClinicaDetalle", method = RequestMethod.POST)
	public String verDetallesFichaClinica(@RequestParam(name = "id_cliente") String idCliente) {
		return "redirect:/ficha-clinica/mostrar?id-cliente=" + idCliente;
	}
	
	@RequestMapping(value="/processDocument", method = RequestMethod.POST)
	public String digitalTransformation(RedirectAttributes redirectAttributes,
										@RequestParam(required = false, name="selected-file") MultipartFile selectedFile) {
		
		if(selectedFile != null && !selectedFile.isEmpty()) {
			try {
				byte[] bytes = selectedFile.getBytes();
				Map<String, String> map = fichaClinicaService.digitalTransformation(bytes);
				
				redirectAttributes.addFlashAttribute("OCR", map);
				
				return "redirect:/usuario/ocr";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "";
	}
	
	@RequestMapping(value="/ocr", method = RequestMethod.GET)
	public String ocrDone(Model model) {

		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		if(model.containsAttribute("OCR")) {
			
			Map<String, String> map = (Map<String, String>) model.asMap().get("OCR");
			model.addAttribute("ocr", map);
			
			model.addAttribute("nuevaPersona", new Persona());
			model.addAttribute("listaTipoDocumentos", categoriaService.getByTipo(1));
			model.addAttribute("listaRoles", categoriaService.getByTipo(4));
			
			return "usuario_crear_ocr";
		}
		else
			return"redirect:/usuario/crear";
		
	}
	
	@RequestMapping(value = "/ocr", method = RequestMethod.POST)
	public String ocrDone(@ModelAttribute("nuevaPersona") Persona nuevaPersona,
			 @RequestParam("usuarioDocumento") String dni,
			 @RequestParam(required = true, name = "usuarioRol") String rol,
			 @RequestParam(required = false, name = "tatuadorAlias") String alias,
			 @RequestParam(required = true, name = "action") String btnPressed,
			 @RequestParam(required = true, name="blood_type") String bloodType,
			 @RequestParam(required = true, name="rh_factor") String rhFactor,
			 @RequestParam(required = true, name="cardiac_boolean") String cardiacBoolean,
			 @RequestParam(required = true, name="cardiac_details") String cardiacDetails,
			 @RequestParam(required = true, name="skin_boolean") String skinBoolean,
			 @RequestParam(required = true, name="skin_details") String skinDetails,
			 @RequestParam(required = true, name="circulation_boolean") String circulationBoolean,
			 @RequestParam(required = true, name="circulation_details") String circulationDetails,
			 @RequestParam(required = true, name="allergies_boolean") String allergiesBoolean,
			 @RequestParam(required = true, name="allergies_details") String allergiesDetails,
			 @RequestParam(required = true, name="diabetes_boolean") String diabetesBoolean,
			 @RequestParam(required = true, name="smooking_boolean") String smookingBoolean,
			 @RequestParam(required = true, name="pregnant_boolean") String pregnantBoolean,
			 @RequestParam(required = true, name="epilepsy_boolean") String epilepsyBoolean,
			 @RequestParam(required = true, name="medication_boolean") String medicationBoolean,
			 @RequestParam(required = true, name="medication_details") String medicationDetails,
			 @RequestParam(required = true, name="hypertension_boolean") String hypertensionBoolean,
			 @RequestParam(required = true, name="hiv_boolean") String hivBoolean,
			 @RequestParam(required = true, name="hepatitis_boolean") String hepatitisBoolean,
			 @RequestParam(required = true, name="hpv_boolean") String hpvBoolean,
			 @RequestParam(required = true, name="syphilis_boolean") String syphilisBoolean) {
		
		nuevaPersona.setTipoDocumento(categoriaService.getByName(dni));
		nuevaPersona.setRol(categoriaService.getByName(rol));
		nuevaPersona.setId(personaService.add(nuevaPersona));
		
		Cliente cliente = new Cliente();
		
		FichaClinica fichaClinica = new FichaClinica();
		FichaClinicaDetallePiel fichaClinicaDetallePiel = new FichaClinicaDetallePiel();
		FichaClinicaDetalleEts fichaClinicaDetalleEts = new FichaClinicaDetalleEts();

		//
		if(bloodType != null && !bloodType.isEmpty() && bloodType.trim().length() == 1) 
			fichaClinica.setGrupoSanguineo(bloodType);
		
		if(rhFactor != null && !rhFactor.isEmpty() && rhFactor.trim().length() == 1)
			fichaClinica.setFactorRh(rhFactor);
		
		if(cardiacBoolean != null && !cardiacBoolean.isEmpty()) {
			if(cardiacBoolean.trim().equalsIgnoreCase("true"))
				fichaClinica.setProblemasCardiacos("Presenta problemas cardiacos");
			else
				fichaClinica.setProblemasCardiacos("No aplica");
		}
		
		if(cardiacDetails != null && !cardiacDetails.isEmpty())
			fichaClinica.setProblemasCardiacos(fichaClinica.getProblemasCardiacos() == null ? cardiacDetails + "." :  fichaClinica.getProblemasCardiacos() + " " + cardiacDetails + ".");
		
		if(skinBoolean != null && !skinBoolean.isEmpty()) {
			if(skinBoolean.trim().equalsIgnoreCase("true")) {
				fichaClinicaDetallePiel.setComentario("Presenta problemas cutáneos.");
			}
			else {
				fichaClinicaDetallePiel.setComentario("No aplica");
				fichaClinicaDetallePiel.setEccema(false);
				fichaClinicaDetallePiel.setPsoriasis(false);
				fichaClinicaDetallePiel.setQueloide(false);
			}
		}
		
		if(skinDetails != null && !skinDetails.isEmpty())
			fichaClinicaDetallePiel.setComentario(fichaClinicaDetallePiel.getComentario() == null ? skinDetails + "." : fichaClinicaDetallePiel.getComentario() + " " + skinDetails + ".");
		
		if(circulationBoolean != null && !circulationBoolean.isEmpty()) {
			if(circulationBoolean.trim().equalsIgnoreCase("true"))
				fichaClinica.setComentario("Presenta problemas de circulación");
			else
				fichaClinica.setComentario("No aplica");
		}
		
		if(circulationDetails != null && !circulationDetails.isEmpty())
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? circulationDetails + "." : fichaClinica.getComentario() + " " + circulationDetails + ".");
		
		if(allergiesBoolean != null && !allergiesBoolean.isEmpty()) {
			if(allergiesBoolean.trim().equalsIgnoreCase("true"))
				fichaClinica.setAlergias("Posee alergias");
			else
				fichaClinica.setAlergias("No aplica");
		}
		
		if(allergiesDetails != null && !allergiesDetails.isEmpty())
			fichaClinica.setAlergias(fichaClinica.getAlergias() + ": " + allergiesDetails + ".");

		if(diabetesBoolean != null && !diabetesBoolean.isEmpty() && diabetesBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Tiene diabetes." : fichaClinica.getComentario() + "Tiene diabetes.");
		
		if(smookingBoolean != null && !smookingBoolean.isEmpty() && smookingBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Tabaquismo." : fichaClinica.getComentario() + " " + "Tabaquismo.");
		
		if(pregnantBoolean != null && !pregnantBoolean.isEmpty() && pregnantBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Está embarazada." : fichaClinica.getComentario() + " " + "Está embarazada.");
		
		if(epilepsyBoolean != null && !epilepsyBoolean.isEmpty() && epilepsyBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Presenta epilepsia." : fichaClinica.getComentario() + " " + "Presenta epilepsia.");
		
		if(medicationBoolean != null && !medicationBoolean.isEmpty() && medicationBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Consume medicamentos:" : fichaClinica.getComentario() + "Consume medicamentos:");
			
		if(medicationDetails != null && !medicationDetails.isEmpty())
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? medicationDetails + "." : fichaClinica.getComentario() + " " + medicationDetails + ".");
		
		if(hypertensionBoolean != null && !hypertensionBoolean.isEmpty() && hypertensionBoolean.trim().equalsIgnoreCase("true"))
			fichaClinica.setComentario(fichaClinica.getComentario() == null ? "Presenta hipertensión." :fichaClinica.getComentario() + " " + "Presenta hipertensión.");

		if(hivBoolean != null && !hivBoolean.isEmpty()) {
			if(hivBoolean.trim().equalsIgnoreCase("true"))
				fichaClinicaDetalleEts.setVih(true);
			else
				fichaClinicaDetalleEts.setVih(false);
		}
		
		if(hepatitisBoolean != null && !hepatitisBoolean.isEmpty()) {
			if(hepatitisBoolean.trim().equalsIgnoreCase("true"))
				fichaClinicaDetalleEts.setHepatitisB(true);
			else
				fichaClinicaDetalleEts.setHepatitisB(false);
		}
		
		if(hpvBoolean != null && !hpvBoolean.isEmpty()) {
			if(hpvBoolean.trim().equalsIgnoreCase("true"))
				fichaClinicaDetalleEts.setHpv(true);
			else
				fichaClinicaDetalleEts.setHpv(false);
		}
		
		if(syphilisBoolean != null && !syphilisBoolean.isEmpty()) {
			if(syphilisBoolean.trim().equalsIgnoreCase("true"))
				fichaClinicaDetalleEts.setSifilis(true);
			else
				fichaClinicaDetalleEts.setSifilis(false);
		}
		
		fichaClinicaDetallePiel.setId(fichaClinicaDetallePielService.add(fichaClinicaDetallePiel));
		fichaClinicaDetalleEts.setId(fichaClinicaDetalleEtsService.add(fichaClinicaDetalleEts));
		
		fichaClinica.setFichaClinicaDetalleEts(fichaClinicaDetalleEts);
		fichaClinica.setFichaClinicaDetallePiel(fichaClinicaDetallePiel);
		fichaClinica.setId(fichaClinicaService.add(fichaClinica));
		
		cliente.setPersona(nuevaPersona);
		cliente.setFichaClinica(fichaClinica);
		
		cliente.setId(clienteService.add(cliente));
		
		if(btnPressed.equalsIgnoreCase("ficha_clinica")) {
			return "redirect:/ficha-clinica/mostrar?id-cliente=" + cliente.getId();
		}
		else {
			return "redirect:/usuario/mostrar";
		}
	
	}

	@RequestMapping(value = "/ajaxUpdatePassword", method = RequestMethod.GET)
	public @ResponseBody String updatePassword(@RequestParam("old_password") String oldPasswordRaw,
											   @RequestParam("new_password") String newPasswordRaw,
											   @RequestParam("new_password_repeat") String newPasswordRepeat) {
		
		if(!newPasswordRaw.equals(newPasswordRepeat))
			return "error";
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Usuario usuario = usuarioService.getById(user.getUsername());

			
			if(usuario != null && usuarioService.check(oldPasswordRaw, usuario.getContraseniaHash())) {
				usuario.setContraseniaHash(usuarioService.generateBCryptHash(newPasswordRaw));
				usuarioService.update(usuario);
				return "success";
			}
		} 
		
		return "error";
		
	}
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public String delete(@RequestParam(required = true, name = "id") int idPerson,
						 @RequestParam(required = true, name = "role") String rol) {
		personaService.delete(idPerson, rol);
		return "redirect:/usuario/mostrar";
	}
	
}