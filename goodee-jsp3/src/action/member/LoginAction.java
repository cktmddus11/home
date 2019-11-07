package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.Member;
import model1.MemberDao;
/*
1. id, pass 파라미터 저장
2. id에 해당하는 정보를 db에서 조회
			- 존재하면 비밀번호 확인
			- 존재하지 않으면 id없음 메시지 출력하고 LoginForm.me 페이지로 이동
3. id 존재하면 비밀번호 검증 
			- 비밀번호가 맞는 경우 : session 로그인 정보 저장
							로그인 성공 메시지 출력, main.me 페이지로 이동 
			- 비밀번호가 틀린 경우 : 로그인 실패 메시지 출력, loginForm.me 페이지로  이동

*/
public class LoginAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		
		String msg = null;
		String url = null;
		
		if(mem == null) { // id존재 x
			msg = "아이디가 없습니다.";
			url = "LoginForm.jsp";
		}else { // id존재 - 비밀번호 검증
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				url = "main.me";
				msg = mem.getId()+"님 로그인되셨습니다.";
			}else {
				msg = "비밀번호가 틀렸습니다.";
				url = "loginForm.me";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}

}
