package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.Member;
import model1.MemberDao;

/* 
 * �Ķ���� ������ Member ��ü�� ����
 * - Member ��ü�� db�� �߰��ϱ�
 * 		- ���� : ȸ������ �Ϸ� �޽��� ���.LoginForm.me ������ �̵�
 * 		- ���� : ���и޽��� ���, JoinForm.me ������ �̵�
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
			msg = mem.getId()+"�� ȸ�����ԵǼ̽��ϴ�.";
			url = "loginForm.me";
		}else {
			msg = "ȸ�����Կ� �����ϼ̽��ϴ�.";
			url = "JoinForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
