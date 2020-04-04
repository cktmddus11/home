package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.MemberDao;

public class PwAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String pw = dao.selectPW(email, tel, id);
		
		String msg =null;
		String url = null;
		
		if(pw == null) {
			msg = "정보에 맞는 pw가 없습니다.";
			url = "pwForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			pw = pw.substring(pw.length()-2);
			request.setAttribute("pw", pw);
			return new ActionForward();
		}
		
	}

}
