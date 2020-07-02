package com.examen.repositorio;

import java.util.List;

import com.examen.entidad.Empresa;

public interface EmpresaRepositorio {
	
	public abstract Empresa insertaActualiza(Empresa obj);

	public abstract int elimina(int idEmpresa);

	

	public abstract List<Empresa> listaRuc(int ruc);
	
	public abstract List<Empresa> lista();

	public abstract List<Empresa> listaN(String s);
}
