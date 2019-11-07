package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.Member;
import model1.MemberDao;
/* 
 *     1. �α׾ƿ������� ���. �α��� �ϼ���. �޽��� ��� 
    	�ٸ� ������� ��й�ȣ ���� �Ұ�
    	Opner �������� loginForm.jsp ������ �̵�. 
    	���� ������ �ݱ� -> opener ����� �ִ� ������ ��ü.location? 
    2. pass, chgpass �Ķ���Ͱ� ���� 
    3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ���� 
    	��й�ȣ ���� �޽��� ���. passwordForm.jsp ������ �̵�
    4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������ 
    	��й�ȣ ����. opner �������� info.jsp ������ �̵�
    	���� ������ �ݱ� 
 * 
 * */ // �ٸ� �����ʷ� ������ �׷��� �ؼ� ��� �ȵ�
public class PasswordAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String)request.getSession().getAttribute("login");

		String msg = null;
		String url = null;
		
		boolean opener = false;
		boolean closer = false;
		
		if(login != null) { // �α��� ����
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			String dbPass = mem.getPass();
			String pass = request.getParameter("beforepass"); // ������
			String chgpass = request.getParameter("afterpass"); // �ٲ� ���
			if(dbPass.equals(pass)) {
				if(dao.updatePw(login,  chgpass) >0) {
					msg = "��й�ȣ�� ����Ǿ����ϴ�.";
					url = "info.me?id="+login; 
					opener = true;
					closer = true;
				}else {
					msg = "��й�ȣ �����Դϴ�.";
					url = "passwordForm.me";
				}
			}else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
				url = "passwordForm.me";
			}
			
		}else {
			msg = "�α��� �ϼ���.";
			url = "loginForm.me";
			opener = true;
			closer = true;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}

}
