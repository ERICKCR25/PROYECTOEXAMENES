package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Respuesta;
import com.examen.repositorio.RespuestaRepositorio;


@Service
public class RespuestaServicioImpl implements RespuestaServicio {

	
	@Autowired
	private RespuestaRepositorio repositorio;

	@Override
	public int insertaRespuesta(Respuesta obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminaRespuesta(int idRespuesta) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int actualizaRespuesta(Respuesta obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Respuesta> listaRespuesta(int idPregunta) {
		// TODO Auto-generated method stub
		return null;
	}
	
 	

}
