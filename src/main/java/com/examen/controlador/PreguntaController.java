package com.examen.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.examen.servicio.PreguntaServicio;

@Controller
public class PreguntaController {

	
	@Autowired
	private PreguntaServicio pservicio;
}
