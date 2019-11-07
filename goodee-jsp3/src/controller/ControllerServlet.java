package controller;

import java.io.FileInputStream;
/* 
 * 1. 브라우저로 부터 요청이 들어오면 어떤 요청인지 분석하여 이 요청을 처리하기 
 * 위한 모델을 사용하여 처리한다.(Servlet) 
 * 2. 사용한 모델로부터 처리 결과를 받으면 추가로 처리하거나 가공해야할 정보가 
 * 있다면 처리 후 request 객체나 session 객체에 저장하고, 
 * 3. 뷰(jsp 페이지를 선택하여)
 * forward나 redirect하여 클라이언트에 출력한다. 
 * 
 * 컨트롤러 : 웹 브라우저의 요청과 해당내용에 자바로 처리하는 자바 프로그램으로
 * 된 웹처리 클래스
 * 1. 클라이언트가 url를 통해 요청을 하면 servlet에서 요청 내용으로 doGet(),
 * doPost() 메서드를 통해서 받는다.
 * 2. 요청내용을 조건을 통해서 분석하여 view 단에 넘겨질 모델 객체를 만드는 요청을
 * 한다.
 * 3. service단에서 넘겨온 핵심 Model 객체 내용을 jsp(view)로 전달한다.
 * 요청 내용을 처리한다. 
 * 
 * 
 * */
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
// Controller에 xxx.me 라는 명령어 입력
@WebServlet(urlPatterns= {"*.me"},
				initParams = {@WebInitParam(name="properties", value="action.properties")})

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();
    public ControllerServlet() {
        super();
    }
    @Override
    // init메서드 : 서블릿이 초기화할 때 반드시 호출 딱한번만 호출
    public void init(ServletConfig config) throws ServletException{
    	String props = config.getInitParameter("properties"); // 위에서 설정한 프로퍼티이름의 값인 action.properties읽어옴
    	Properties pr = new Properties();
    	FileInputStream f= null;
    	try {
    		// 프로퍼티 파일 로드
    		f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		pr.load(f);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}finally {
    		try {
    			if(f!=null) f.close();
    		}catch(IOException e) {}
    	}
    	// 프로퍼티의 Map에 
    	for(Object k : pr.keySet()) { // 키을 가져와서
    		// model2/hollo.me = action.HelloAction
    		String command = (String) k;///model2/hello.me
    		String className = pr.getProperty(command);// action.HelloAction
    		// 키로 키의 값을 가져옴
    		try {
    			Class commandClass = Class.forName(className);
    			// 키의 값으로 요청 클래스를 만들고
    			// commandObj : action.HelloAction 객체생성
    			Object commandObj = commandClass.newInstance(); // 직접객체생성?
    			commandMap.put(command, (Action)commandObj);
    			// Map 객체에 프로퍼티 키와 요청클래스를 키값으로 put함 
    			// Action인터페이스로 형변환 -> 부모 클래스로 형변환 
    		}catch(Exception e) {
    			throw new ServletException(e);
    		}
    	}
    	
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		
		try {
			// command : /model2/hello.me 키값 
			command = request.getRequestURI().substring(request.getContextPath().length());
			// action: Action 인터페이스 구현 객체
			//  						action.HelloAction
			System.out.println(command);
			action = commandMap.get(command);
			// AddAction 리턴값여기로 들어옴
			forward = action.excute(request, response);
		}catch(NullPointerException e) {
			forward = new ActionForward(); // 위에서 forward 리턴값이 null이어도 
			// 예외 처리를 해줘서 null이 아니게 함
		}catch(Exception e) {
			throw new ServletException(e);
		}
		// return new ActionForward(false, "../alert.jsp")
		if(forward != null) {
			if(forward.isRedirect()) { // isRedirect가 true면 
				response.sendRedirect(forward.getView()); 
				// redirect로 설정한 view(jsp)파일로 이동
			}else { // isRedirect false -> forward
 				// isRedirect  = false면 
				if(forward.getView() == null) { // view 경로 없으면 
					// 키로 설정한 command에서 .me를 .jsp로 알아서 url지정해줌
					forward.setView(command.replace(".me",  ".jsp"));
					//System.out.println("실행");// - id찾았을때 id.me 를
					// id.jsp로 해서 view페이지 보여줌
				}
				// forward.getView() : action 클래스에서 전달 view이름 
				// forward 대상지정
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
				// request 같이 전달해서 파라미터도 같이 전달
				//System.out.println("실행2"); //- id못찾았을 때 지정되있는 ../alert.jsp로 이동
			}
		}else {
			response.sendRedirect("nopage.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	
	
	
	

}
