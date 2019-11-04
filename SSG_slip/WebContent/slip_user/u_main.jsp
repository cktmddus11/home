<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SLIP</title>

<link rel ="stylesheet" type="text/css" href="../resources/css/part.css"> 
     <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="u_menubar.jsp";
%> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
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
         
         function popupOpen(){
            var popUrl = "../slip_manager/m_login.jsp";
            var popOption = "width=450, height = 360, resizeable=no, scrollbars=no, status=no;" // 팝업 옵션
            window.open(popUrl,"", popOption);
         }
 </script>

   </head>
   <body>
   <jsp:include page="<%=contentPage2 %>" />
   <div class="content">
         <div class="banner">
         <ul>
           <li><img src="../resources/img/doowon1.jpg" align="middle" ></li>
           
         
       </ul>
      </div>
      </div>
<div class="footer">
    <p class="copyright">본 사이트의 모든 컨텐츠는 무료로 배포하므로 복사, 배포를 하고싶으신 분은 연락주세요.<br>
    made by. 두원공과대학교 SSG</p> 
    <style>
   img {
    height : 100%;   
   max-width: 100%;
   width: 600px;
   }
   </style>
   <p id="light" class="white_content">
     <a href="javascript:popupOpen();"><img src="../resources/img/doowon.png"/></a>
  </div>

</body>
</html>