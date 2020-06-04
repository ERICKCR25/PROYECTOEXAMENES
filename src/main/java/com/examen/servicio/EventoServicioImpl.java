package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Evento;
import com.examen.repositorio.EventoRepositorio;
@Service
public class EventoServicioImpl implements EventoServicio {

	@Autowired
	private EventoRepositorio repositorio;
	
	@Override
	public int insertaEvento(Evento obj) {
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaEvento(int idEvento) {
		
		return repositorio.elimina(idEvento);
	}

	@Override
	public int actualizaEvento(Evento obj) {

		return repositorio.actualiza(obj);
	}

	@Override
	public List<Evento> listaEvento(int id) {
		
		return repositorio.lista(id);
	}

	@Override
	public List<Evento> listaEventoN(String s) {
		
		return repositorio.listaN(s);
	}

}
