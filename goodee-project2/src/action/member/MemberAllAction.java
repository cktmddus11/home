package action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import action.member.dto.response.BoardResponseDTO;
import action.member.dto.response.EvalResponseDTO;
import action.member.dto.response.SubjectResponseDTO;
import model.Board;
import model.GradeInfo;
import model.Grade_statistics;
import model.Member;
import model.MemberDao;
import model.Select_info;
import model.Subject_info;
import model.Subject_info2;
import model.Subject_info3;

public class MemberAllAction {

	private boolean checklogin(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		String id = request.getParameter("id");

		if (login == null || login.trim().equals("")) { // 로그인 안돼있으면
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "../member/loginForm.do");
			return false;
			// MainAction 이 이 클래스 상속받아서 이클래스를 먼저 들려서
			// 가기전에 여기서 걸려서 doExecute가 실행 안됨?
		} else { // 로그인 돼있으면
			if (!login.equals("admin") && id != null && !login.equals(id)) { // 로그인정보가 admin이 아니면서 로그인정보와 파라미터 정보가 일치하지
																				// 않으면
				request.setAttribute("msg", "본인만 가능합니다.");
				request.setAttribute("url", "main/main.me");
				return false;
			}
		}
		// 위에 조건문 다 아니면 로그인상태여야만 MainAction 클래스의 doExecute메서드호출됨
		return true;
	}

	private MemberDao dao = new MemberDao();

	public ActionForward login(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String id = request.getParameter("id");
		String pass = request.getParameter("password");

		String msg = "해당하는 id가 존재하지 않습니다. ";
		String url = "loginForm.do";

		Member mem = new MemberDao().selectOne(id);
		if (mem != null) { // id가 존재하면
			if (pass.equals(mem.getMem_password())) { // 입력한 비밀번호와 db비밀번호가같으면
				request.getSession().setAttribute("login", id); // session은 자바의 내장객체가 아니고 jsp에 내장객체?
				msg = mem.getMem_name() + "님이 로그인하셨습니다.";
				url = "../main/main.do";
			} else {// 입력한 비밀번호와 db비밀번호가 다르면
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward joinForm(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		List<Select_info> s = dao.selectInfo();
		request.setAttribute("select_info", s);
		return new ActionForward();
	}

	public ActionForward select(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int school_num = Integer.parseInt(request.getParameter("school_num"));
		System.out.println("학교 :" + school_num);
		List<Select_info> s = dao.selectInfo2(school_num);
		request.setAttribute("select_info2", s);
		return new ActionForward();
	}

	public ActionForward join(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Member mem = new Member();

		mem.setMem_id(request.getParameter("id"));
		mem.setMem_password(request.getParameter("password"));
		mem.setMem_name(request.getParameter("name"));
		mem.setMem_nickname(request.getParameter("nickname"));
		mem.setMem_birth(request.getParameter("birth"));
		mem.setSchool_num(Integer.parseInt(request.getParameter("select1")));
		mem.setMem_dept(request.getParameter("select2"));
		mem.setMem_img(request.getParameter("picture"));

		String msg = "회원가입 실패";
		String url = "loginForm.do";
		System.out.println("출력 : " + mem);

		if (dao.insert(mem) > 0) {
			msg = mem.getMem_id() + "회원가입 성공";
			url = "loginForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			String msg = (String) request.getSession().getAttribute("login") + "님이 로그아웃되셨습니다.";
			String url = "loginForm.do";
			request.getSession().invalidate();
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward main(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		if (checklogin(request, response)) { // main접근 전 로그인 검증
			// decorator2.jsp에 메뉴바에 사용자 정보 나타내기 위함
			String login = (String) request.getSession().getAttribute("login");
			Member mem = new MemberDao().selectOne(login);
			request.getSession().setAttribute("mem", mem);
			
			return new ActionForward(); // 검증에서 아무것도 걸린게 없으면 true
		}
		// 검증에서 걸린게 있으면
		return new ActionForward(false, "../alert.jsp");
	}

	// 메인화면 게시판 로드하는 메서드
	public BoardResponseDTO boardlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		BoardResponseDTO data = new BoardResponseDTO();
		data.setSuccess(true);
		// 자유게시판
		List<Board> list3 = dao.boardselect();
		if(list3.isEmpty()) {
			data.setSuccess(false);
			data.setMessage("아직 작성된 게시글이 없어요");
		}else {
			data.setList3(list3);
		}
		return data;
	}
	// 메인화면 과목리스트 로드하는 메서드
	public SubjectResponseDTO subjectlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		SubjectResponseDTO data = new SubjectResponseDTO();
		data.setSuccess(true);
		
		String login = (String) request.getSession().getAttribute("login");
		
		String semester = request.getParameter("semester");
		if (semester == null) {
			 semester = "1-1";
		}
		request.setAttribute("semester3", semester);
		
		
		List<GradeInfo> list = dao.subjectinfo(semester, login);
		if(list.isEmpty()) { // 학기에 수강과목으로 담은 과목이 없으면
			data.setMessage("수강과목으로 담은 과목이 없어요");
			data.setSuccess(false);
		}else {
			data.setGradeInfo(list);
		}
		return data;
	}
	// 메인화면 강의평 로드하는 메서드
	public EvalResponseDTO evallist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		EvalResponseDTO data = new EvalResponseDTO();
		data.setSuccess(true);
		
		List<Subject_info2> list2 = dao.subject2();
		if(list2.isEmpty()) { // 학기에 수강과목으로 담은 과목이 없으면
			data.setMessage("작성된 강의평이 없어요");
			data.setSuccess(false);
		}else {
			data.setList2(list2);
		}
		return data;
	}
	
	public ActionForward gradeview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		// 평균평점
		if (checklogin(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			List<Grade_statistics> list = dao.grade_avg(login);
			request.setAttribute("list", list);
			System.out.println("!!!!!!!!!!!!!!!list : " + list);

			return new ActionForward();
		}

		// 검증에서 걸린게 있으면
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward selectgrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		if (checklogin(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			String semester = request.getParameter("semester");

			if (semester == null) {
				semester = dao.selectsemester(login);
				System.out.println("학기 : " + semester);
				if (semester == null) {
					semester = "1-1";
				}
				request.setAttribute("semester3", semester);
			}

			System.out.println("출력!!!!!!!!");

			List<GradeInfo> list = dao.subjectinfo(semester, login);
			// gradeInfo : mem_id, semester_code;subject;credit;grade;
			System.out.println("출력!!!:" + list);
			request.setAttribute("gradeInfo", list);
			// 학년/학기 별 이수학점, 평균 평점
			List<Grade_statistics> list2 = dao.gradestatistics2(login, semester);
			request.setAttribute("list2", list2);
			request.setAttribute("semester2", semester);
			System.out.println("semester2" + semester);
			return new ActionForward();
		}
		return new ActionForward(false, "../alert.jsp");

	}

	public ActionForward selectsubject(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, ServletException {
		if (checklogin(request, response)) {

			Member mem = (Member) request.getSession().getAttribute("mem");
			int school = mem.getMem_school();
			String dept = mem.getMem_dept();
			List<Subject_info> list = dao.selectSubject(school, dept);
			System.out.println("subject_info : " + list);
			request.getSession().setAttribute("subjectinfo", list);
			return new ActionForward();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward subjectinsert(HttpServletRequest request, HttpServletResponse response) {
		if (checklogin(request, response)) {
			String msg = null;
			String url = null;
			try {
				String semester_code = request.getParameter("semester");
				String[] arr = request.getParameter("subject").split(",");
				double grade = Double.parseDouble(request.getParameter("grade"));

				int subject_no = Integer.parseInt(arr[0]);
				int credit = Integer.parseInt(arr[1]);
				int school_num = Integer.parseInt(arr[2]);

				String login = (String) request.getSession().getAttribute("login");

				/*
				 * 과목 이미 들어가있으면 못하게 GradeInfo [mem_id=null, semester_code=1-1, subject=직류회로,
				 * credit=2, grade=4.5, subject_no=3],
				 */

				List<GradeInfo> list = dao.subjectinfo(semester_code, login);
				for (GradeInfo gradeInfo : list) {
					if ((gradeInfo.getSemester_code().equals(semester_code)) && (gradeInfo.getMem_id().equals(login))
							&& (gradeInfo.getSubject_no() == subject_no)) {
						msg = "이미 추가되어있는 과목입니다.";
						url = "grade_manage.do";
						request.setAttribute("msg", msg);
						request.setAttribute("url", url);
						return new ActionForward(false, "../alert.jsp");
					}

				}

				msg = "저장 실패";
				url = "grade_manage.do";
				if (dao.subjectin(subject_no, credit, login, grade, semester_code, school_num)) {
					msg = "저장 성공";
					url = "grade_manage.do";
				}
				// select_info : subject_no,
				// 저 테이블에 있는 subject_no랑 파라미터 subject_no 를
				// 비교해서 subject, credit 얻기

				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return new ActionForward(false, "../alert.jsp");

			} catch (Exception e) {

			}

		}
		return new ActionForward(false, "../alert.jsp");
	}

	// 차트
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// 선그래프
		String login = (String) request.getSession().getAttribute("login");
		List<Map<String, String>> list = dao.gradestatistics(login);
		request.setAttribute("list", list);
		System.out.println(list);
		return new ActionForward();

	}

	public ActionForward graph2(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// 원그래프
		String login = (String) request.getSession().getAttribute("login");
		List<Map<String, Integer>> list2 = dao.gradestatistics2(login);
		request.setAttribute("list2", list2);
		System.out.println(list2);
		return new ActionForward();

	}

	/*
	 * public ActionForward graph4(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException { int subject_no =
	 * Integer.parseInt(request.getParameter("subject_no")); // 원그래프
	 * List<Map<String, Integer>> list2 = dao.gradestatistics(subject_no);
	 * request.setAttribute("list2", list2);
	 * System.out.println("성적 통계데이터2 : "+list2); return new ActionForward(); }
	 */

	// 강의평 작성
	// 과목 코드, 아이디로 조회
	public ActionForward writeForm2(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			String semester = request.getParameter("semester");
			String login = (String) request.getSession().getAttribute("login");
			int subject_no = Integer.parseInt(request.getParameter("no"));

			// 강의평 이미 작성했는지 검증하는 쿼리문 - 학기 번호, 로그인, 번호
			boolean list2 = dao.selecteval(semester, login, subject_no);
			if (list2 == true) { // 이미 작성해서 조회해 온것이 있어서 true를 리턴함
				request.setAttribute("msg", "이미 강의평을 작성하셨습니다");
				request.setAttribute("url", "writeForm.do");
				return new ActionForward(false, "../alert.jsp");
			} else {
				// 강의평 추가 쿼리문
				List<Subject_info> list = dao.subjectinfo2(subject_no, login);
				request.setAttribute("list4", list);
				request.setAttribute("semester", semester);
				System.out.println(list);
				return new ActionForward();
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward writesubmit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		String login = (String) request.getSession().getAttribute("login");
		request.setCharacterEncoding("utf-8");
		int homework_info = Integer.parseInt(request.getParameter("homework_info"));
		int grade_info = Integer.parseInt(request.getParameter("grade_info"));
		int attendance_info = Integer.parseInt(request.getParameter("attendance_info"));
		double score = Double.parseDouble(request.getParameter("score"));
		String eval_text = URLDecoder.decode(request.getParameter("eval_text"), "EUC-KR");
		int subject_no = Integer.parseInt(request.getParameter("subject_no"));
		String semester = request.getParameter("semester");
		System.out.println("semester" + semester);
		Subject_info s = new Subject_info();
		s.setHomework_info(homework_info);
		s.setGrade_info(grade_info);
		s.setAttendance_info(attendance_info);
		s.setScore(score);
		s.setEval_text(eval_text);
		s.setSubject_no(subject_no);
		s.setSemester(semester);

		System.out.println("강의평 내용" + s);

		String msg = "";
		String url = "";
		int result = dao.subjectinsert(s, login);
		if (result > 0) {
			msg = "저장 성공";
			url = "writeForm.do";
		} else {
			msg = "저장 실패";
			url = "writeForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward subjectview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		if (checklogin(request, response)) {
			int subject_no = Integer.parseInt(request.getParameter("no"));
			List<Subject_info> list = dao.subjectView(subject_no);

			request.setAttribute("list", list);
			System.out.println("강의평 list : " + list);

			// 과제
			List<Map<String, Integer>> list3 = dao.subjectstatistics2(subject_no);
			request.setAttribute("list3", list3);
			System.out.println("과제 통계데이터2 : " + list3);

			// 성적
			List<Map<String, Integer>> list4 = dao.subjectstatistics3(subject_no);
			request.setAttribute("list4", list4);
			System.out.println("과목 통계데이터4 : " + list4);

			// 출결
			List<Map<String, Integer>> list5 = dao.subjectstatistics4(subject_no);
			request.setAttribute("list5", list5);
			System.out.println("과목 통계데이터5 : " + list5);

			// 총점
			List<String> list6 = dao.score(subject_no);
			double score = 0.0;
			try {
				score = Double.parseDouble(list6.get(0));
			} catch (NullPointerException e) {
				score = 0.0;
			}
			request.setAttribute("list6", score);

			System.out.println("과목 통계데이터6 : " + list6);

			return new ActionForward();

		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "member/picture";
		String fname = null; // appliction객체 : getServletContext
		try {
			File f = new File(path);
			if (!f.exists()) { // 경로에 파일이 존재하지 않으면
				f.mkdirs(); // picture폴더 생성
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture"); // pictureForm name속성picture파라미터
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

	public ActionForward gradedelete(HttpServletRequest request, HttpServletResponse response) {
		if (checklogin(request, response)) {
			String semester_code = request.getParameter("semester");
			int subject_no = Integer.parseInt(request.getParameter("subject_no"));
			String login = (String) request.getSession().getAttribute("login");

			List<GradeInfo> list = dao.subjectOne(semester_code, login, subject_no);
			String msg = null;
			if (list == null) {
				msg = "없는 게시글 입니다.";

			} else {
				if (dao.gradedelete(semester_code, login, subject_no)) {
					msg = "삭제성공";
				} else {
					msg = "삭제실패";
				}
			}
			request.setAttribute("msg", msg);
			return new ActionForward(false, "gradedelete.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward password(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");

		String msg = null;
		String url = null;

		boolean opener = false;
		boolean closer = false;

		if (login != null) { // 로그인 상태
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			String dbPass = mem.getMem_password();
			String pass = request.getParameter("beforepass"); // 현재비번
			String chgpass = request.getParameter("afterpass"); // 바꾼 비먼
			if (dbPass.equals(pass)) {
				if (dao.updatePw(login, chgpass) > 0) {
					msg = "비밀번호가 변경되었습니다.";
					url = "info.do";
					opener = true;
					closer = true;
				} else {
					msg = "비밀번호 오류입니다.";
					url = "passwordForm.do";
				}
			} else {
				msg = "비밀번호가 틀립니다.";
				url = "passwordForm.do";
			}

		} else {
			msg = " 로그인 하세요.";
			url = "loginForm.do";
			opener = true;
			closer = true;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "password.jsp");

	}

	public ActionForward scoreupdate(HttpServletRequest request, HttpServletResponse response) {

		String login = (String) request.getSession().getAttribute("login");
		int score = Integer.parseInt(request.getParameter("score2"));
		System.out.println(score);
		String msg = null;
		String url = null;
		if (dao.scoreupdate(login, score) > 0) {
			msg = "수정되었습니다.";
		} else {
			msg = "수정실패";
		}
		url = "gradeview.do";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * public ActionForward gradeupdate(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * String login = (String)request.getSession().getAttribute("login"); String
	 * semester_code = request.getParameter("semster"); int subject_no =
	 * Integer.parseInt(request.getParameter("subject_no"));
	 * 
	 * List<Subject_info3> list =dao.gradeupdate(login, subject_no, semester_code);
	 * request.setAttribute("list", list); System.out.println(list); return new
	 * ActionForward();
	 * 
	 * }
	 */
	// 아이디 중복체크 확인
	public ActionForward MemberIdCheckAction(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		boolean result = dao.duplicateIdCheck(id);

		// response.setContentType("text/html;charset=euc-kr");
		// PrintWriter out = response.getWriter();
		System.out.println(result);
		if (result) {
			// out.println("0"); // 아이디 중복
			request.setAttribute("result", 0);
		} else {
			// out.println("1");
			request.setAttribute("result", 1);
		}

		// out.close();
		return new ActionForward();
	}

	public ActionForward secession(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		String msg = null;

		if (dao.secession(login)) {
			msg = "탈퇴되셨습니다.";
		} else {
			msg = "탈퇴실패";
		}
		request.setAttribute("msg", msg);
		return new ActionForward(false, "secession.jsp");

	}

}