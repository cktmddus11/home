package controller;

import java.io.FileInputStream;
/* 
 * 1. �������� ���� ��û�� ������ � ��û���� �м��Ͽ� �� ��û�� ó���ϱ� 
 * ���� ���� ����Ͽ� ó���Ѵ�.(Servlet) 
 * 2. ����� �𵨷κ��� ó�� ����� ������ �߰��� ó���ϰų� �����ؾ��� ������ 
 * �ִٸ� ó�� �� request ��ü�� session ��ü�� �����ϰ�, 
 * 3. ��(jsp �������� �����Ͽ�)
 * forward�� redirect�Ͽ� Ŭ���̾�Ʈ�� ����Ѵ�. 
 * 
 * ��Ʈ�ѷ� : �� �������� ��û�� �ش系�뿡 �ڹٷ� ó���ϴ� �ڹ� ���α׷�����
 * �� ��ó�� Ŭ����
 * 1. Ŭ���̾�Ʈ�� url�� ���� ��û�� �ϸ� servlet���� ��û �������� doGet(),
 * doPost() �޼��带 ���ؼ� �޴´�.
 * 2. ��û������ ������ ���ؼ� �м��Ͽ� view �ܿ� �Ѱ��� �� ��ü�� ����� ��û��
 * �Ѵ�.
 * 3. service�ܿ��� �Ѱܿ� �ٽ� Model ��ü ������ jsp(view)�� �����Ѵ�.
 * ��û ������ ó���Ѵ�. 
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
// Controller�� xxx.me ��� ��ɾ� �Է�
@WebServlet(urlPatterns= {"*.me"},
				initParams = {@WebInitParam(name="properties", value="action.properties")})

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();
    public ControllerServlet() {
        super();
    }
    @Override
    // init�޼��� : ������ �ʱ�ȭ�� �� �ݵ�� ȣ�� ���ѹ��� ȣ��
    public void init(ServletConfig config) throws ServletException{
    	String props = config.getInitParameter("properties"); // ������ ������ ������Ƽ�̸��� ���� action.properties�о��
    	Properties pr = new Properties();
    	FileInputStream f= null;
    	try {
    		// ������Ƽ ���� �ε�
    		f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		pr.load(f);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}finally {
    		try {
    			if(f!=null) f.close();
    		}catch(IOException e) {}
    	}
    	// ������Ƽ�� Map�� 
    	for(Object k : pr.keySet()) { // Ű�� �����ͼ�
    		// model2/hollo.me = action.HelloAction
    		String command = (String) k;///model2/hello.me
    		String className = pr.getProperty(command);// action.HelloAction
    		// Ű�� Ű�� ���� ������
    		try {
    			Class commandClass = Class.forName(className);
    			// Ű�� ������ ��û Ŭ������ �����
    			// commandObj : action.HelloAction ��ü����
    			Object commandObj = commandClass.newInstance(); // ������ü����?
    			commandMap.put(command, (Action)commandObj);
    			// Map ��ü�� ������Ƽ Ű�� ��ûŬ������ Ű������ put�� 
    			// Action�������̽��� ����ȯ -> �θ� Ŭ������ ����ȯ 
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
			// command : /model2/hello.me Ű�� 
			command = request.getRequestURI().substring(request.getContextPath().length());
			// action: Action �������̽� ���� ��ü
			//  						action.HelloAction
			System.out.println(command);
			action = commandMap.get(command);
			// AddAction ���ϰ������ ����
			forward = action.excute(request, response);
		}catch(NullPointerException e) {
			forward = new ActionForward(); // ������ forward ���ϰ��� null�̾ 
			// ���� ó���� ���༭ null�� �ƴϰ� ��
		}catch(Exception e) {
			throw new ServletException(e);
		}
		// return new ActionForward(false, "../alert.jsp")
		if(forward != null) {
			if(forward.isRedirect()) { // isRedirect�� true�� 
				response.sendRedirect(forward.getView()); 
				// redirect�� ������ view(jsp)���Ϸ� �̵�
			}else { // isRedirect false -> forward
 				// isRedirect  = false�� 
				if(forward.getView() == null) { // view ��� ������ 
					// Ű�� ������ command���� .me�� .jsp�� �˾Ƽ� url��������
					forward.setView(command.replace(".me",  ".jsp"));
					//System.out.println("����");// - idã������ id.me ��
					// id.jsp�� �ؼ� view������ ������
				}
				// forward.getView() : action Ŭ�������� ���� view�̸� 
				// forward �������
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
				// request ���� �����ؼ� �Ķ���͵� ���� ����
				//System.out.println("����2"); //- id��ã���� �� �������ִ� ../alert.jsp�� �̵�
			}
		}else {
			response.sendRedirect("nopage.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	
	
	
	

}
