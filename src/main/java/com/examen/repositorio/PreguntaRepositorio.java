package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Pregunta;

public interface PreguntaRepositorio {

	public abstract int inserta(Pregunta obj);
	public abstract int elimina(int idPregunta);
	public abstract int Actualiza(Pregunta obj);
	public abstract List<Pregunta> lista(String s);
		
}
