package com.examen.entidad;

public class Pregunta {

	private int idPregunta;
	private String nPregunta;
	private String enunciado;
	private int idMateria;

	public int getIdPregunta() {
		return idPregunta;
	}

	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}

	public String getnPregunta() {
		return nPregunta;
	}

	public void setnPregunta(String nPregunta) {
		this.nPregunta = nPregunta;
	}

	public String getEnunciado() {
		return enunciado;
	}

	public void setEnunciado(String enunciado) {
		this.enunciado = enunciado;
	}

	public int getIdMateria() {
		return idMateria;
	}

	public void setIdMateria(int idMateria) {
		this.idMateria = idMateria;
	}

}
