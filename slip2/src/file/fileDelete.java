package file;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class fileDelete
 */
@WebServlet("/fileDelete")
public class fileDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fileDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = null;
		 String fileName = request.getParameter("file");
		 
		  String directory="C:/JSP/upload";
		  File file = new File(directory +"/"+fileName);
		
		  try {
			String dbURL = "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
			 String dbID = "root";
			 String dbPassword = "1234";
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(dbURL,dbID, dbPassword);
			 try {
				  String SQL = "delete from file where fileName='"+fileName+"'";
				  PreparedStatement pstmt = conn.prepareStatement(SQL);
				 // pstmt.setString(1,  fileName);
				  pstmt.executeUpdate(SQL);
				  System.out.println("db ���� ���� ����");
				  
				  if(file.exists()) {
					  if(file.delete()) {
						  System.out.println("���� ���ϰ�� ���ϻ��� ����");
					  }else {
						  System.out.println("���� ���ϰ������ ���� ����");
					  }
				  }else {
					  
					 System.out.println("������ �������� ����");
				  }
			  }catch(Exception e) {
				  e.printStackTrace();
				  System.out.println("db �������� ���� ����"+e);
			  }
			 
		  }catch(Exception e) {
			  e.printStackTrace();
			  System.out.println("DB Driver Error!");
		  }
		  
		  
		 response.sendRedirect("http://localhost:8080/slip2/manager/fileDownload.jsp");
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
