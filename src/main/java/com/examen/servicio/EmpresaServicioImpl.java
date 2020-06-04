package com.examen.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.examen.entidad.Empresa;
import com.examen.repositorio.EmpresaRepositorio;
@Service
public class EmpresaServicioImpl implements EmpresaServicio {

	@Autowired
	private EmpresaRepositorio repositorio;
	
	@Override
	public int insertaEmpresa(Empresa obj) {
		
		return repositorio.inserta(obj);
	}

	@Override
	public int eliminaEmpresa(int idEmpresa) {
		
		return repositorio.elimina(idEmpresa);
	}

	@Override
	public int actualizaEmpresa(Empresa obj) {
		
		return repositorio.actualiza( obj);
	}

	@Override
	public List<Empresa> listaEmpresa(int ruc) {
		
		return repositorio.lista(ruc);
	}

	@Override
	public List<Empresa> listaEmpresaN(String s) {
		
		return repositorio.listaN(s);
	}

}
