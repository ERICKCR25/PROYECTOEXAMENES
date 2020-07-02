package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Estudiante;

public interface EstudianteRepositorio {

	public abstract int inserta(Estudiante obj);

	public abstract int elimina(int idEstudiante);

	public abstract int actualiza(Estudiante obj);

	public abstract List<Estudiante> lista(int dni);

	public abstract List<Estudiante> listaN(String s);
}
