<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
<%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
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
<style type="text/css">

h2 {
font-weight: bold;
font-size: 1.5em;
color: purple;
letter-spacing: 2px;
text-align: center;
}
h3 {
text-align:center;
font-size: 1.2em;
font-weight: normal;
text-align: center;
}
h4 {
font-size: 1em;
font-weight: normal;
text-align: center;
}

#funclog{
   background-color : #ecd9e2;
   padding-bottom : 3%;
   padding-top : 1%;
   width : 90%;
}
</style>
</head>
<body>
  <jsp:include page="<%=contentPage2 %>" />
<div id="funclog">
<h2>&nbsp;&nbsp;&nbsp;<  Slip 매뉴얼   ></h2>
<h3>1. slip 매뉴얼<br></h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;slip을 어떻게 관리하는지에 대한 설정이 적혀있습니다.<br></h4>
<h3>2. 강의실 정보 관리<br></h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의실 정보 관리에서는 강의실에 수업시간, 강의명, 강의교수에 대한 정보를 수정할수 있습니다.<br>
정보 수정과 삭제는 아래 버튼을 클릭하면 됩니다.</h4>
<h3>3. 학사일정 관리<br></h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학사일정 관리에서는 학사일정을 파일로 업로드 받아 사진으로 볼수 있게 하였습니다.<br>
학사일정이 바뀐 경우 관리자가 파일 업로드를 새로 하면 됩니다.<br></h4>
<h3>4. 시간표 관리</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시간표는 각 학과가 왼쪽에 나열되어 있습니다.<br>
원하는 학과를 클릭하면 사진으로 오른쪽에 시간표가 나타날 것입니다.<br>
시간표가 바뀌었다면 파일 업로드를 이용하여 새로운 사진으로 변경하면 됩니다.<br></h4>
<h3>5. GPS 관리</h3>


</div>
</body>
</html>