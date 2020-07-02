package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Pregunta;
import com.examen.repositorio.PreguntaRepositorio;
@Service
public class PreguntaServicioImpl implements PreguntaServicio {

	@Autowired
	private PreguntaRepositorio repositorio;
	
	@Override
	public int insertaPregunta(Pregunta obj) {
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaPregunta(int idPregunta) {
		return repositorio.elimina(idPregunta);
	}

	@Override
	public int actualizaPregunta(Pregunta obj) {
		return repositorio.Actualiza(obj);
	}

	@Override
	public List<Pregunta> listaPregunta(String s) {
		return repositorio.lista(s);
	}

}
