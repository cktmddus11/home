package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login; // 로그인 정보
	protected String id; // 파라미터 정보 
	// protected 상속 관계 접근 가능 
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null) { // || login.trim().equals("") 이거 지우니까 되넹..
			//System.out.println("실행");
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
			// MainAction 클래스 , 이 클래스에서 상속받아서 이 클래스 먼저 돌려서
			// 가기전에 여기서 걸려서 doExceute가 실행안됨
		}else { // 로그인 돼있으면 
			// 관리자가 아니고, id가 비어있지 않고 로그인 정보와 id가 다르면  
			if(!login.equals("admin") && id!= null && !login.equals(id)) {
				request.setAttribute("msg", "본인만 가능합니다.");
				request.setAttribute("url", "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		// 위에 조건이 다 아니면=> 로그인 상태이고, 일반 사용자가 본인의 정보를 보려고 하거나
		// id가 null일때 -> 파리미터가 없을 때 -> 그냥 main.jsp 접근
		// 관리자 이어야만 MainAction 클래스의 doExcute메서드 호출됨 
		return doExecute(request, response);
	}
	// Action 인터페이스의 구현 클래스인 추상 클래스의 추상 메서드 
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);

	

}
