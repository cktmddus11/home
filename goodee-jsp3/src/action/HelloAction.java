package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action{ 
	// Action �������̽��� 
	// excute �޼��带 �������̵� �ϰ� ���� 
	// HelloAvtion Ŭ������ Action Ŭ������ ���� Ŭ������ 

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "Hello World");
		return new ActionForward(false, "hello.jsp");
	
	}

}
