package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Estudiante;

@Repository
public class EstudianteMySqlRepositorio implements EstudianteRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int inserta(Estudiante obj) {

		String sql = "insert into estudiante values (null,?,?,?,?,?,?,?,?)";
		Object[] val = { obj.getNombre(), obj.getApellidoPaterno(), obj.getApellidoMaterno(), obj.getDni(),
				obj.getFechNac(), obj.getColegio(), obj.getCelular(), obj.getIdDistrito() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int elimina(int idEstudiante) {
		String sql = "delete from estudiante where idestudiante=?";
		Object[] val = { idEstudiante };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int actualiza(Estudiante obj) {
		String sql = "update estudiante set nombre=?,apellidoPaterno=?, apellidoMaterno=?,dni=?,fechNac=?,colegio=?,celular=?,idDistrito=? where idestudiante = ?";
		Object[] val = { obj.getNombre(), obj.getApellidoPaterno(), obj.getApellidoMaterno(), obj.getDni(),
				obj.getFechNac(), obj.getColegio(), obj.getCelular(), obj.getIdDistrito(), obj.getIdEstudiante() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public List<Estudiante> lista(int dni) {
		String sql = "select * from estudiante where dni = ?";
		Object[] val = { dni };

		List<Estudiante> lista = jdbcTemplate.query(sql, val, new RowMapper<Estudiante>() {
			@Override
			public Estudiante mapRow(ResultSet rs, int rowNum) throws SQLException {
				Estudiante obj = new Estudiante();
				obj.setIdEstudiante(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setApellidoPaterno(rs.getString(3));
				obj.setApellidoMaterno(rs.getString(4));
				obj.setDni(rs.getString(5));
				obj.setFechNac(rs.getString(6));
				obj.setColegio(rs.getString(7));
				obj.setCelular(rs.getInt(8));
				obj.setIdDistrito(rs.getInt(9));

				return obj;
			}
		});

		return lista;
	}

	@Override
	public List<Estudiante> listaN(String s) {
		String sql = "select * from estudiante where nombre like ?";
		Object[] val = { s + "%" };

		List<Estudiante> lista = jdbcTemplate.query(sql, val, new RowMapper<Estudiante>() {
			@Override
			public Estudiante mapRow(ResultSet rs, int rowNum) throws SQLException {
				Estudiante obj = new Estudiante();
				obj.setIdEstudiante(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setApellidoPaterno(rs.getString(3));
				obj.setApellidoMaterno(rs.getString(4));
				obj.setDni(rs.getString(5));
				obj.setFechNac(rs.getString(6));
				obj.setColegio(rs.getString(7));
				obj.setCelular(rs.getInt(8));
				obj.setIdDistrito(rs.getInt(9));

				return obj;
			}
		});

		return lista;
	}

}
