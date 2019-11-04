<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <% String id = request.getParameter("id"); 
        if(id.equals("admin")){
        %>
        <script>
        window.opener.location.href="m_main.jsp";
    	window.close();
        </script>
        	<%
        	
         } else{ %>

        	<script>
        	alert("관리자 권한이 없는 아이디 입니다.  ");
        	window.location.href = "m_login.jsp";
        	</script>	
      
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  관리자 권한이 없는 아이디 입니다. 
</body>
</html>
<%
}
%> 