package com.studyspring.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import dto.Student;
import model.DBConnection;

public class Selectmember {
	public Student getStudentById(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			 conn = DBConnection.getConnection();
			 stmt = conn.prepareStatement("select id, name from student where id = ?");
			 stmt.setString(1,  id);
			 rs = stmt.executeQuery();
			 Student student = null;
			 if(rs.next()) {
				 student = new Student();
				 student.setId(rs.getString(1)); // id
				 student.setName(rs.getString(2)); // name
			 }
			 return student;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, stmt, rs);
		}
		return null;
	}
	private NamedParameterJdbcTemplate template;
	public void setDataSource(DataSource dataSource) {
		this.template = new NamedParameterJdbcTemplate(dataSource);
	}
	
	
	public Student getStudentById2(String id) {
		String sql = "select id, name from student where id=:id";
		/*return template.queryForObject(sql, new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int rowNum) {
				Student student = new Student();
				 student.setId(rs.getString(1)); // id
				 student.setName(rs.getString(2)); // name
				 return student;
			}
		}, id);*/
		RowMapper<Student> mapper = new BeanPropertyRowMapper<Student>(Student.class);
		Map<String, String> param = new HashMap<String, String>();
		param.put("id",  id);
		return template.queryForObject(sql, param, mapper);
	}
}
