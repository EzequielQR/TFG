package edu.ues21.tattoo.controller;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.service.ClienteService;
import edu.ues21.tattoo.service.FichaClinicaDetalleEtsService;
import edu.ues21.tattoo.service.FichaClinicaDetallePielService;
import edu.ues21.tattoo.service.FichaClinicaService;

@Controller
@RequestMapping(value = "/ficha-clinica")
public class FichaClinicaController {
	
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private FichaClinicaService fichaClinicaService;
	@Autowired
	private FichaClinicaDetallePielService fichaClinicaDetallePielService;
	@Autowired
	private FichaClinicaDetalleEtsService fichaClinicaDetalleEtsService;
	
	@RequestMapping(value = "/mostrar", method = RequestMethod.GET)
	public String show(@RequestParam(required = true, name = "id-cliente") String idCliente,
					   Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		model.addAttribute("cliente", clienteService.getById(Integer.parseInt(idCliente)));
		return "fichaClinica_visualizar";	
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(@RequestParam(required = true, name = "id-cliente") String idCliente,
						 Model model) {
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("nombre", user.getUsername());
		}
		
		Cliente cliente = clienteService.getById(Integer.parseInt(idCliente));
		
		model.addAttribute("nombre", cliente.getPersona().getNombre());
		model.addAttribute("apellido", cliente.getPersona().getApellido());
		model.addAttribute("id_cliente", cliente.getId());
		model.addAttribute("id_ficha_clinica", cliente.getFichaClinica().getId());
		
		return "fichaClinica_crear";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public String create(@RequestParam(required = true, name = "id_customer") String idCliente,
						 @RequestParam(required = true, name = "id_clinical_record") String idFichaClinica,
						 @RequestParam(required = true, name = "blood_type") String tipoSangre,
						 @RequestParam(required = true, name = "rh_blood") String rh,
						 @RequestParam(required = false, name = "allergies") String alergias,
						 @RequestParam(required = false, name = "cardiac_problems") String problemasCardiacos,
						 @RequestParam(required = false, name = "gral_comment") String comentariosGeneral,
						 @RequestParam(required = true, name = "psoriasis") Boolean psoriasis,
						 @RequestParam(required = true, name = "eczema") Boolean eccema,
						 @RequestParam(required = true, name = "keloid") Boolean queloide,
						 @RequestParam(required = false, name = "skin_comment") String comentariosPiel,
						 @RequestParam(required = true, name = "hiv") Boolean vih,
						 @RequestParam(required = true, name = "syphilis") Boolean sifilis,
						 @RequestParam(required = true, name = "hepatitis_b") Boolean hepatitisB,
						 @RequestParam(required = true, name = "hpv") Boolean hpv,
						 @RequestParam(required = false, name = "std_comment") String comentariosEts,
						 Model model) {
		FichaClinica fichaClinica = fichaClinicaService.getById(Integer.parseInt(idFichaClinica));

		fichaClinica.setAlergias(alergias);
		fichaClinica.setComentario(comentariosGeneral);
		fichaClinica.setFactorRh(rh);
		fichaClinica.setGrupoSanguineo(tipoSangre);
		fichaClinica.setProblemasCardiacos(problemasCardiacos);
		
		fichaClinica.getFichaClinicaDetalleEts().setComentario(comentariosEts);
		fichaClinica.getFichaClinicaDetalleEts().setHepatitisB(hepatitisB);
		fichaClinica.getFichaClinicaDetalleEts().setHpv(hpv);
		fichaClinica.getFichaClinicaDetalleEts().setSifilis(sifilis);
		fichaClinica.getFichaClinicaDetalleEts().setVih(vih);
		
		fichaClinica.getFichaClinicaDetallePiel().setComentario(comentariosPiel);
		fichaClinica.getFichaClinicaDetallePiel().setEccema(eccema);
		fichaClinica.getFichaClinicaDetallePiel().setPsoriasis(psoriasis);
		fichaClinica.getFichaClinicaDetallePiel().setQueloide(queloide);
		
		fichaClinicaDetalleEtsService.update(fichaClinica.getFichaClinicaDetalleEts());
		fichaClinicaDetallePielService.update(fichaClinica.getFichaClinicaDetallePiel());
		fichaClinicaService.update(fichaClinica);
		
		return "redirect:/ficha-clinica/mostrar?id-cliente=" + idCliente;
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String edit(@RequestParam(required = true, name = "id-cliente") String idCliente,
					   Model model) {
		boolean isCustomer = false;
		String username = "";
		
		if(SecurityContextHolder.getContext().getAuthentication() != null && 
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			
			UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			username = user.getUsername();
			
			model.addAttribute("nombre", username);
			
			Iterator<? extends GrantedAuthority> itr = user.getAuthorities().iterator();
			
			while(itr.hasNext()) {
				GrantedAuthority authority = itr.next();
				
				if(authority.getAuthority().equalsIgnoreCase("customer")) 
					isCustomer = true;
			}
		}
		Cliente cliente = clienteService.getById(Integer.parseInt(idCliente));
		
		if(isCustomer == true) {
			Cliente clienteLogged = clienteService.getByUsername(username);
			
			if(clienteLogged.getId() != cliente.getId()) {
				model.asMap().clear();
				return "redirect:/error403";
			}
		}
		
		model.addAttribute("cliente", cliente);
		return "fichaClinica_editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String edit(@RequestParam(required = true, name = "id_customer") String idCliente,
					   @RequestParam(required = true, name = "id_clinical_record") String idFichaClinica,
					   @RequestParam(required = true, name = "blood_type") String tipoSangre,
					   @RequestParam(required = true, name = "rh_blood") String rh,
					   @RequestParam(required = false, name = "allergies") String alergias,
					   @RequestParam(required = false, name = "cardiac_problems") String problemasCardiacos,
					   @RequestParam(required = false, name = "gral_comment") String comentariosGeneral,
					   @RequestParam(required = true, name = "psoriasis") Boolean psoriasis,
					   @RequestParam(required = true, name = "eczema") Boolean eccema,
					   @RequestParam(required = true, name = "keloid") Boolean queloide,
					   @RequestParam(required = false, name = "skin_comment") String comentariosPiel,
					   @RequestParam(required = true, name = "hiv") Boolean vih,
					   @RequestParam(required = true, name = "syphilis") Boolean sifilis,
					   @RequestParam(required = true, name = "hepatitis_b") Boolean hepatitisB,
					   @RequestParam(required = true, name = "hpv") Boolean hpv,
					   @RequestParam(required = false, name = "std_comment") String comentariosEts,
					   Model model) {
		FichaClinica fichaClinica = fichaClinicaService.getById(Integer.parseInt(idFichaClinica));
		
		fichaClinica.setAlergias(alergias);
		fichaClinica.setComentario(comentariosGeneral);
		fichaClinica.setFactorRh(rh);
		fichaClinica.setGrupoSanguineo(tipoSangre);
		fichaClinica.setProblemasCardiacos(problemasCardiacos);
		
		fichaClinica.getFichaClinicaDetalleEts().setComentario(comentariosEts);
		fichaClinica.getFichaClinicaDetalleEts().setHepatitisB(hepatitisB);
		fichaClinica.getFichaClinicaDetalleEts().setHpv(hpv);
		fichaClinica.getFichaClinicaDetalleEts().setSifilis(sifilis);
		fichaClinica.getFichaClinicaDetalleEts().setVih(vih);
		
		fichaClinica.getFichaClinicaDetallePiel().setComentario(comentariosPiel);
		fichaClinica.getFichaClinicaDetallePiel().setEccema(eccema);
		fichaClinica.getFichaClinicaDetallePiel().setPsoriasis(psoriasis);
		fichaClinica.getFichaClinicaDetallePiel().setQueloide(queloide);
		
		fichaClinicaService.update(fichaClinica);
		fichaClinicaDetalleEtsService.update(fichaClinica.getFichaClinicaDetalleEts());
		fichaClinicaDetallePielService.update(fichaClinica.getFichaClinicaDetallePiel());
		
		return "redirect:/ficha-clinica/mostrar?id-cliente=" + idCliente;
	}
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public String delete(@RequestParam(required = true, name = "id-cliente") String idCliente,
						 Model model) {
		return "redirect:/ficha-clinica/mostrar?id-cliente=" + idCliente;
	}

}