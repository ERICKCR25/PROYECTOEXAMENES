package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Respuesta;

public interface RespuestaServicio {

	public abstract int insertaRespuesta(Respuesta obj);
	public abstract int eliminaRespuesta(int idRespuesta);
	public abstract int actualizaRespuesta(Respuesta obj);
	public abstract List<Respuesta> listaRespuesta(int idPregunta);
}
