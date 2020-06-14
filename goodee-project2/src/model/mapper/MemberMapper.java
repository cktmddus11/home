package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.GradeInfo;
import model.Grade_statistics;
import model.Member;
import model.Select_info;
import model.Subject_info;
import model.Subject_info2;
import model.Subject_info3;

public interface MemberMapper {
	@Select({"<script>select distinct school, school_num, dept from select_info2</script>"})
	List<Select_info> selectInfo();
	
	
	@Select({"<script>select distinct dept from select_info2 "
			+ " where school_num = #{school_num}"
			+ "</script>"})
	List<Select_info> selectInfo2(int school_num);
	

	@Insert({
		"insert into member (mem_id, mem_password, mem_name,"
		+ "mem_nickname, mem_birth, mem_school, mem_dept, "
		+ "score, mem_img) values"
		+ " (#{mem_id}, #{mem_password}, #{mem_name}, #{mem_nickname}"
		+ ", #{mem_birth}, #{school_num}, #{mem_dept}, 120, #{mem_img})"})
	int insert(Member mem);

	
	
	@Select({
		"<script>select mem_id, mem_password ,mem_name, mem_birth,mem_dept, mem_nickname, school_num, school, m.score, m.mem_img from "
		+ "select_info2 s1, member m where s1.school_num = m.mem_school and m.mem_id = #{id}"
		+ " group by mem_id</script>"
	})
	
	List<Member> select(Map<String, Object> map);
	
	@Select({" select s1.mem_id, s1.subject_no, s1.semester_code, subject, s1.credit, grade "
			+ "from subject_info s1, select_info2 s2 "
			+ "where s1.subject_no=s2.subject_no and "
			+ "mem_id = #{login} and semester_code= #{semester}"})
	List<GradeInfo> subjectinfo(Map<String, Object> map);
	
	@Select({"select subject_no,subject, credit,room, professor from select_info2 "
			+ "where school_num = #{school_num} "
			+ "and dept=#{dept}"})
	List<Subject_info> selectsubject(Map<String, Object> map);

	@Insert({
		" insert into subject_info (subject_no, mem_id, semester_code, credit, grade, school_num) values "
		+ " (#{subject_no}, #{login}, #{semester_code}, #{credit},"
		+ "#{grade}, #{school_num})"
	})
	int subjectinsert(Map<String, Object> map);

	@Select("select semester_code, grade_avg from grade_statistics where mem_id = #{login} order by semester_code asc")
	List<Map<String, String>> gradestatistics(String login);

	@Select({" select s1.subject_no, subject "
			+ "from subject_info s1, select_info2 s2 "
			+ "where s1.subject_no=s2.subject_no and "
			+ "s1.mem_id = #{login} and s1.subject_no= #{subject_no}"})
	List<Subject_info> selectsubject2(Map<String, Object> map);


	// 강의평 내용 추가
	@Insert("update subject_info set homework_info = #{s.homework_info}, "
			+ "grade_info = #{s.grade_info}, attendance_info = #{s.attendance_info},"
			+ " score = #{s.score}, eval_text = #{s.eval_text},"
			+ "eval_date = now() "
			+ "where subject_no = #{s.subject_no} and mem_id = #{login} and semester_code=#{s.semester}")
	int subjectinsert2(Map<String, Object> map);

	@Select("select semester_code, round(grade_avg,2) grade_avg, sum_credit from grade_statistics "
			+ " where mem_id = #{login} and semester_code = #{semester}")
	List<Grade_statistics> statistics(Map<String, Object> map);

	@Select("select round(avg(grade_avg),2) grade_avg, sum(sum_credit) sum_credit "
			+ "from grade_statistics where mem_id = #{login}")
	List<Grade_statistics> statistics2(String login);

	 

	
	/*// 강의평 리스트 
	@Select("select *from subject_info where subject_no = #{subject_no} and eval_text is not null")
	List<Subject_info> subjectView(int subject_no);
	
	// 강의평 리스트 상단에 강의 이름
	@Select("select distinct subject from subject_info s1, select_info2 s2 "
			+ "where s1.subject_no = s2.subject_no "
			+ "and s1.subject_no = #{subject_no}")*/
	
	
	// 강의평 리스트 +강의평 리스트 상단에 강의 이름
	@Select("select *, s2.semester_code semester, (select subject From select_info2 s1 where s1.subject_no = s2.subject_no) subject "
			+ "from subject_info s2 "
			+ "where s2.subject_no = #{subject_no} and s2.eval_text is not null "
			+ "order by eval_date desc")
	List<Subject_info> subjectView(int subject_no);
	
	
	// 메인 화면 - 학과 관련없이보는 강의평
	@Select("<script>select *, (select subject From select_info2 s1 where s1.subject_no = s2.subject_no) subject" + 
			" from subject_info s2, select_info2 " + 
			" where s2.subject_no = select_info2.subject_no and s2.eval_text is not null" + 
			" order by eval_date desc"
			+ "<if test='value != null'> limit 5</if></script>")
	List<Subject_info2> subject2(String limit);

	// 원그래프
	@Select("select " + 
			"(case grade " + 
			"when 4.5 then 'A+'" + 
			"when 4.0 then 'A0'" + 
			"when 3.5 then 'B+'" + 
			"when 3.0 then 'B0'" + 
			"when 2.5 then 'C+'" + 
			"when 2.0 then 'C0'" + 
			"when 1.5 then 'D+'" + 
			"when 1.0 then 'D0'" + 
			"when -0.1 then 'P'" + 
			"when -0.2 then 'F'" + 
			"end) grade2, count(*) cnt " + 
			"from subject_info where mem_id = #{login} " + 
			"group by grade order by grade desc")
	List<Map<String, Integer>> gradestatistics2(String login);

	@Select("select (" + 
			" case homework_info" + 
			" when 1 then '많음'" + 
			"    when 2 then '보통'" + 
			"    when 3 then '적음'" + 
			"    end) as homework,  count(*) cnt" + 
			"   from subject_statistics where subject_no = #{subject_no} group by homework_info")
	List<Map<String, Integer>> subjectstatistics2(int subject_no);

	@Select("select  (" + 
			" case grade_info" + 
			" when 1 then '잘줌'" + 
			"    when 2 then '보통'" + 
			"    when 3 then '깐깐'" + 
			"    end) as grade, count(*) cnt" + 
			"   from subject_statistics where subject_no = #{subject_no} group by  grade_info")
	List<Map<String, Integer>> subjectstatistics3(int subject_no);

	@Select("select (" + 
			" case attendance_info" + 
			" when 1 then '직접호명'" + 
			"    when 2 then '전자출결'" + 
			"    end) as attendance, count(*) cnt" + 
			"   from subject_statistics where subject_no = #{subject_no} group by attendance_info;")
	List<Map<String, Integer>> subjectstatistics4(int subject_no);

	@Select("select avg(score) From subject_info where subject_no = #{subject_no} and eval_text is not null")
	List<String> score(int subject_no);

	// 메인페이지 게시판
	@Select("<script>select num, mem_id, readcnt,"
			+ "(select mem_nickname from member where member.mem_id =board.mem_id) nickname, "
			+ "title, regdate, "
			+ "(select count(*) from up where up.num = board.num) up "
			+ "from board order by up desc, readcnt desc"
			+"<if test='value != null'> limit 6</if>"// limit 값이 있으면 메인화면에 게시글 상위 6개만 출력하려고
			+ "</script>") 
	List<Board> boardselect(String limit);

	
	@Select("select count(*)from subject_info where eval_text is not null and semester_code = #{semester} and mem_id = #{login} and subject_no= #{subject_no}")
	int selecteval(Map<String, Object> map);

	@Select("select *From subject_info where semester_code = "
			+ "#{semester_code} and mem_id=#{login} and subject_no = #{subject_no}")
	List<GradeInfo> subjectOne(Map<String, Object> map);

	@Delete("delete from subject_info where semester_code ="+ 
		"#{semester_code} and mem_id=#{login} and subject_no = #{subject_no} ")
	int gradedelete(Map<String, Object> map);

	
	@Update("update member set mem_password = #{pw} where mem_id = #{id}")
	int updatePw(@Param("id") String id, @Param("pw") String pw);

	// 수정할 정보 조회
	@Select("select mem_id, semester_code, subject_no, grade, "
			+ "(select subject from select_info2 s1 "
			+ "where s1.subject_no = s.subject_no) subject from subject_info s"
			+ " where mem_id = #{mem_id} and semester_code = #{semester_code} "
			+ "and subject_no = #{subject_no}")
	List<Subject_info3> gradeupdate(Map<String, Object> map);


	@Select("update member set score=#{score} where mem_id=#{login}")
    Integer scoreupdate(@Param("login") String login, @Param("score") int score);

	@Select("select mem_id from member where mem_id = #{id}")
	String duplicateIdCheck(String id);

	@Select("select distinct semester_code From subject_info where mem_id = #{login}")
	String selectsemester(String login);

	
	// 회원탈퇴
	@Delete("delete from comment where comment_id = #{login}")
	void secession(String login);

	@Delete("delete from board where mem_id = #{login}")
	void secession2(String login);

	@Delete("delete from subject_info where mem_id = #{login}")
	void secession3(String login);

	@Delete("delete from member where mem_id = #{login}")
	int secession4(String login);




	
	
	
	
}
