package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Evento;


public interface EventoRepositorio {

	public abstract int inserta(Evento obj);

	public abstract int elimina(int idEvento);

	public abstract int actualiza(Evento obj);

	public abstract List<Evento> lista(int id);

	public abstract List<Evento> listaN(String s);
	
}
