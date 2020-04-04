package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

public class ListAction extends AdminLoginAction{
	/* 
	 * 3. db에서 모든 회원정보를 조회하여 List<Member> 객체로 리턴
	List<Member> list = new MemberDao().lsit() 
	 * */
	@Override
	public ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		List<Member> list = dao.list();
		request.setAttribute("list", list);
		return new ActionForward();
	}




}
