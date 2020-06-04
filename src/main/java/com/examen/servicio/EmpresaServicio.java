package com.examen.servicio;

import java.util.List;

import com.examen.entidad.Empresa;

public interface EmpresaServicio {
	public abstract int insertaEmpresa(Empresa obj);

	public abstract int eliminaEmpresa(int idEmpresa);

	public abstract int actualizaEmpresa(Empresa obj);

	public abstract List<Empresa> listaEmpresa(int ruc);

	public abstract List<Empresa> listaEmpresaN(String s);
}
