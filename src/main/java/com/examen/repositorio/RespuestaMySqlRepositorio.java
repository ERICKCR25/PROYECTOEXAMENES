package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Respuesta;
@Repository
public class RespuestaMySqlRepositorio implements RespuestaRepositorio {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int inserta(Respuesta obj) {
		String sql="insert into respuesta values(null,?,?,?)";
		Object[] val= {obj.getDetalle(),obj.getTipo(),obj.getIdPregunta()};
		return jdbcTemplate.update(sql,val);
	}

	@Override
	public int actualiza(Respuesta obj) {
		String sql="update respuesta set detalle=?,tipo=?,idPregunta=? where idRespuesta=?";
		Object[] val= {obj.getDetalle(),obj.getTipo(),obj.getIdPregunta(),obj.getIdRespuesta()};
		return jdbcTemplate.update(sql,val);
	}

	@Override
	public int elimina(int idRespuesta) {
		String sql="update respuesta set detalle='' where idRespuesta = ?";
		Object[] val= {idRespuesta};
		return jdbcTemplate.update(sql,val);
	}

	@Override
	public List<Respuesta> lista(int idPregunta) {
		List <Respuesta> lista= jdbcTemplate.query("select * from respuesta  where idPregunta = ?",new Object[] {idPregunta}, new RowMapper<Respuesta>() {
            @Override
            public Respuesta mapRow(ResultSet rs, int rowNum) throws SQLException {
            	Respuesta obj= new Respuesta();
            	obj.setIdRespuesta(rs.getInt(1));
            	obj.setDetalle(rs.getString(2));
            	obj.setTipo(rs.getInt(3));
            	obj.setIdPregunta(rs.getInt(4));           	
            	return obj;
            }
        });
        return lista;
	}

}
