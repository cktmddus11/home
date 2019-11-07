package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

/* 
 *   1. �α׾ƿ� ���� : �α����ϼ��� �޽��� ���, loginForm.jsp ������ �̵�-- ��ӹ����� �˾Ƽ� �ذ�
  2. 	�α��� ���� 
  		- �����ڰ� �ƴϰ�, id�� login �� �ٸ� ��� 
  				"���θ� Ż�� �����մϴ�." �޽��� ���. main.jsp �������� �̵� -- ��ӹ����� �˾Ƽ� �ذ�
 * 
  ----------------------------------------------------------				
  		- id�� �������� ���� 
  				"�����ڴ� Ż�� �Ұ����մϴ�." �޽��� ���. list.jsp �������� �̵� 
  				
  		- �Ϲ� �����
  		(1) ���̵�, ��й�ȣ ������ �Ķ���ͷ� ����
  		
  		(2)  ��й�ȣ ����ġ => �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ����
  			  		"��й�ȣ�� Ʋ���ϴ�. �޼��� ���. deleteForm.jsp ������ �̵�
  		- ������ 
  		(1) ���̵� ������ �Ķ���ͷ� ����
  3. ������ �α���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db ���� ȸ������ �����ϱ�
  		�������� : �Ϲݻ���� : �α׾ƿ� ��, Ż��޽��� ���. loginForm.jsp�� ������ �̵�
  						������ : Ż��޽��� ���. list.jsp
  		���� ���� : �Ϲݻ���� : �������� �޽��� ���. info.jsp ������ �̵�. 
  						������ : ���� ���� �޼��� ���. list.jsp ������ �̵�
 * 
 * */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String pass = request.getParameter("pass");
		String url = null;
		String msg = null;

		if (id.equals("admin")) {
			msg = "�����ڴ� Ż���� �� �����ϴ�.";
			url = "list.jsp";
		} else {
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(id);
			if (login.equals("admin") || pass.equals(mem.getPass())) {
				// �̰� ���� �߿� �տ��� ������ �ڿ��� ������ ����
				// �������� ��� ��й�ȣ������ �տ������� nullpointerexception�� �߻��ϴϱ�
				// admin ���� ����
				if (dao.delete(id) > 0) { // ���� ����
					if (login.equals("admin")) { // �������� ���
						msg = id + "����ڸ� ���� Ż�� ����";
						url = "list.me";
					} else { // �Ϲݻ������ ���
						msg = id + "���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
						url = "loginForm.me";
						request.getSession().invalidate();
					}
				} else { // ���� ����
					msg = id + "���� Ż���� �����߻�.";
					if (login.equals("admin")) { // �������� ���
						url = "list.me";
					} else {
						url = "info.me?id=" + id;
					}
				}
			}else{ // �����ڰ� �ƴϸ鼭 ��й�ȣ�� Ʋ������
				  msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
				  url = "deleteForm.me?id="+id;
			}	  
		}
		 request.setAttribute("msg", msg);
		 request.setAttribute("url", url);
		 return new ActionForward(false, "../alert.jsp");
	}

}
