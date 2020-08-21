package edu.ues21.tattoo.controller;

import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ues21.tattoo.domain.Cliente;
import edu.ues21.tattoo.domain.FichaClinica;
import edu.ues21.tattoo.domain.FichaClinicaDetalleEts;
import edu.ues21.tattoo.domain.FichaClinicaDetallePiel;
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
		model.addAttribute("cliente", clienteService.getById(Integer.parseInt(idCliente)));
		return "fichaClinica_visualizar";	
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public String create(@RequestParam(required = true, name = "id-cliente") String idFicha,
						 Model model) {
		Cliente cliente = clienteService.getById(Integer.parseInt(idFicha));
		
		model.addAttribute("nombre", cliente.getPersona().getNombre());
		model.addAttribute("apellido", cliente.getPersona().getApellido());
		model.addAttribute("id_cliente", cliente.getId());
		return "fichaClinica_crear";
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public String create(@RequestParam(required = true, name = "id_customer") String idCliente,
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
		Cliente cliente = clienteService.getById(Integer.parseInt(idCliente));
		
		FichaClinica fichaClinica = new FichaClinica();
		FichaClinicaDetalleEts fichaClinicaDetalleEts = new FichaClinicaDetalleEts();
		FichaClinicaDetallePiel fichaClinicaDetallePiel = new FichaClinicaDetallePiel();
		
		fichaClinica.setAlergias(alergias);
		fichaClinica.setComentario(comentariosGeneral);
		fichaClinica.setFactorRh(rh);
		fichaClinica.setGrupoSanguineo(tipoSangre);
		fichaClinica.setProblemasCardiacos(problemasCardiacos);
		
		fichaClinicaDetalleEts.setComentario(comentariosEts);
		fichaClinicaDetalleEts.setHepatitisB(hepatitisB);
		fichaClinicaDetalleEts.setHpv(hpv);
		fichaClinicaDetalleEts.setSifilis(sifilis);
		fichaClinicaDetalleEts.setVih(vih);
		
		fichaClinicaDetallePiel.setComentario(comentariosPiel);
		fichaClinicaDetallePiel.setEccema(eccema);
		fichaClinicaDetallePiel.setPsoriasis(psoriasis);
		fichaClinicaDetallePiel.setQueloide(queloide);
		
		fichaClinicaDetalleEts.setId(fichaClinicaDetalleEtsService.add(fichaClinicaDetalleEts));
		fichaClinicaDetallePiel.setId(fichaClinicaDetallePielService.add(fichaClinicaDetallePiel));
		
		fichaClinica.setFichaClinicaDetalleEts(fichaClinicaDetalleEts);
		fichaClinica.setFichaClinicaDetallePiel(fichaClinicaDetallePiel);
		fichaClinica.setId(fichaClinicaService.add(fichaClinica));
		
		cliente.setFichaClinica(fichaClinica);
		clienteService.update(cliente);
		
		return "redirect:/ficha-clinica/mostrar?id-cliente=" + cliente.getId();
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public String editar(Model model) {
		try {
			Cliente cliente = (Cliente) model.asMap().get("cliente_object");
			return "fichaClinica_editar";
		} catch (NullPointerException e) {
			// TODO: handle exception
			// NullPointerExcepction will execute when flash attributes doesn't exist
			return "error";
		}
	}

}
