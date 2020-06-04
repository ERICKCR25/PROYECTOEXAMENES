package com.examen.entidad;

public class Examen {

	private int idexamen;
	private String nombre;
	private String descripcion;
	private String claves;
	private int numPreguntas;	
	private int valorAprobatorio;
	private int porAprobacion;
	private int valorTotal;
	
	
	public int getIdexamen() {
		return idexamen;
	}
	public void setIdexamen(int idexamen) {
		this.idexamen = idexamen;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getClaves() {
		return claves;
	}
	public void setClaves(String claves) {
		this.claves = claves;
	}
	public int getNumPreguntas() {
		return numPreguntas;
	}
	public void setNumPreguntas(int numPreguntas) {
		this.numPreguntas = numPreguntas;
	}
	public int getValorTotal() {
		return valorTotal;
	}
	public void setValorTotal(int valorTotal) {
		this.valorTotal = valorTotal;
	}
	public int getValorAprobatorio() {
		return valorAprobatorio;
	}
	public void setValorAprobatorio(int valorAprobatorio) {
		this.valorAprobatorio = valorAprobatorio;
	}
	public int getPorAprobacion() {
		return porAprobacion;
	}
	public void setPorAprobacion(int porAprobacion) {
		this.porAprobacion = porAprobacion;
	}
	
	
	
}
