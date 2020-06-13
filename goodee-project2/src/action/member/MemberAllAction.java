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

		if (login == null || login.trim().equals("")) { // �α��� �ȵ�������
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "../member/loginForm.do");
			return false;
			// MainAction �� �� Ŭ���� ��ӹ޾Ƽ� ��Ŭ������ ���� �����
			// �������� ���⼭ �ɷ��� doExecute�� ���� �ȵ�?
		} else { // �α��� ��������
			if (!login.equals("admin") && id != null && !login.equals(id)) { // �α��������� admin�� �ƴϸ鼭 �α��������� �Ķ���� ������ ��ġ����
																				// ������
				request.setAttribute("msg", "���θ� �����մϴ�.");
				request.setAttribute("url", "main/main.me");
				return false;
			}
		}
		// ���� ���ǹ� �� �ƴϸ� �α��λ��¿��߸� MainAction Ŭ������ doExecute�޼���ȣ���
		return true;
	}

	private MemberDao dao = new MemberDao();

	public ActionForward login(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String id = request.getParameter("id");
		String pass = request.getParameter("password");

		String msg = "�ش��ϴ� id�� �������� �ʽ��ϴ�. ";
		String url = "loginForm.do";

		Member mem = new MemberDao().selectOne(id);
		if (mem != null) { // id�� �����ϸ�
			if (pass.equals(mem.getMem_password())) { // �Է��� ��й�ȣ�� db��й�ȣ��������
				request.getSession().setAttribute("login", id); // session�� �ڹ��� ���尴ü�� �ƴϰ� jsp�� ���尴ü?
				msg = mem.getMem_name() + "���� �α����ϼ̽��ϴ�.";
				url = "../main/main.do";
			} else {// �Է��� ��й�ȣ�� db��й�ȣ�� �ٸ���
				msg = "��й�ȣ�� Ʋ���ϴ�.";
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
		System.out.println("�б� :" + school_num);
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

		String msg = "ȸ������ ����";
		String url = "loginForm.do";
		System.out.println("��� : " + mem);

		if (dao.insert(mem) > 0) {
			msg = mem.getMem_id() + "ȸ������ ����";
			url = "loginForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			String msg = (String) request.getSession().getAttribute("login") + "���� �α׾ƿ��Ǽ̽��ϴ�.";
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
		if (checklogin(request, response)) { // main���� �� �α��� ����
			// decorator2.jsp�� �޴��ٿ� ����� ���� ��Ÿ���� ����
			String login = (String) request.getSession().getAttribute("login");
			Member mem = new MemberDao().selectOne(login);
			request.getSession().setAttribute("mem", mem);
			
			return new ActionForward(); // �������� �ƹ��͵� �ɸ��� ������ true
		}
		// �������� �ɸ��� ������
		return new ActionForward(false, "../alert.jsp");
	}

	// ����ȭ�� �Խ��� �ε��ϴ� �޼���
	public BoardResponseDTO boardlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		BoardResponseDTO data = new BoardResponseDTO();
		data.setSuccess(true);
		// �����Խ���
		List<Board> list3 = dao.boardselect();
		if(list3.isEmpty()) {
			data.setSuccess(false);
			data.setMessage("���� �ۼ��� �Խñ��� �����");
		}else {
			data.setList3(list3);
		}
		return data;
	}
	// ����ȭ�� ���񸮽�Ʈ �ε��ϴ� �޼���
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
		if(list.isEmpty()) { // �б⿡ ������������ ���� ������ ������
			data.setMessage("������������ ���� ������ �����");
			data.setSuccess(false);
		}else {
			data.setGradeInfo(list);
		}
		return data;
	}
	// ����ȭ�� ������ �ε��ϴ� �޼���
	public EvalResponseDTO evallist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		EvalResponseDTO data = new EvalResponseDTO();
		data.setSuccess(true);
		
		List<Subject_info2> list2 = dao.subject2();
		if(list2.isEmpty()) { // �б⿡ ������������ ���� ������ ������
			data.setMessage("�ۼ��� �������� �����");
			data.setSuccess(false);
		}else {
			data.setList2(list2);
		}
		return data;
	}
	
	public ActionForward gradeview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		// �������
		if (checklogin(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			List<Grade_statistics> list = dao.grade_avg(login);
			request.setAttribute("list", list);
			System.out.println("!!!!!!!!!!!!!!!list : " + list);

			return new ActionForward();
		}

		// �������� �ɸ��� ������
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward selectgrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, UnsupportedEncodingException {
		if (checklogin(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			String semester = request.getParameter("semester");

			if (semester == null) {
				semester = dao.selectsemester(login);
				System.out.println("�б� : " + semester);
				if (semester == null) {
					semester = "1-1";
				}
				request.setAttribute("semester3", semester);
			}

			System.out.println("���!!!!!!!!");

			List<GradeInfo> list = dao.subjectinfo(semester, login);
			// gradeInfo : mem_id, semester_code;subject;credit;grade;
			System.out.println("���!!!:" + list);
			request.setAttribute("gradeInfo", list);
			// �г�/�б� �� �̼�����, ��� ����
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
				 * ���� �̹� �������� ���ϰ� GradeInfo [mem_id=null, semester_code=1-1, subject=����ȸ��,
				 * credit=2, grade=4.5, subject_no=3],
				 */

				List<GradeInfo> list = dao.subjectinfo(semester_code, login);
				for (GradeInfo gradeInfo : list) {
					if ((gradeInfo.getSemester_code().equals(semester_code)) && (gradeInfo.getMem_id().equals(login))
							&& (gradeInfo.getSubject_no() == subject_no)) {
						msg = "�̹� �߰��Ǿ��ִ� �����Դϴ�.";
						url = "grade_manage.do";
						request.setAttribute("msg", msg);
						request.setAttribute("url", url);
						return new ActionForward(false, "../alert.jsp");
					}

				}

				msg = "���� ����";
				url = "grade_manage.do";
				if (dao.subjectin(subject_no, credit, login, grade, semester_code, school_num)) {
					msg = "���� ����";
					url = "grade_manage.do";
				}
				// select_info : subject_no,
				// �� ���̺� �ִ� subject_no�� �Ķ���� subject_no ��
				// ���ؼ� subject, credit ���

				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return new ActionForward(false, "../alert.jsp");

			} catch (Exception e) {

			}

		}
		return new ActionForward(false, "../alert.jsp");
	}

	// ��Ʈ
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// ���׷���
		String login = (String) request.getSession().getAttribute("login");
		List<Map<String, String>> list = dao.gradestatistics(login);
		request.setAttribute("list", list);
		System.out.println(list);
		return new ActionForward();

	}

	public ActionForward graph2(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// ���׷���
		String login = (String) request.getSession().getAttribute("login");
		List<Map<String, Integer>> list2 = dao.gradestatistics2(login);
		request.setAttribute("list2", list2);
		System.out.println(list2);
		return new ActionForward();

	}

	/*
	 * public ActionForward graph4(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException { int subject_no =
	 * Integer.parseInt(request.getParameter("subject_no")); // ���׷���
	 * List<Map<String, Integer>> list2 = dao.gradestatistics(subject_no);
	 * request.setAttribute("list2", list2);
	 * System.out.println("���� ��赥����2 : "+list2); return new ActionForward(); }
	 */

	// ������ �ۼ�
	// ���� �ڵ�, ���̵�� ��ȸ
	public ActionForward writeForm2(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			String semester = request.getParameter("semester");
			String login = (String) request.getSession().getAttribute("login");
			int subject_no = Integer.parseInt(request.getParameter("no"));

			// ������ �̹� �ۼ��ߴ��� �����ϴ� ������ - �б� ��ȣ, �α���, ��ȣ
			boolean list2 = dao.selecteval(semester, login, subject_no);
			if (list2 == true) { // �̹� �ۼ��ؼ� ��ȸ�� �°��� �־ true�� ������
				request.setAttribute("msg", "�̹� �������� �ۼ��ϼ̽��ϴ�");
				request.setAttribute("url", "writeForm.do");
				return new ActionForward(false, "../alert.jsp");
			} else {
				// ������ �߰� ������
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

		System.out.println("������ ����" + s);

		String msg = "";
		String url = "";
		int result = dao.subjectinsert(s, login);
		if (result > 0) {
			msg = "���� ����";
			url = "writeForm.do";
		} else {
			msg = "���� ����";
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
			System.out.println("������ list : " + list);

			// ����
			List<Map<String, Integer>> list3 = dao.subjectstatistics2(subject_no);
			request.setAttribute("list3", list3);
			System.out.println("���� ��赥����2 : " + list3);

			// ����
			List<Map<String, Integer>> list4 = dao.subjectstatistics3(subject_no);
			request.setAttribute("list4", list4);
			System.out.println("���� ��赥����4 : " + list4);

			// ���
			List<Map<String, Integer>> list5 = dao.subjectstatistics4(subject_no);
			request.setAttribute("list5", list5);
			System.out.println("���� ��赥����5 : " + list5);

			// ����
			List<String> list6 = dao.score(subject_no);
			double score = 0.0;
			try {
				score = Double.parseDouble(list6.get(0));
			} catch (NullPointerException e) {
				score = 0.0;
			}
			request.setAttribute("list6", score);

			System.out.println("���� ��赥����6 : " + list6);

			return new ActionForward();

		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "member/picture";
		String fname = null; // appliction��ü : getServletContext
		try {
			File f = new File(path);
			if (!f.exists()) { // ��ο� ������ �������� ������
				f.mkdirs(); // picture���� ����
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture"); // pictureForm name�Ӽ�picture�Ķ����
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
				msg = "���� �Խñ� �Դϴ�.";

			} else {
				if (dao.gradedelete(semester_code, login, subject_no)) {
					msg = "��������";
				} else {
					msg = "��������";
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

		if (login != null) { // �α��� ����
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			String dbPass = mem.getMem_password();
			String pass = request.getParameter("beforepass"); // ������
			String chgpass = request.getParameter("afterpass"); // �ٲ� ���
			if (dbPass.equals(pass)) {
				if (dao.updatePw(login, chgpass) > 0) {
					msg = "��й�ȣ�� ����Ǿ����ϴ�.";
					url = "info.do";
					opener = true;
					closer = true;
				} else {
					msg = "��й�ȣ �����Դϴ�.";
					url = "passwordForm.do";
				}
			} else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
				url = "passwordForm.do";
			}

		} else {
			msg = " �α��� �ϼ���.";
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
			msg = "�����Ǿ����ϴ�.";
		} else {
			msg = "��������";
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
	// ���̵� �ߺ�üũ Ȯ��
	public ActionForward MemberIdCheckAction(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		boolean result = dao.duplicateIdCheck(id);

		// response.setContentType("text/html;charset=euc-kr");
		// PrintWriter out = response.getWriter();
		System.out.println(result);
		if (result) {
			// out.println("0"); // ���̵� �ߺ�
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
			msg = "Ż��Ǽ̽��ϴ�.";
		} else {
			msg = "Ż�����";
		}
		request.setAttribute("msg", msg);
		return new ActionForward(false, "secession.jsp");

	}

}