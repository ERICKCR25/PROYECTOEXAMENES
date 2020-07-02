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
	public List<Evento> listaEvento() {
		
		return repositorio.lista();
	}


	@Override
	public Evento insertaActualizaEvento(Evento obj) {
		
		return repositorio.insertaActualizaEvento(obj);
	}


	@Override
	public int eliminaEvento(int idEvento) {
		
		return repositorio.elimina(idEvento);
	}


	@Override
	public List <Evento>  listaPorNombre(String s) {
		
		return repositorio.listaPorNombre(s);
	}
	
	

	

}
