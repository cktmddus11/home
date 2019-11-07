package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

public class InfoAction extends UserLoginAction{
/* 
 *  1. id 파라미터 값을 조회 
		2. 로그인 상태 검증. 
			로그아웃 상태 : '로그인이 필요합니다. ' 메세지 출력. loginForm.jsp 이동
		3. 로그인 상태
			id 의 값과 login값이 다른 경우, 또는 admin이 아닌경우
				'내정보만 조회가능합니다.' 메시지 출력. main.jsp 이동
============위의 내용 상속된 UserLoginAction 에서 이미 검증하고 아래 메서드를 실행하게 됨
	 	4. db에서 id값에 해당하는 데이터 조회. 
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
