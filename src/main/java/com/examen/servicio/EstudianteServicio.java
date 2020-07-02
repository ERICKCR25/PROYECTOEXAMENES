package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Estudiante;

public interface EstudianteServicio {
	public abstract int insertaEstudiante(Estudiante obj);

	public abstract int eliminaEstudiante(int idEstudiante);

	public abstract int actualizaEstudiante(Estudiante obj);

	public abstract List<Estudiante> listaEstudiante(int dni);

	public abstract List<Estudiante> listaEstudianteN(String s);
}
