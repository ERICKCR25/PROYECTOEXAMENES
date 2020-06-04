package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Respuesta;

public interface RespuestaRepositorio {

	public abstract int inserta(Respuesta obj);
	public abstract int actualiza(Respuesta obj);
	public abstract int elimina(int idRespuesta);
	public abstract List<Respuesta> lista(int idPregunta);
	
}
