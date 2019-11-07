package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

/* 
 *     1. ��� �Ķ���� Member ��ü�� ����
  2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ������
  	"��й�ȣ�� Ʋ�Ƚ��ϴ�". �޽��� ��� ��, updateForm.me�������� �̵�
  3.  1���� ������ db�� �����ϱ�
  		int MemberDao.update(Member) 
  		����� 0���� ũ�� �������� �޽��� ���. info.me ������ �̵� 
  					0 ���ϸ� ���� ���� �޽��� ���. main.me ������ �̵�
 * */
public class UpdateAction extends UserLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(id);
		String dbPass = m.getPass();
		String msg = null;
		String url = null;
		
		if(dbPass.equals(request.getParameter("pass"))) {
			if(dao.update(mem)>0) {
				msg = "��������";
				url = "info.me?id="+id;
			}else {
				msg = "��������";
				url = "main.me";
			}
		}else {
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "updateForm.me?id="+id; // admin�ε� �ٸ���� ���� �����ؾ��ϴϱ� id�� 
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}

}
