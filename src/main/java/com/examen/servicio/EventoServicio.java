package com.examen.servicio;

import java.util.List;



import com.examen.entidad.Evento;


public interface EventoServicio {

	public abstract int insertaEvento(Evento obj);

	public abstract int eliminaEvento(int idEvento);

	public abstract int actualizaEvento(Evento obj);

	public abstract List<Evento> listaEvento(int id);

	public abstract List<Evento> listaEventoN(String s);
	
	
	
}
