package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import model.mapper.MemberMapper;
//Model 기능을 담당하는 클래스
//Dao : Data Access Object 데이터베이스 로직 담당
public class MemberDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<MemberMapper> cls = MemberMapper.class;

	public List<Select_info> selectInfo() {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Select_info> list = session.getMapper(cls).selectInfo();
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
		
	}
	public List<Select_info> selectInfo2(int school_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Select_info> list = session.getMapper(cls).selectInfo2(school_num);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
		
	}
	
	
	
	public Member selectOne(String id) {
		// id : 화면에 입력된 아이디
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
		
			List<Member> list = session.getMapper(cls).select(map);

			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public int insert(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(cls).insert(mem);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return 0;
	}
	public List<GradeInfo> subjectinfo(String semester, String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("semester", semester);
			map.put("login", login);
			List<GradeInfo> list = session.getMapper(cls).subjectinfo(map);
			System.out.println("출력 :"+list);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Subject_info> selectSubject(int school, String dept) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("school_num", school);
			map.put("dept", dept);
			List<Subject_info> list = session.getMapper(cls).selectsubject(map);
			System.out.println("출력 :"+list);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public boolean subjectin(int subject_no, int credit, String login, double grade, String semester_code, int school_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("subject_no", subject_no);
			map.put("credit", credit);
			map.put("login", login);
			map.put("grade", grade);
			map.put("school_num", school_num);
			map.put("semester_code", semester_code);
			int result =  session.getMapper(cls).subjectinsert(map);
			if(result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	public List<Map<String, String>> gradestatistics(String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Map<String, String>> list = session.getMapper(cls).gradestatistics(login);
			System.out.println("출력 :"+list);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Subject_info> subjectinfo2(int subject_no, String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("login", login);
			map.put("subject_no", subject_no);
			List<Subject_info> list = session.getMapper(cls).selectsubject2(map);
			System.out.println("출력 :"+list);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public int subjectinsert(Subject_info s, String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("s", s);
			map.put("login", login);
			int result = session.getMapper(cls).subjectinsert2(map);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return 0;
	}
	//  학년/학기별 이수학점, 평균평점 
	public List<Grade_statistics> gradestatistics2(String login, String semester) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("login", login);
			map.put("semester", semester);
			List<Grade_statistics> list = session.getMapper(cls).statistics(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Grade_statistics> grade_avg(String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Grade_statistics> list = session.getMapper(cls).statistics2(login);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Subject_info> subjectView(int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Subject_info> list = session.getMapper(cls).subjectView(subject_no);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Subject_info2> subject2(String limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Subject_info2> list = session.getMapper(cls).subject2(limit);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	// 원그래프
	public List<Map<String, Integer>> gradestatistics2(String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Map<String, Integer>> list = session.getMapper(cls).gradestatistics2(login);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Map<String, Integer>> subjectstatistics2(int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Map<String, Integer>> list = session.getMapper(cls).subjectstatistics2(subject_no);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}

	public List<Map<String, Integer>> subjectstatistics3(int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Map<String, Integer>> list = session.getMapper(cls).subjectstatistics3(subject_no);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Map<String, Integer>> subjectstatistics4(int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Map<String, Integer>> list = session.getMapper(cls).subjectstatistics4(subject_no);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<String> score(int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<String> list = session.getMapper(cls).score(subject_no);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public List<Board> boardselect(String limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			List<Board> list = session.getMapper(cls).boardselect(limit);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public boolean selecteval(String semester, String login, int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("semester",  semester);
			map.put("login",  login);
			map.put("subject_no", subject_no);
			int cnt = session.getMapper(cls).selecteval(map);
			if(cnt > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return false;
	}
	public boolean gradedelete(String semester_code, String login, int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("semester_code", semester_code);
			map.put("login", login);
			map.put("subject_no", subject_no);	
			int result = session.getMapper(cls).gradedelete(map);
			if(result > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return false;
		
	}
	public List<GradeInfo> subjectOne(String semester_code, String login, int subject_no) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("semester_code", semester_code);
			map.put("login", login);
			map.put("subject_no", subject_no);
			List<GradeInfo> list = session.getMapper(cls).subjectOne(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return null;
	}
	public int updatePw(String login, String pw) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).updatePw(login, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public List<Subject_info3> gradeupdate(String login, int subject_no, String semester_code) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("login", login);
			map.put("subject_no", subject_no);
			map.put("semester_code", semester_code);
			
			return session.getMapper(cls).gradeupdate(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int scoreupdate(String login, int score) {
		SqlSession session = DBConnection.getConnection();
		try {
			
			Integer result =session.getMapper(cls).scoreupdate(login,score);
			if(result == null) {
				return 1;
			}else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public boolean duplicateIdCheck(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			String userId = session.getMapper(cls).duplicateIdCheck(id);
			if(userId == null) { // 사용가능 아이디
				return false;
			}else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	// 이건어따 쓰는거임 ㅜㅜㅜ
	public String selectsemester(String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			String semester = session.getMapper(cls).selectsemester(login);
			return semester;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public boolean secession(String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).secession(login);
			session.getMapper(cls).secession2(login);
			session.getMapper(cls).secession3(login);
			int result = session.getMapper(cls).secession4(login);
			if(result > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(session);
		}
		return false;
	}

	
	
	

}
