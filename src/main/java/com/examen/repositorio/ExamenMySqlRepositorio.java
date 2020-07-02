package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Examen;

@Repository
public class ExamenMySqlRepositorio implements ExamenRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int inserta(Examen obj) {
		String sql = "insert into Examen values(null,?,?,?,?,?,?,?)";
		Object[] val = { obj.getNombre(), obj.getDescripcion(), obj.getClaves(), obj.getNumPreguntas(),
				obj.getValorAprobatorio(),  obj.getPorAprobacion(),obj.getValorTotal() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int elimina(int idExamen) {
		String sql = "update Examen set claves='',numPreguntas=0, valoraprobatorio=0,poraprobacion=0,valortotal=0 where idExamen=?";
		Object[] val = { idExamen };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int actualiza(Examen obj) {
		String sql = "update Examen set nombre=?,descripcion=?,claves=?,numPreguntas=?,valorAprobatorio=?, porAprobacion=?, valorTotal=? where idExamen=?";
		Object[] val = { obj.getNombre(),obj.getDescripcion(),obj.getClaves(),obj.getNumPreguntas(),obj.getValorAprobatorio(),obj.getPorAprobacion(),obj.getValorTotal(),obj.getIdexamen() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public List<Examen> lista(int id) {
		String sql = "select * from examen where idExamen like ?";
		Object[] val = { id + "%" };

		List<Examen> lista = jdbcTemplate.query(sql, val, new RowMapper<Examen>() {
			@Override
			public Examen mapRow(ResultSet rs, int rowNum) throws SQLException {
				Examen obj = new Examen();
				obj.setIdexamen(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setDescripcion(rs.getString(3));
				obj.setClaves(rs.getString(4));
				obj.setNumPreguntas(rs.getInt(5));
				obj.setValorAprobatorio(rs.getInt(6));
				obj.setPorAprobacion(rs.getInt(7));

				obj.setValorTotal(rs.getInt(8));
				return obj;
			}
		});
		return lista;
	}
	
	public List<Examen> listaN(String s) {
		String sql = "select * from examen where nombre like ?";
		Object[] val = { s + "%" };

		List<Examen> lista = jdbcTemplate.query(sql, val, new RowMapper<Examen>() {
			@Override
			public Examen mapRow(ResultSet rs, int rowNum) throws SQLException {
				Examen obj = new Examen();
				obj.setIdexamen(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setDescripcion(rs.getString(3));
				obj.setClaves(rs.getString(4));
				obj.setNumPreguntas(rs.getInt(5));
				obj.setValorAprobatorio(rs.getInt(6));
				obj.setPorAprobacion(rs.getInt(7));

				obj.setValorTotal(rs.getInt(8));
				return obj;
			}
		});
		return lista;
	}
	
	

}
