package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Examen;

@Service
public class ExamenServicioImpl implements ExamenServicio {

	@Autowired
	private ExamenServicio servicio;
	
	
	@Override
	public int insertaExamen(Examen obj) {
		return servicio.insertaExamen(obj);
	}

	@Override
	public int eliminaExamen(int idExamen) {
		return servicio.eliminaExamen(idExamen);
	}

	@Override
	public int actualizaExamen(Examen obj) {
		return servicio.actualizaExamen(obj);
	}

	@Override
	public List<Examen> listaExamen(int idExamen) {
		return servicio.listaExamen(idExamen);
	}

}
