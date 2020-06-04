package com.examen.repositorio;

import java.util.List;
import com.examen.entidad.Examen;

public interface ExamenRepositorio {
 
	public abstract int inserta(Examen obj);
	public abstract int elimina(int idExamen);
	public abstract int actualiza(Examen obj);
	public abstract List<Examen> lista(int id);
	public abstract List<Examen> listaN(String s);
}
