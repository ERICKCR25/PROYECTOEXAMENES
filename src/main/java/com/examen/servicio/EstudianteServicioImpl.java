package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Estudiante;
import com.examen.repositorio.EstudianteRepositorio;
@Service
public class EstudianteServicioImpl implements EstudianteServicio {

	@Autowired
	private EstudianteRepositorio repositorio;
	
	@Override
	public int insertaEstudiante(Estudiante obj) {
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaEstudiante(int idEstudiante) {
		return repositorio.elimina(idEstudiante);
	}

	@Override
	public int actualizaEstudiante(Estudiante obj) {
		return repositorio.actualiza(obj);
	}

	@Override
	public List<Estudiante> listaEstudiante(int dni) {
		return repositorio.lista(dni);
	}

	@Override
	public List<Estudiante> listaEstudianteN(String s) {
		return repositorio.listaN(s);
	}

}
