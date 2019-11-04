<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사용자단 상세 페이지</title>
<link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
   <link rel ="stylesheet" type="text/css" href="../resources/css/table.css">
<style>
th{
background-color : #faf9fa;
}
.boardcss_list_table{
width:90%;
} 
.list_table{
padding-left:12%;
}
</style>
</head>
 <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="u_menubar.jsp";
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
<body>
	<jsp:include page="<%=contentPage2 %>" />	
<div id="funclog">
	<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
  
 try{
    int id ;
    String confirm, layer,yoil, building, dept,lecturenum, lecturename, professor, start, end;
	
	
    String num= request.getParameter("num"); 
    confirm =request.getParameter("use");
    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8","root","1234"); 
   if(conn==null){
   throw new Exception("데이터베이스 연결 실패");  }

        pstmt = conn.prepareStatement("select id, building, dept, layer, lecturenum, yoil, lecturename, professor, str_to_date(start, '%H%i%s'), str_to_date(end, '%H%i%s'), start, end from test where id="+num);
        rs = pstmt.executeQuery();
        
       while(rs.next()){
           id = rs.getInt("id"); 
           building = rs.getString("building"); 
           dept = rs.getString("dept");
           layer=rs.getString("layer");
           lecturenum = rs.getString("lecturenum");
           yoil = rs.getString("yoil"); 
           lecturename = rs.getString("lecturename");
           professor=rs.getString("professor");
           String start1 = rs.getString("str_to_date(start, '%H%i%s')");
           String end1 = rs.getString("str_to_date(end, '%H%i%s')");
           start = rs.getString("start");
           end = rs.getString("end");
          
         
        /* out.println("건물:"+building+"학과:"+dept+"강의실:"+lecturenum+"강의명"+lecturename+"시작시간:"+start+"종료시간"+end); */
         String color = "#ed6363"; // 빨
        if(confirm == "n")color="#65a965;";
        
         
 %>
      <div class="boardcss_list_table">
        <div class="boardcss_list_table">
	  	<table class="list_table">
         <tr>
         	    <th>번호</th>
         	    <td> <%=id %></td>
         </tr>
         <tr>	    
				<th>건물명</th>
				<td> <%=building  %></td>
		</tr>		
		<tr>
				<th>학과</th>
				<td> <%=dept %></td>
		</tr>
		<tr>
				<th>층 수</th>
				<td> <%=layer %></td>
		</tr>
		<tr>
				<th>호 수</th>
				 <td> <%=lecturenum %></td> 
				
		</tr>
		<tr>
				<th>요일</th>
				<td> <%=yoil  %></td>
		</tr>		
		<tr>
				<th>강의명</th>
				 <td> <%=lecturename %></td>
		</tr>
		<tr>
				<th>교 수</th>
				<td> <%=professor %></td>
		</tr>
		<tr>
				<th>시작시간</th>
				 <td> <%=start1 %></td>
		</tr>		
		<tr>
				<th>종료시간</th>
				<td> <%=end1 %></td>
		</tr>
		<tr>		
				<th>사용여부</th>
				<td style="background-color : <%=color%>"> <%=confirm %></td>
      	</tr> 
            
      <% 
       }
      
        rs.close();
        conn.close();
        pstmt.close();
     
    
     %>
    </table>
    <input type="hidden" id="id" value="<%=num%>"> 
    <br>
    
    
    <%

    } catch(Exception e){
        out.println(e);
    } 

     %>
     
    
   
   
   
   
</div>  
<br>
<div style="padding-left:10%;">
 <input type="submit" value="이전 목록" onclick='history.go(-1); return false;' >
 <input type="submit" value="처음으로" onclick="javascript:location.href='u_list.jsp'" >
</div>
</div>

</body>
</html>