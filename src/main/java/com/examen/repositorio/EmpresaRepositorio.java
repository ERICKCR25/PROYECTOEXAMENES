package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Empresa;

public interface EmpresaRepositorio {
	
	public abstract int inserta(Empresa obj);

	public abstract int elimina(int idEmpresa);

	public abstract int actualiza(Empresa obj);

	public abstract List<Empresa> lista(int ruc);

	public abstract List<Empresa> listaN(String s);
}
