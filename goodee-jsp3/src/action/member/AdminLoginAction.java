package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

/* 
 * 1. �α׾ƿ� ���� : �α����� �ʿ��մϴ�. �޼��� ���
							loginForm.jsp �������� �̵�
	2. �α��� ���� 
				�Ϲ� ����� : �����ڸ� ������ �ŷ��Դϴ�. �޽��� ���
										main.jsp �� ������ �̵�
				������ 
 * 
 * */
public abstract class AdminLoginAction implements Action {
	protected String login;
	protected String id;
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
			request.setAttribute("url",  "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
		}else { // �α��� ���� 
			if(!login.equals("admin")) {
				request.setAttribute("msg", "�����ڸ� ������ �ŷ��Դϴ�.");
				request.setAttribute("url",  "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		return adminExecute(request, response);
	}
	public abstract ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response);

}
