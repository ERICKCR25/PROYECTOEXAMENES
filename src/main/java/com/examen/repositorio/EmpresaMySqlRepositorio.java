package com.examen.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.examen.entidad.Departamento;
import com.examen.entidad.Distrito;
import com.examen.entidad.Empresa;
import com.examen.entidad.Provincia;

@Repository
public class EmpresaMySqlRepositorio implements EmpresaRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<Empresa> mapperEmpresa= new RowMapper<Empresa>() {

		@Override
		public Empresa mapRow(ResultSet rs, int rowNum) throws SQLException {
			Empresa obj= new Empresa();
			obj.setIdEmpresa(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setRuc(rs.getString(3));
			obj.setDireccion(rs.getString(4));
			obj.setCorreo(rs.getString(5));			
			
			
			Distrito dist = new Distrito();
			Provincia prov= new Provincia();
			Departamento depa= new Departamento();
			
			dist.setIdDistrito(rs.getInt(6));
			dist.setDistrito(rs.getString(8));
			dist.setProvincia(prov);
			
				prov.setIdProvincia(rs.getInt(9));
				prov.setProvincia(rs.getString(11));
				prov.setDepartamento(depa);
				
					depa.setIdDepartamento(rs.getInt(12));
					depa.setDepartamento(rs.getString(14));
					
			obj.setDistrito(dist);
			return obj;
		}
	};



	@Override
	public int elimina(int idEmpresa) {
		String sql = "delete from empresa where idEmpresa = ?";
		Object[] val = { idEmpresa };
		return jdbcTemplate.update(sql, val);
	}



	@Override
	public List<Empresa> listaRuc(int ruc) {
		String sql = "select * from empresa where ruc=?";
		Object [] val = {ruc};
		List<Empresa> lista = jdbcTemplate.query(sql, val,mapperEmpresa);
		return lista;
	}

	@Override
	public List<Empresa> listaN(String s) {
		String sql = "select * from empresa em inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento where nombre like ?";
		Object [] val = {s + "%"};
		List<Empresa> lista = jdbcTemplate.query(sql, val,mapperEmpresa);
		return lista;
	}

	@Override
	public List<Empresa> lista() {
		List <Empresa> lista= jdbcTemplate.query("select * from empresa em inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento",new Object[] {}, mapperEmpresa);
		return lista;
	}

//	@Override
//	public int inserta(Empresa obj) {
//		String sql = "insert into empresa values (null,?,?,?,?,?)";
//		Object[] val = { obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getIdDistrito(), obj.getCorreo() };
//		return jdbcTemplate.update(sql, val);
//	}
	
	
//	@Override
//	public int actualiza(Empresa obj) {
//		String sql = "update empresa set nombre=?,ruc=?,direccion=?,idDistrito=?,correo=? where idEmpresa=?";
//		Object[] val = { obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getIdDistrito(), obj.getCorreo(),obj.getIdEmpresa() };
//		return jdbcTemplate.update(sql, val);
//	}
	
	@Override
	public Empresa insertaActualiza(Empresa obj) {
		Empresa salida=null;
		if (obj.getIdEmpresa()==0) {
			jdbcTemplate.update("insert into empresa values (null,?,?,?,?,?)",
			new Object[] { obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getDistrito().getIdDistrito(), obj.getCorreo()});
			List <Empresa> lista= jdbcTemplate.query("select * from empresa em inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento order by em.idEmpresa desc limit 0, 1",new Object[] {}, mapperEmpresa);
			salida=lista.get(0);
		}else {
			jdbcTemplate.update("update empresa set nombre=?,ruc=?,direccion=?,correo=?,idDistrito=? where idEmpresa=?"
					,new Object[] {obj.getNombre(), obj.getRuc(), obj.getDireccion(), obj.getCorreo(), obj.getDistrito().getIdDistrito(),obj.getIdEmpresa()});
			List <Empresa> lista= jdbcTemplate.query("select * from empresa em inner join distrito dist on dist.idDistrito=em.idDistrito inner join provincia prov on prov.idProvincia=dist.idProvincia inner join departamento depa on depa.idDepartamento=prov.idDepartamento ",new Object[] {}, mapperEmpresa);
			salida=lista.get(0);
			
		}
		
		return salida;
	}

}
