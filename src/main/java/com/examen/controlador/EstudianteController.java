package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.examen.entidad.Estudiante;
import com.examen.servicio.EstudianteServicio;

@Controller
public class EstudianteController {

	@Autowired
	private EstudianteServicio servicio;
	
	@RequestMapping("/verEstudiante")
	public String verPagina(Model m) {
		List<Estudiante> list = servicio.listaEstudianteN("");
		m.addAttribute("Estudiantes",list);
		return "crudEstudiante";
	};
	
	
	@RequestMapping("/registraEstudiante")
	public String agregaEstudiante( Model m,Estudiante obj) {			
		servicio.insertaEstudiante(obj);	
		List<Estudiante> list = servicio.listaEstudianteN("");
		m.addAttribute("estudiantes", list);
		return "crudEstudiante";
	}
	
	@RequestMapping("/actualizaEstudiante")
	public String actualizaEstudiante( Model m,Estudiante obj) {			
		servicio.actualizaEstudiante(obj);	
		List<Estudiante> list = servicio.listaEstudianteN("");
		m.addAttribute("estudiantes", list);
		return "crudEstudiante";	
	}	
	
	
	@RequestMapping("/eliminaEstudiante")
	public String eliminaEstudiante(@RequestParam Map<String,String> params, Model m) {			
		servicio.eliminaEstudiante(Integer.parseInt(params.get("id")));	
		List<Estudiante> list = servicio.listaEstudianteN("");
		m.addAttribute("estudiantes", list);
		return "crudEstudiante";
	}
	
	
	
	@RequestMapping("/listaEstudiante")
	public String listaEstudiante(@RequestParam Map<String,String> params, Model m) {
		List<Estudiante> list = servicio.listaEstudiante(Integer.parseInt(params.get("filtro")));
		m.addAttribute("estudiantes", list);
		return "crudEstudiante";
	}
	
		
	@RequestMapping("/listaEstudianteN")
	public String listaEstudianteN(@RequestParam Map<String,String> params, Model m) {
		List<Estudiante> list = servicio.listaEstudianteN((params.get("filtro")));
		m.addAttribute("estudiantes", list);
		return "crudEstudiante";
	}
	
	
	
	
}
