package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Respuesta;

public interface RespuestaServicio {

	public abstract int inserta(Respuesta obj);
	public abstract int elimina(int idRespuesta);
	public abstract int actualiza(Respuesta obj);
	public abstract List<Respuesta> lista(int idPregunta);
}
