package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			request.setAttribute("result", num1 + num2);
		}catch(NumberFormatException e){ // num1 num2 값이 숫자가 아니면 
			// 에러 처리
			request.setAttribute("result", 0);
		}
		return new ActionForward(false, "addForm.jsp");
	}



}
