package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Examen;
import com.examen.repositorio.ExamenRepositorio;

@Service
public class ExamenServicioImpl implements ExamenServicio {

	@Autowired
	private ExamenRepositorio repositorio;
	
	
	@Override
	public int insertaExamen(Examen obj) {
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaExamen(int idExamen) {
		return repositorio.elimina(idExamen);
	}

	@Override
	public int actualizaExamen(Examen obj) {
		return repositorio.actualiza(obj);
	}

	@Override
	public List<Examen> listaExamen(int idExamen) {
		return repositorio.lista(idExamen);
	}

	@Override
	public List<Examen> listaExamenN(String s) {
		return repositorio.listaN(s);
	}
	
	
}
