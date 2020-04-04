<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style = "
padding-left: 13%;
padding-right: 13%;
padding-top: 2%;
padding-bottom: 3%;
">
<head>
<meta charset="UTF-8">
   <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
   <link rel ="stylesheet" type="text/css" href="../resources/css/part.css">
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
</head>

<body>
 <jsp:include page="<%=contentPage2 %>" />
   <div class="content">
         <div class="banner">
          <img src="../resources/img/doowon1.jpg" align="middle" >
      </div>
      </div>
<div class="footer">
    <p class="copyright">본 사이트의 모든 컨텐츠는 무료로 배포하므로 복사, 배포를 하고싶으신 분은 연락주세요.</br>
    만든이: 두원공과대학교 스마트 it학과 17학번 강은지 김미선 김수지 이나영 차승연</p>
  </div>
  </body></html>
