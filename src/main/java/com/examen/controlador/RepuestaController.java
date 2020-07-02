package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.examen.servicio.RespuestaServicio;
import com.examen.entidad.Respuesta;
@Controller
public class RepuestaController {

	@Autowired
	private RespuestaServicio rservicio;
	
	
	
	@RequestMapping("/verRespuesta")
	public String verPagina(Model m) {
		List<Respuesta> list = rservicio.listaRespuesta(0);
		m.addAttribute("Respuestas",list);
		return "crudRespuesta";
	};
	
	
	@RequestMapping("/registraRespuesta")
	public String agregaRespuesta( Model m,Respuesta obj) {			
		rservicio.insertaRespuesta(obj);	
		List<Respuesta> list = rservicio.listaRespuesta(0);
		m.addAttribute("respuestas", list);
		return "crudRespuesta";
	}
	
	@RequestMapping("/actualizaRespuesta")
	public String actualizaRespuesta( Model m,Respuesta obj) {			
		rservicio.actualizaRespuesta(obj);	
		List<Respuesta> list = rservicio.listaRespuesta(0);
		m.addAttribute("respuestas", list);
		return "crudRespuesta";	
	}	
	
	
	@RequestMapping("/eliminaRespuesta")
	public String eliminaRespuesta(@RequestParam Map<String,String> params, Model m) {			
		rservicio.eliminaRespuesta(Integer.parseInt(params.get("id")));	
		List<Respuesta> list = rservicio.listaRespuesta(0);
		m.addAttribute("respuestas", list);
		return "crudRespuesta";
	}
	
	
	
		
	@RequestMapping("/listaRespuesta")
	public String listaRespuesta(@RequestParam Map<String,String> params, Model m) {
		List<Respuesta> list = rservicio.listaRespuesta(Integer.parseInt(params.get("filtro")));
		m.addAttribute("respuestas", list);
		return "crudRespuesta";
	}
	
}
