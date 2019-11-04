<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel ="stylesheet" type="text/css" href="../resources/css/table.css">
   <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css?ver=1">
<title>수정페이지</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script language = "javascript">
	$(document).ready(function(){
		$("#update").click(function(){
			$("#updateFrm").submit();
		});
	});
	
</script>
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
.list_table input{
width:88%;
}
</style>
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
<%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
%>
</head>
<body>
<jsp:include page="<%=contentPage2 %>" />
<div id="funclog">
	<%
	request.setCharacterEncoding("utf-8");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8";
	String mysql_id="root";
	String mysql_pw="1234";
	
	int num = Integer.parseInt(request.getParameter("num")); // get방식으로 받아온 board_no를 num에 저장 
	String lecturen = request.getParameter("lecturenum");
	
	try{
		Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);
		Statement stmt = conn.createStatement();
		
		String sql = "select building, dept, layer, lecturenum, yoil, lecturename, professor, start, end from test where id="+num; // 글번호 num으로 해당 글 제목, 내용을 조화해옴
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			 	String building = rs.getString(1);
			 	String dept = rs.getString(2);
			 	String layer = rs.getString(3);
			 	String lecturenum = rs.getString(4);
			 	String yoil = rs.getString(5);
			 	String lecturename = rs.getString(6);
			 	String professor = rs.getString(7);
			 	String start = rs.getString(8);
			 	String end = rs.getString(9);
			 	
	%>
<div class="container">
 <div class="boardcss_list_table">
	<table class="list_table" style="height:412px;">
  <form id="updateFrm" action="m_updateProc.jsp" method="post" >
  	<tr>
     <th>건물명 : </th>
        <td><input type="text" name="building"  id="building" value="<%=building %>"class="form-control"/></td>
    </tr>
    <tr>
     <th>학과명 : </th>
        <td><input type="text" name="dept"  id="dept" value="<%=dept %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>층 수 : </th>
        <td><input type="text" name="layer"  id="layer" value="<%=layer %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>호 수 : </th>
        <td><input type="text" name="lecturenum"  id="lecturenum" value="<%=lecturenum %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>요 일 : </th>
        <td><input type="text" name="yoil"  id="yoil" value="<%=yoil %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>강의명 : </th>
        <td><input type="text" name="lecturename"  id="lecturename" value="<%=lecturename %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>교 수 : </th>
        <td><input type="text" name="professor"  id="professor" value="<%=professor %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>시작시간: </th>
        <td><input type="text" name="start"  id="start" value="<%=start %>" class="form-control"/></td>
    </tr>
    <tr>
     <th>종료시간 : </th>
        <td><input type="text" name="end"  id="end" value="<%=end %>" class="form-control"/></td>
    </tr>
    <tr>
  <input type="hidden" id="id" name="id" value="<%=num%>">
  </form>
 </table>
 </div>
 </div>
  <%
  	rs.close();
  stmt.close();
  conn.close();
		}
	}catch(SQLException e){
		out.println(e.toString());
	}
  %>
  <div class="btnDiv">
  	<input type="button" id="update" value="수정완료">
  	<input type=button value="취소" OnClick="javascript:history.back(-1)">
  	<input type="submit" value="이전페이지" onClick="history.back()" >
  </div>
  </div>
</body>
</html>