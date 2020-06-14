package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import action.ActionForward;
import action.member.MemberAllAction;

@WebServlet(urlPatterns= {"*.do"}, initParams = {@WebInitParam(name="properties", value="method.properties")})

public class ControllerMethodServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	private Properties pr = new Properties(); // Hashtable의 하위클래스?
	private MemberAllAction action = new MemberAllAction();
	
	private Class[] paramType = new Class[]
			{HttpServletRequest.class, HttpServletResponse.class};
	// was가 init 객체화가 되자마자 호출되는 메서드
	// init : 서블릿이 객체화 된 이후 바로 한번만 호출되는 메서드
	// static없으니까 객체화필요
	// config 객체 : 파라미터 전달 
	// 				properties = method.properties
	
	// 파일의 내용을 읽어서 pr에 값만 전달해줌 
	@Override
	public void init(ServletConfig config) throws ServletException{
		// props : method.properties 
		String props = config.getInitParameter("properties");
		FileInputStream f = null;
		try {
			// f : WE-INF/method.properties 파일 읽기 위한 입력 스트림
			f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
			pr.load(f); // 파일의 내용을 키와 값 쌍으로 값을 로드하게 됨
			// key = /model2/hello.do
			// value = hello 
			f.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	// 클라이언트 GET 요청시 호출되는 메서드 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr"); 
		Object[] paramObjs = new Object[] {request, response};
		ActionForward forward = null;
		String command = null;
		try {
			//System.out.println(request.getRequestURI());
			//System.out.println(request.getContextPath());
			//   /jspstudy2 /model2/hello.do
			//   /jspstudy2
			// 프로젝트를 제외한 요청 url :    command =  /model2/hello.do 
			command = request.getRequestURI().substring(request.getContextPath().length()); 
			// methodName = hello 
			String methodName = pr.getProperty(command); 
			System.out.println(command + "," + methodName);
			// method : 메서드 객체 생성
			// BoardAllAction 클래스중 메서드의 이름이 methodName이고
			// 메개변수가 paramType 인 메서드를 객체로 리턴 
			/* 널포인터 에러가 여기서 뜬다?*/
			Method method = MemberAllAction.class.getMethod(methodName, paramType);
			//  invoke : 메서드 호출 기능
			// action = borderAction?     paramObjs : request, response 객체 
			//                                         action.hello(request, response)
			// 리턴값 ActionForward클래스 타입    Action 클래스를 형변환?
			forward = (ActionForward) method.invoke(action, paramObjs);
		}catch(NullPointerException e) {
			forward = new ActionForward();
			//e.printStackTrace();
		}catch(ClassCastException e) { // MemberAllAction 클래스의 메서드에서
			// 리턴값이 ActionForward가 아니라 다른 클래스타입이면 클래스 형변환이
			// 불가능하기 때문에 forward를 null처리
			// => ajax 리턴값 처리를 위해서
			forward = null;
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".do", ".jsp"));
				}
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request,  response);
			} 
		}
		else { // ajax callback함수
			// 결과 값을 위해 object를 json 형식으로 전달하도록
			String jsonResult = null;
			String methodName = pr.getProperty(command); 
			try {
				Method method = MemberAllAction.class.getMethod(methodName, paramType);
				Object result = method.invoke(action, paramObjs);

				jsonResult = new Gson().toJson(result);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			response.setContentType("application/json;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print(jsonResult);
			out.flush();
		}//else response.sendRedirect("nopage.jsp");
		
	}
	// 클라이언트 POST 방식 요청시 호출되는 메서드 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // post요청와도 get으로 호출됨
	}
}
