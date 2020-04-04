package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class MainAction extends UserLoginAction {
	// UserLoginAction 추상 클래스 구현 클래스 
	// 추상 메서드 오버라이딩 
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		return new ActionForward();
	}


}
