package com.examen.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.examen.servicio.ExamenServicio;

@Controller
public class ExamenController {

	
	@Autowired
	private ExamenServicio servicio;
	
	
	
}
