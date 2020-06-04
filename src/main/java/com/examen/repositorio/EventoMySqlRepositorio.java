package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Evento;

@Repository
public class EventoMySqlRepositorio implements EventoRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int inserta(Evento obj) {
		String sql = "insert into evento values (null,?,?,?,?,?)";
		Object[] val = { obj.getNombre(), obj.getFechaEvento(), obj.getFechaPublicacion(), obj.getFechaRegistro(),
				obj.getIdEmpresa() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int elimina(int idEvento) {
		String sql = "delete from evento where idEvento = ?";
		Object [] val ={idEvento};
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int actualiza(Evento obj) {
		String sql = "update evento set nombre=?,fechaEvento=?, fechaPublicacion=?,fechaRegistro=?,idEmpresa=? where idEvento = ?";
		Object[] val = { obj.getNombre(), obj.getFechaEvento(), obj.getFechaPublicacion(), obj.getFechaRegistro(),
				obj.getIdEmpresa(),obj.getIdEvento() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public List<Evento> lista(int id) {
		String sql = "select * from evento where idEvento=?";
		Object [] val = {id};
		List<Evento> lista = jdbcTemplate.query(sql, val, new RowMapper<Evento>() {
			@Override
			public Evento mapRow(ResultSet rs, int rowNum) throws SQLException {
				Evento obj = new Evento();
				obj.setIdEvento(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setFechaEvento(rs.getString(3));
				obj.setFechaPublicacion(rs.getString(4));
				obj.setFechaRegistro(rs.getString(5));
				obj.setIdEmpresa(rs.getInt(6));

				return obj;
			}
		});
		return lista;
	}

	@Override
	public List<Evento> listaN(String s) {
		String sql = "select * from evento where nombre like ?";
		Object [] val = {s + "%"};
		List<Evento> lista = jdbcTemplate.query(sql, val, new RowMapper<Evento>() {
			@Override
			public Evento mapRow(ResultSet rs, int rowNum) throws SQLException {
				Evento obj = new Evento();
				obj.setIdEvento(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setFechaEvento(rs.getString(3));
				obj.setFechaPublicacion(rs.getString(4));
				obj.setFechaRegistro(rs.getString(5));
				obj.setIdEmpresa(rs.getInt(6));

				return obj;
			}
		});
		return lista;
	}

}
