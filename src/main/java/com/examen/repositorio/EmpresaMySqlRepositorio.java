package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Empresa;

@Repository
public class EmpresaMySqlRepositorio implements EmpresaRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int inserta(Empresa obj) {
		String sql = "insert into empresa values (null,?,?,?,?,?)";
		Object[] val = { obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getIdDistrito(), obj.getCorreo() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int elimina(int idEmpresa) {
		String sql = "delete from empresa where idEmpresa = ?";
		Object[] val = { idEmpresa };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int actualiza(Empresa obj) {
		String sql = "update empresa set nombre=?,ruc=?,direccion=?,idDistrito=?,correo=? where idEmpresa=?";
		Object[] val = { obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getIdDistrito(), obj.getCorreo(),
				obj.getIdEmpresa() };
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public List<Empresa> lista(int ruc) {
		String sql = "select * from empresa where ruc=?";
		Object [] val = {ruc};
		List<Empresa> lista = jdbcTemplate.query(sql, val, new RowMapper<Empresa>() {
			@Override
			public Empresa mapRow(ResultSet rs, int rowNum) throws SQLException {
				Empresa obj = new Empresa();
				obj.setIdEmpresa(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setRuc(rs.getString(3));
				obj.setDireccion(rs.getString(4));
				obj.setIdDistrito(rs.getInt(5));
				obj.setCorreo(rs.getString(6));

				return obj;
			}
		});
		return lista;
	}

	@Override
	public List<Empresa> listaN(String s) {
		String sql = "select * from empresa where nombre like ?";
		Object [] val = {s + "%"};
		List<Empresa> lista = jdbcTemplate.query(sql, val, new RowMapper<Empresa>() {
			@Override
			public Empresa mapRow(ResultSet rs, int rowNum) throws SQLException {
				Empresa obj = new Empresa();
				obj.setIdEmpresa(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setRuc(rs.getString(3));
				obj.setDireccion(rs.getString(4));
				obj.setIdDistrito(rs.getInt(5));
				obj.setCorreo(rs.getString(6));

				return obj;
			}
		});
		return lista;
	}

}
