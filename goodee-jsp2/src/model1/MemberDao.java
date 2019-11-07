package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// Model ����� ����ϴ� Ŭ����
// Dao : Data Access Object �����ͺ��̽� ���� ���
public class MemberDao {
	public Member selectOne(String id) {
		// id : ȭ�鿡 �Էµ� ���̵�
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *from member where binary id = ?"; // binary ��ҹ��ڱ���?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // return null ���� �����ǽ���
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}

	public int insert(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id, pass, name, gender, email, tel, picture) "
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getTel());
			pstmt.setString(7, m.getPicture());
			// int executeUpdate() : ����� ���ڵ� �Ǽ�
			return pstmt.executeUpdate(); // insert ���� : 1
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // pstmt.executeUpdate() ������ �ص� Ŀ�ؼ��� ����
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert ����

	}

	public List<Member> list(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>(); // list��ġ ����
		try {
			String sql = "select *from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { // pstmt.executeUpdate() ������ �ص� Ŀ�ؼ��� ����
			DBConnection.close(conn, pstmt, null);
		}
		return null;
	}
	public int update(Member dao) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set email = ?, "+
		"gender = ?, tel = ?, picture = ?, name = ? where id= ?";
		System.out.println(dao);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dao.getEmail());
			pstmt.setInt(2, dao.getGender());
			pstmt.setString(3, dao.getTel());
			pstmt.setString(4, dao.getPicture());
			pstmt.setString(5, dao.getName());
			pstmt.setString(6, dao.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();
			return result;
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int updatePw(String id, String pass) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set pass = ? where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			int result = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
		
	}

	public String selectID(String email, String tel) {
		Connection conn= DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member where email = ? and tel = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public String selectPW(String email, String tel, String id) {
		Connection conn= DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from member where email = ? and tel = ? and id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pass");
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	

}
