package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.examen.entidad.Pregunta;
import com.examen.servicio.PreguntaServicio;

@Controller
public class PreguntaController {

	
	@Autowired
	private PreguntaServicio pservicio;
	
	@RequestMapping("/verPregunta")
	public String verPagina(Model m) {
		List<Pregunta> list = pservicio.listaPregunta("");
		m.addAttribute("preguntas",list);
		return "crudPregunta";
	};
	
	
	@RequestMapping("/registraPregunta")
	public String agregaPregunta( Model m,Pregunta obj) {			
		pservicio.insertaPregunta(obj);	
		List<Pregunta> list = pservicio.listaPregunta("");
		m.addAttribute("preguntas", list);
		return "crudPregunta";
	}
	
	@RequestMapping("/actualizaPregunta")
	public String actualizaPregunta( Model m,Pregunta obj) {			
		pservicio.actualizaPregunta(obj);	
		List<Pregunta> list = pservicio.listaPregunta("");
		m.addAttribute("preguntas", list);
		return "crudPregunta";	
	}	
	
	
	@RequestMapping("/eliminaPregunta")
	public String eliminaPregunta(@RequestParam Map<String,String> params, Model m) {			
		pservicio.eliminaPregunta(Integer.parseInt(params.get("id")));	
		List<Pregunta> list = pservicio.listaPregunta("");
		m.addAttribute("preguntas", list);
		return "crudPregunta";
	}
	
	
	
		
	@RequestMapping("/listaPregunta")
	public String listaPregunta(@RequestParam Map<String,String> params, Model m) {
		List<Pregunta> list = pservicio.listaPregunta((params.get("filtro")));
		m.addAttribute("preguntas", list);
		return "crudPregunta";
	}
	
}
