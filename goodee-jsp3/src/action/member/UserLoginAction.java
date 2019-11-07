package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login; // �α��� ����
	protected String id; // �Ķ���� ���� 
	// protected ��� ���� ���� ���� 
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null) { // || login.trim().equals("") �̰� ����ϱ� �ǳ�..
			//System.out.println("����");
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
			// MainAction Ŭ���� , �� Ŭ�������� ��ӹ޾Ƽ� �� Ŭ���� ���� ������
			// �������� ���⼭ �ɷ��� doExceute�� ����ȵ�
		}else { // �α��� �������� 
			// �����ڰ� �ƴϰ�, id�� ������� �ʰ� �α��� ������ id�� �ٸ���  
			if(!login.equals("admin") && id!= null && !login.equals(id)) {
				request.setAttribute("msg", "���θ� �����մϴ�.");
				request.setAttribute("url", "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		// ���� ������ �� �ƴϸ�=> �α��� �����̰�, �Ϲ� ����ڰ� ������ ������ ������ �ϰų�
		// id�� null�϶� -> �ĸ����Ͱ� ���� �� -> �׳� main.jsp ����
		// ������ �̾�߸� MainAction Ŭ������ doExcute�޼��� ȣ��� 
		return doExecute(request, response);
	}
	// Action �������̽��� ���� Ŭ������ �߻� Ŭ������ �߻� �޼��� 
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);

	

}
