<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의실 정보</title>
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

<%
String num=request.getParameter("num"); 
%>
	<form action="<%=request.getContextPath() %>/slip_user/u_Detail_search_list.jsp?num=<%=num %>" method="post">
		<select name="sk"> <!-- 검색키 -->
		<option value="lecturename">강의명</option>
		<option value="yoil">요 일</option>
		<option value="professor">교 수</option>
		</select>
		<input type="text" name="sv" > <!-- 검색값 -->
		<input type="submit" value="검색버튼">
	</form>
</body>
</html>