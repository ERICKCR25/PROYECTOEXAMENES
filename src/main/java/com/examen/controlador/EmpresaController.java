package com.examen.controlador;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.examen.entidad.Empresa;
import com.examen.servicio.EmpresaServicio;


@Controller
public class EmpresaController {

	
	@Autowired
	private EmpresaServicio servicio;
	
	@RequestMapping("/verEmpresa")
	public String verPagina(Model m) {
		List<Empresa> list = servicio.listaEmpresaN("");
		m.addAttribute("Empresas",list);
		return "crudEmpresa";
	};
	
	
	@RequestMapping("/registraEmpresa")
	public String agregaEmpresa( Model m,Empresa obj) {			
		servicio.insertaEmpresa(obj);	
		List<Empresa> list = servicio.listaEmpresaN("");
		m.addAttribute("empresas", list);
		return "crudEmpresa";
	}
	
	@RequestMapping("/actualizaEmpresa")
	public String actualizaEmpresa( Model m,Empresa obj) {			
		servicio.actualizaEmpresa(obj);	
		List<Empresa> list = servicio.listaEmpresaN("");
		m.addAttribute("empresas", list);
		return "crudEmpresa";	
	}	
	
	
	@RequestMapping("/eliminaEmpresa")
	public String eliminaEmpresa(@RequestParam Map<String,String> params, Model m) {			
		servicio.eliminaEmpresa(Integer.parseInt(params.get("id")));	
		List<Empresa> list = servicio.listaEmpresaN("");
		m.addAttribute("empresas", list);
		return "crudEmpresa";
	}
	
	
	
	@RequestMapping("/listaEmpresa")
	public String listaEmpresa(@RequestParam Map<String,String> params, Model m) {
		List<Empresa> list = servicio.listaEmpresa(Integer.parseInt(params.get("filtro")));
		m.addAttribute("empresas", list);
		return "crudEmpresa";
	}
	
		
	@RequestMapping("/listaEmpresaN")
	public String listaEmpresaN(@RequestParam Map<String,String> params, Model m) {
		List<Empresa> list = servicio.listaEmpresaN((params.get("filtro")));
		m.addAttribute("empresas", list);
		return "crudEmpresa";
	}
	
	
	
}
