package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Pregunta;

@Repository
public class PreguntaMySqlRepositorio implements PreguntaRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	@Override
	public int inserta(Pregunta obj) {
		String sql="insert into pregunta values(null,?,?,?)";
		Object[] val= {obj.getnPregunta(),obj.getEnunciado(),obj.getIdMateria()};
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int elimina(int idPregunta) {
		String sql="update pregunta  set Npregunta=0 where idPregunta=?";
		Object[] val= {idPregunta};
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public int Actualiza(Pregunta obj) {
		String sql="update pregunta  set Npregunta=?,enunciado=?,idMateria=? where idPregunta=?";
		Object[] val= {obj.getnPregunta(),obj.getEnunciado(),obj.getIdMateria(),obj.getIdPregunta()};
		return jdbcTemplate.update(sql, val);
	}

	@Override
	public List<Pregunta> lista(String s) {
		List<Pregunta> lista = jdbcTemplate.query("select * from pregunta  where nPregunta like ?",new Object[] {s+"%"}, new RowMapper<Pregunta>() {
            @Override
            public Pregunta mapRow(ResultSet rs, int rowNum) throws SQLException {
            	Pregunta obj = new Pregunta();
            	obj.setIdPregunta(rs.getInt(1));
            	obj.setnPregunta(rs.getString(2));
            	obj.setEnunciado(rs.getString(3));
            	obj.setIdMateria(rs.getInt(4));           	         	
                return obj;
            }
        });
        return lista;
	}

}
