package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.examen.servicio.ExamenServicio;
import com.examen.entidad.Examen;


@Controller
public class ExamenController {

	
	@Autowired
	private ExamenServicio eservicio;
	
	
	
	@RequestMapping("/verExamen")
	public String verPagina(Model m) {
		List<Examen> list = eservicio.listaExamenN("");
		m.addAttribute("Examenes", list);
		return "crudExamen";
	}
	
	@RequestMapping("/registraExamen")
	public String agregaExamen( Model m,Examen obj) {			
		eservicio.insertaExamen(obj);	
		List<Examen> list = eservicio.listaExamenN("");
		m.addAttribute("examenes", list);
		return "crudExamen";
	}
	
	@RequestMapping("/actualizaExamen")
	public String actualizaExamen( Model m,Examen obj) {			
		eservicio.actualizaExamen(obj);	
		List<Examen> list = eservicio.listaExamenN("");
		m.addAttribute("examenes", list);
		return "crudExamen";	
	}	
	
	
	@RequestMapping("/eliminaExamen")
	public String eliminaExamen(@RequestParam Map<String,String> params, Model m) {			
		eservicio.eliminaExamen(Integer.parseInt(params.get("id")));	
		List<Examen> list = eservicio.listaExamenN("");
		m.addAttribute("examenes", list);
		return "crudExamen";
	}
	
	
	
	@RequestMapping("/listaExamen")
	public String listaExamen(@RequestParam Map<String,String> params, Model m) {
		List<Examen> list = eservicio.listaExamen(Integer.parseInt(params.get("filtro")));
		m.addAttribute("examenes", list);
		return "crudExamen";
	}
	
		
	@RequestMapping("/listaExamenN")
	public String listaExamenN(@RequestParam Map<String,String> params, Model m) {
		List<Examen> list = eservicio.listaExamenN((params.get("filtro")));
		m.addAttribute("examenes", list);
		return "crudExamen";
	}
	
}
