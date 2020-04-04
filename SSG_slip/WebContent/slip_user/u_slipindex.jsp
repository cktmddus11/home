<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <link rel ="stylesheet" type="text/css" href="../resources/css/part.css?ver=2">
<%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="u_menubar.jsp";
%> 
<style type="text/css">

h2 {
font-weight: bold;
font-size: 1.5em;
color: purple;
letter-spacing: 2px;
text-align: center;
}
h3 {
font-size: 1em;
font-weight: normal;
text-align: center;
}
h4 {
font-weight: bold;
font-size: 1.5em;
color: purple;
letter-spacing: 2px;
text-align: center;

}
h5 {
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
<h2>&nbsp;&nbsp;&nbsp;<   Slip 만든 계기   ></h2>
<h3>&nbsp;&nbsp;&nbsp;신입생, 복학생 등을 위한 강의실 강의 시간표와 관련 학과의 해당 시간 사용 유/무 등</br>
&nbsp;&nbsp;&nbsp;학생들이 바로 확인할 수 있는 강의실 정보에 대한 필요성 요구가 증가하였기 때문에</br>
SLIP을 만들게 되었습니다.</br></br></h3>
<h4>&nbsp;&nbsp;&nbsp;<   Slip 기능 소개   ></h4>
<h5>1. 언제 어디서나 사용자가 원하는 강의실 위치 정보 및 사용 여부를 확인할 수 있는</br>
 기능을 웹과 앱으로 구현하였습니다.</br>
2. 강의실에 대한 정보를 편리하게 사용자 측면에서 서비스 할 수 있는 인터페이스 구현</br>
3. SLIP시스템을 개발하여 대학 내 정보에 익숙지 않은 신입생, 복학생(재학생)들이</br>
필요로 하는 향상된 강의실 정보 접근성 확대 개선에 목적을 둠.</h5>
</div>
</body>
</html>