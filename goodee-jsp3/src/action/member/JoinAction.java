package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.Member;
import model1.MemberDao;

/* 
 * 파라미터 정보를 Member 객체에 저장
 * - Member 객체를 db에 추가하기
 * 		- 성공 : 회원가입 완료 메시지 출력.LoginForm.me 페이지 이동
 * 		- 실패 : 실패메시지 출력, JoinForm.me 페이지 이동
 * 
 * */

public class JoinAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		MemberDao dao = new MemberDao();
		int result = dao.insert(mem);
		String msg = null;
		String url = null;
		if(result > 0) {
			msg = mem.getId()+"님 회원가입되셨습니다.";
			url = "loginForm.me";
		}else {
			msg = "회원가입에 실패하셨습니다.";
			url = "JoinForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
