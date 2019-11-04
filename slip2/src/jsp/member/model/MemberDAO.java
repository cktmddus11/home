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
			// 자동 커밋 false
			conn.setAutoCommit(false);
			
			// 쿼리 생성
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
			// Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		
	}// end insertMember()
	
	// 로그인 시 아이디, 비밀번호 체크 메서드
	// 아이디, 비밀번호를 인자로 받는다
	public int loginCheck(int id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//String dbPW = ""; // db에서 꺼낸 비밀번호를 담은 변수 
		int x = -1;
		
		try {
			// 쿼리 - 먼저 입력된 아이디로 db에서 비밀번호 조회
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
					x = 1; // 넘겨받은 비번과 db에서 꺼내온 비번 비교, 같으면 인증 성공
				else
					x = 0; // db의 비밀번호와 입력받은 비밀번호 다름, 인증 실패d
				
			}else {
				x = -1; // 해당 아이디가 없을 경우 
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
