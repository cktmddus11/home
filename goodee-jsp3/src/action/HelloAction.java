package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action{ 
	// Action 인터페이스의 
	// excute 메서드를 오버라이딩 하고 있음 
	// HelloAvtion 클래스는 Action 클래스이 구현 클래스임 

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "Hello World");
		return new ActionForward(false, "hello.jsp");
	
	}

}
