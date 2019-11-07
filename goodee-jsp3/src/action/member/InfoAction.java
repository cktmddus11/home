package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

public class InfoAction extends UserLoginAction{
/* 
 *  1. id �Ķ���� ���� ��ȸ 
		2. �α��� ���� ����. 
			�α׾ƿ� ���� : '�α����� �ʿ��մϴ�. ' �޼��� ���. loginForm.jsp �̵�
		3. �α��� ����
			id �� ���� login���� �ٸ� ���, �Ǵ� admin�� �ƴѰ��
				'�������� ��ȸ�����մϴ�.' �޽��� ���. main.jsp �̵�
============���� ���� ��ӵ� UserLoginAction ���� �̹� �����ϰ� �Ʒ� �޼��带 �����ϰ� ��
	 	4. db���� id���� �ش��ϴ� ������ ��ȸ. 
 * 
 * */
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		System.out.println(id);
		Member info = dao.selectOne(id);
		request.setAttribute("info", info);
		return new ActionForward();
	}

}
