package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.Member;
import model1.MemberDao;
/*
1. id, pass �Ķ���� ����
2. id�� �ش��ϴ� ������ db���� ��ȸ
			- �����ϸ� ��й�ȣ Ȯ��
			- �������� ������ id���� �޽��� ����ϰ� LoginForm.me �������� �̵�
3. id �����ϸ� ��й�ȣ ���� 
			- ��й�ȣ�� �´� ��� : session �α��� ���� ����
							�α��� ���� �޽��� ���, main.me �������� �̵� 
			- ��й�ȣ�� Ʋ�� ��� : �α��� ���� �޽��� ���, loginForm.me ��������  �̵�

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
		
		if(mem == null) { // id���� x
			msg = "���̵� �����ϴ�.";
			url = "LoginForm.jsp";
		}else { // id���� - ��й�ȣ ����
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				url = "main.me";
				msg = mem.getId()+"�� �α��εǼ̽��ϴ�.";
			}else {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				url = "loginForm.me";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}

}
