package com.examen.servicio;

import java.util.List;



import com.examen.entidad.Evento;


public interface EventoServicio {
	
	public abstract Evento insertaActualizaEvento(Evento obj);
	
	public abstract int eliminaEvento(int idEvento);

	public abstract List<Evento> listaEvento();
	
	public abstract List<Evento> listaPorNombre(String s);
	
	
	
}
