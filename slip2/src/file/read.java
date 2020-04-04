package file;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
//import com.sun.javafx.scene.paint.GradientUtils.Parser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class read
 */
@WebServlet("/read")
public class read extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	Connection connect = null;	
	PreparedStatement preparedStatement = null;
	
	String fileName = request.getParameter("file");
	File input = new File("C:\\JSP\\upload\\build\\"+fileName);
	String jsonName = fileName.substring(0, fileName.length()-4); // csv 확장자 제거	
	File output = new File("C:\\Users\\Cha\\Desktop\\h\\json_"+jsonName+".json");
	
	CsvSchema csvSchema = CsvSchema.builder().setUseHeader(true).build();
	CsvMapper csvMapper = new CsvMapper();
	 
	// Read data form CSV file
	List<Object> readAll = csvMapper.readerFor(Map.class).with(csvSchema).readValues(input).readAll();
	ObjectMapper mapper = new ObjectMapper();
	
	// Write JSON formated data to output.json file 파일생성
	//mapper.writerWithDefaultPrettyPrinter().writeValue(output, readAll);
	
	// Write JSON formated data to stdout 파일 읽고 콘솔 출력
	System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(readAll));
	String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(readAll);
	
	//if(output.exists()) {
		try {
			// Load the Mysql driver, each db has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			
			// db connection setup
			String dbURL = "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "1234";
			connect = DriverManager.getConnection(dbURL,dbID, dbPassword);
			try {
				preparedStatement = connect.prepareStatement("insert into build values (?, ?, ?)");
				JSONParser parser = new JSONParser();
				// json파일 생성된거 파싱해서 객체에 담음 
				//Object obj = parser.parse(new FileReader("C:\\Users\\Cha\\Desktop\\h\\json_"+jsonName+".json"));
				Object obj = parser.parse(jsonString);
				JSONArray jsonArr = (JSONArray) obj;
				
				for(int i = 0;i<jsonArr.size(); i++) {
					
					JSONObject jsonObject2 = (JSONObject)jsonArr.get(i);
					// build, lecture, dept
					
					String build = (String) jsonObject2.get("build");
					preparedStatement.setString(1, build);
				
					String lecture = (String) jsonObject2.get("lecture");
					preparedStatement.setString(2, lecture);
				
					String dept = (String) jsonObject2.get("dept");
					preparedStatement.setString(3, dept);
				
					preparedStatement.executeUpdate();
				}
				
				System.out.println("insert success");
				response.sendRedirect("fileDownload.jsp");
				
			}catch(Exception e) {
				System.out.println("db insert error "+e);
			}
		}catch(Exception e) {
			System.out.println("db연결  error"+e);
		}
	
		
	
	}
}
