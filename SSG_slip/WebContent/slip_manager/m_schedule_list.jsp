<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*" %>
<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 목록</title>
 <link rel ="stylesheet" type="text/css" href="../resources/css/table.css?ver=1">
   <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
<%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
%> 
<%
   String contentPage3=request.getParameter("contentPage3");
   if( contentPage3 ==null)
         contentPage3="m_index.jsp";
%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   	   <script>
   	      $(function(){
   	      	var pull=$('#pull');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pull).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('part');}   });
   	   	  });
   	   
 </script>
</head>
<body>
	<jsp:include page="<%=contentPage2 %>" />	
	<div id="funclog">
	  <div class="boardcss_list_table">
	  	<table class="list_table">
	  	<caption></caption>
      	<colgroup>
      	<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			
				</colgroup>
      	<thead>
         <tr>
            	<th>파일명</th>
				<th>다운로드 횟수</th>
				<th>삭제</th>
			</tr>
		</thead>
		<% 
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs0 = null;
		
		
		 try{
			   String fileRealName, fileName;
			   int datacount=0; 
			    int pagecount;
			    Class.forName("com.mysql.jdbc.Driver");
			    conn = DriverManager.getConnection
			    ("jdbc:mysql://localhost:3306/file?useUnicode=true&characterEncoding=utf8","root","1234"); 
			    if(conn==null){
			    	   throw new Exception("데이터베이스 연결 실패");  }
			    stmt = conn.prepareStatement("select count(*) from file");
			    rs0 = stmt.executeQuery();
			     if(rs0.next()){
			       datacount=rs0.getInt(1);
			       rs0.close(); 
			     }
			   
			     int pagesize=10; 
				    pagecount = datacount/(pagesize+1)+1; 
				    int mypage=1; 
				    int abpage=1;   
			
			    
			    if(request.getParameter("mypage") !=null){
			        mypage = Integer.parseInt(request.getParameter("mypage")); 
			        abpage = (mypage-1)*pagesize;
			        if(abpage<=0) abpage=1; 
			         }
			       
			   
			
			  
		ArrayList<FileDTO> fileList = new FileDAO().getList();
		for(FileDTO file : fileList){
	%>			
			<tr>
			<td>	
			
			<% 	
			
			out.write("<a href=\""+request.getContextPath() + "/downloadAction?file=" +
			java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">"+file.getFileName()); 
			%>
			</td>
			<td>
			<% 
			out.write("다운로드 횟수 : "+file.getDownloadCount()+ "</a><br>");
		%>
			</td>
			
			<td>
			<a href="#">삭제</a>
			</td>
			</tr>
			<% 
		
        %>
			<% 
		}
		
		 System.out.println(pagecount);
	        conn.close();
	        stmt.close();
	      
	%>
		</table>
		<%
		
       if(pagecount != 1) {
              for(int l=1; l<=pagecount; l++){
       out.println("<a href=m_schedule_list.jsp?mypage=" + l+ ">"+ l + "|</a>");
         }
      }
      else{
         out.println("1"); 
      }
    } catch(Exception e){
        out.println(e);
    } 
    %>
		
		<jsp:include page="<%=contentPage3 %>" />	
		</div>
		</div>
			
</body>
</html>