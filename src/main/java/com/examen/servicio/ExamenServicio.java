package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Examen;

public interface ExamenServicio {
	public abstract int insertaExamen(Examen obj);
	public abstract int eliminaExamen(int idExamen);
	public abstract int actualizaExamen(Examen obj);
	public abstract List<Examen> listaExamen(int idExamen);
	public abstract List<Examen> listaExamenN(String s);
}
