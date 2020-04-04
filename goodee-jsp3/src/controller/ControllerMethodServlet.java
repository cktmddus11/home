package controller;

import java.io.FileInputStream;
import java.io.IOException;
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

import action.ActionForward;
import action.board.BoardAllAction;
 //  �������� ��ü�� ���� ��� ����? ��� �޼����?
@WebServlet(urlPatterns= {"*.do"}, initParams = {@WebInitParam(name="properties", value="method.properties")})

public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	private Properties pr = new Properties(); // Hashtable�� ����Ŭ����?
	private BoardAllAction action = new BoardAllAction();
	
	private Class[] paramType = new Class[]
			{HttpServletRequest.class, HttpServletResponse.class};
	// was�� init ��üȭ�� ���ڸ��� ȣ��Ǵ� �޼���
	// init : ������ ��üȭ �� ���� �ٷ� �ѹ��� ȣ��Ǵ� �޼���
	// static�����ϱ� ��üȭ�ʿ�
	// config ��ü : �Ķ���� ���� 
	// 				properties = method.properties
	
	// ������ ������ �о pr�� ���� �������� 
	@Override
	public void init(ServletConfig config) throws ServletException{
		// props : method.properties 
		String props = config.getInitParameter("properties");
		FileInputStream f = null;
		try {
			// f : WE-INF/method.properties ���� �б� ���� �Է� ��Ʈ��
			f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
			pr.load(f); // ������ ������ Ű�� �� ������ ���� �ε��ϰ� ��
			// key = /model2/hello.do
			// value = hello 
			f.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	// Ŭ���̾�Ʈ GET ��û�� ȣ��Ǵ� �޼��� 
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
			// ������Ʈ�� ������ ��û url :    command =  /model2/hello.do 
			command = request.getRequestURI().substring(request.getContextPath().length()); 
			// methodName = hello 
			String methodName = pr.getProperty(command); 
			System.out.println(command + "," + methodName);
			// method : �޼��� ��ü ����
			// BoardAllAction Ŭ������ �޼����� �̸��� methodName�̰�
			// �ް������� paramType �� �޼��带 ��ü�� ���� 
			/* �������� ������ ���⼭ ���?*/
			Method method = BoardAllAction.class.getMethod(methodName, paramType);
			//  invoke : �޼��� ȣ�� ���
			// action = borderAction?     paramObjs : request, response ��ü 
			//                                         action.hello(request, response)
			// ���ϰ� ActionForwardŬ���� Ÿ��    Action Ŭ������ ����ȯ?
			forward = (ActionForward) method.invoke(action, paramObjs);
		}catch(NullPointerException e) {
			forward = new ActionForward();
			//e.printStackTrace();
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
		}else response.sendRedirect("nopage.jsp");
		
	}
	// Ŭ���̾�Ʈ POST ��� ��û�� ȣ��Ǵ� �޼��� 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // post��û�͵� get���� ȣ���
	}

}
