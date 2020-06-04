package com.examen.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.examen.servicio.RespuestaServicio;

@Controller
public class RepuestaController {

	@Autowired
	private RespuestaServicio rservicio;
	
	
}
