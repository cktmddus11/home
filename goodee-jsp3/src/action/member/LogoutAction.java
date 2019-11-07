package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

public class LogoutAction extends UserLoginAction{
// UserLoginActin 에서 로그인 되있는지 다 확인하고 들어옴
// 위 클래스에 login 세션 정보 값 상속되니까 걍 쓰면됨	
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = login+"님이 로그아웃되셨습니다.";
		String url = "loginForm.me";
		request.getSession().invalidate();
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
