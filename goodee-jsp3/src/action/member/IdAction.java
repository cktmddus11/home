package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.MemberDao;

public class IdAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String id = dao.selectID(email, tel);
		
		String msg = null;
		String url = null;
		if(id == null) { // id찾기 실패
			msg = "정보에 맞는 id가 없습니다.";
			url = "idForm.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			id = id.substring(0, id.length()-2);
			System.out.println(id);
			request.setAttribute("id", id);
			return new ActionForward();
		}
		
	}

}
