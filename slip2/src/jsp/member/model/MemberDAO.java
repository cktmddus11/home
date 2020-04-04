package jsp.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.DriverManager;


public class MemberDAO {
	private static MemberDAO instance;
	
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}
	public void insertMember(MemberBean member) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
			String user = "root";
			String pass = "1234";
			conn = DriverManager.getConnection(jdbcDriver, user, pass);
			// �ڵ� Ŀ�� false
			conn.setAutoCommit(false);
			
			// ���� ����
			StringBuffer sql = new StringBuffer();
			sql.append("insert into join_c values"
					+ "(?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,  member.getId());
			pstmt.setString(2,  member.getName());
			pstmt.setString(3,  member.getPasswd());
			pstmt.setString(4,  member.getDept());
			
			pstmt.executeUpdate();
			
			conn.commit();
		}catch(ClassNotFoundException | SQLException sqle) {
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		}finally {
			// Connection, PreparedStatement�� �ݴ´�.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		
	}// end insertMember()
	
	// �α��� �� ���̵�, ��й�ȣ üũ �޼���
	// ���̵�, ��й�ȣ�� ���ڷ� �޴´�
	public int loginCheck(int id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ���� 
		int x = -1;
		
		try {
			// ���� - ���� �Էµ� ���̵�� db���� ��й�ȣ ��ȸ
			StringBuffer query =new StringBuffer();
			query.append("select passwd as password from join_c where ID = ?");
			
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
			String user = "root";
			String pass = "1234";
			
			conn = DriverManager.getConnection(jdbcDriver, user, pass);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbPW = rs.getString("password");
				
				if(dbPW.equals(pw))
					x = 1; // �Ѱܹ��� ����� db���� ������ ��� ��, ������ ���� ����
				else
					x = 0; // db�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ���� ����d
				
			}else {
				x = -1; // �ش� ���̵� ���� ��� 
			}
			
			return x;	
		}catch(Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		}finally {
			try {
				if(pstmt != null) {pstmt.close(); pstmt = null;}
				if(conn != null) {conn.close(); conn = null; }
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}// end logincheck
	
	
}
