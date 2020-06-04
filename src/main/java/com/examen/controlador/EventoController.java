package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.examen.entidad.Evento;
import com.examen.servicio.EventoServicio;


@Controller
public class EventoController {
	@Autowired
	private EventoServicio servicio;
	
	@RequestMapping("/verEvento")
	public String verPagina(Model m) {
		List<Evento> list = servicio.listaEventoN("");
		m.addAttribute("eventos",list);
		return "crudEvento";
	};
	
	
	@RequestMapping("/registraEvento")
	public String agregaEvento( Model m,Evento obj) {			
		servicio.insertaEvento(obj);	
		List<Evento> list = servicio.listaEventoN("");
		m.addAttribute("eventos", list);
		return "crudEvento";
	}
	
	@RequestMapping("/actualizaEvento")
	public String actualizaEmpresa( Model m,Evento obj) {			
		servicio.actualizaEvento(obj);	
		List<Evento> list = servicio.listaEventoN("");
		m.addAttribute("eventos", list);
		return "crudEvento";	
	}	
	
	
	@RequestMapping("/eliminaEvento")
	public String eliminaEmpresa(@RequestParam Map<String,String> params, Model m) {			
		servicio.eliminaEvento(Integer.parseInt(params.get("id")));	
		List<Evento> list = servicio.listaEventoN("");
		m.addAttribute("eventos", list);
		return "crudEvento";
	}
	
	
	
	@RequestMapping("/listaEvento")
	public String listaEvento(@RequestParam Map<String,String> params, Model m) {
		List<Evento> list = servicio.listaEvento(Integer.parseInt(params.get("filtro")));
		m.addAttribute("eventos", list);
		return "crudEvento";
	}
	
		
	@RequestMapping("/listaEventoN")
	public String listaEventoN(@RequestParam Map<String,String> params, Model m) {
		List<Evento> list = servicio.listaEventoN((params.get("filtro")));
		m.addAttribute("eventos", list);
		return "crudEvento";
	}
	
	
}
