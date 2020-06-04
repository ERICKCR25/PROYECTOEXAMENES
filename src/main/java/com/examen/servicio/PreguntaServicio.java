package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Pregunta;

public interface PreguntaServicio {

	public abstract int insertaPregunta(Pregunta obj);
	public abstract int eliminaPregunta(int idPregunta);
	public abstract int actualizaPregunta(Pregunta obj);
	public abstract List <Pregunta> listaPregunta(String s);
}
