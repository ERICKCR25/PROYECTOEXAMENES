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
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaRespuesta(int idRespuesta) {
		return repositorio.elimina(idRespuesta);
	}

	@Override
	public int actualizaRespuesta(Respuesta obj) {
		return repositorio.actualiza(obj);
	}

	@Override
	public List<Respuesta> listaRespuesta(int idPregunta) {
		return repositorio.lista(idPregunta);
	}

}
