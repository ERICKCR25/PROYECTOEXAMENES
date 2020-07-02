package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.*;

@Repository
public class EventoMySqlRepositorio implements EventoRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<Evento> mapperEvento = new RowMapper<Evento>() {

		@Override
		public Evento mapRow(ResultSet rs, int rowNum) throws SQLException {
			Evento obj = new Evento();
			obj.setIdEvento(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setFechaEvento(rs.getString(3));
			obj.setFechaPublicacion(rs.getString(4));
			obj.setFechaRegistro(rs.getString(5));
			obj.setEstado(rs.getInt(6));
			
			Empresa emp = new Empresa();
			
			emp.setIdEmpresa(rs.getInt(7));
			emp.setNombre(rs.getString(8));
			emp.setRuc(rs.getString(9));
			emp.setDireccion(rs.getString(10));
			emp.setCorreo(rs.getString(11));
			
			Distrito dist = new Distrito();
			Provincia prov= new Provincia();
			Departamento depa= new Departamento();
			
			dist.setIdDistrito(rs.getInt(12));
			dist.setDistrito(rs.getString(13));
			dist.setProvincia(prov);
			
				prov.setIdProvincia(rs.getInt(14));
				prov.setProvincia(rs.getString(15));
				prov.setDepartamento(depa);
				
					depa.setIdDepartamento(rs.getInt(16));
					depa.setDepartamento(rs.getString(17));
					
			emp.setDistrito(dist);
			
			obj.setEmpresa(emp);
			
			return obj;
		}
	};

//	@Override
//	public int inserta(Evento obj) {
//		String sql = "insert into evento values (null,?,?,?,?,?)";
//		Object[] val = { obj.getNombre(), obj.getFechaEvento(), obj.getFechaPublicacion(), obj.getFechaRegistro(),
//				obj.getIdEmpresa() };
//		return jdbcTemplate.update(sql, val);
//	}
	
	@Override
	public Evento insertaActualizaEvento(Evento obj) {
		Evento salida=null;
		obj.setEstado(1);
		if(obj.getIdEvento()==0) {
			jdbcTemplate.update("insert into evento values (null,?,?,?,?,?,?)",
			new Object [] {obj.getNombre(),obj.getFechaEvento(),obj.getFechaPublicacion(),obj.getFechaRegistro(),obj.getEstado(),obj.getEmpresa().getIdEmpresa()});
			List<Evento> lista = jdbcTemplate.query("select ev.*,em.nombre,em.ruc,em.direccion,em.correo,dist.idDistrito,dist.Distrito,dist.idProvincia,prov.provincia,prov.idDepartamento,depa.Departamento from evento ev inner join empresa em on em.idEmpresa=ev.idEmpresa inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento order by ev.idEmpresa desc limit 0, 1",new Object[] {}, mapperEvento);
			salida=lista.get(0);
		}else {
			jdbcTemplate.update("update evento set nombre=?,fechaevento=?,fechapublicacion=?,fecharegistro=?,estado=?,idempresa=? where idEvento=?",
					new Object [] {obj.getNombre(),obj.getFechaEvento(),obj.getFechaPublicacion(),obj.getFechaRegistro(),obj.getEstado(),obj.getEmpresa().getIdEmpresa(),obj.getIdEvento()});
					List<Evento> lista = jdbcTemplate.query("select ev.*,em.nombre,em.ruc,em.direccion,em.correo,dist.idDistrito,dist.Distrito,dist.idProvincia,prov.provincia,prov.idDepartamento,depa.Departamento from evento ev inner join empresa em on em.idEmpresa=ev.idEmpresa inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento",new Object[] {obj.getIdEvento()}, mapperEvento);
					salida=lista.get(0);
		}
		
		return salida;
	}
	
	@Override
	public int elimina(int idEvento) {
		String sql = "update evento set estado=2 where idEvento=?";
		Object [] val ={idEvento};
		return jdbcTemplate.update(sql, val);	}
	



	

	@Override
	public List<Evento> listaPorNombre(String nombre) {
		
		List<Evento> lista= jdbcTemplate.query("select ev.*,em.nombre,em.ruc,em.direccion,em.correo,dist.idDistrito,dist.Distrito,dist.idProvincia,prov.provincia,prov.idDepartamento,depa.Departamento from evento ev inner join empresa em on em.idEmpresa=ev.idEmpresa inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento where ev.nombre like ? and ev.estado=1",new Object [] {nombre},mapperEvento);;
		return lista;
	}
	
	
	@Override
	public List<Evento> lista() {
		List<Evento> lista=jdbcTemplate.query("select ev.*,em.nombre,em.ruc,em.direccion,em.correo,dist.idDistrito,dist.Distrito,dist.idProvincia,prov.provincia,prov.idDepartamento,depa.Departamento from evento ev inner join empresa em on em.idEmpresa=ev.idEmpresa inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento where ev.estado=1",new Object [] {},mapperEvento);
		return lista;
	}


	
	

}
