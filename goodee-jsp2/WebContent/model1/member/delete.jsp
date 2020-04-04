<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <%
  	String id = request.getParameter("id");
   String login = (String)session.getAttribute("login");
   String inputpass = request.getParameter("pass");
   MemberDao m = new MemberDao();
   Member dao = m.selectOne(id);
	String dbpass = dao.getPass();

	
   String msg = null;
   String url = null;
 	if(login != null){
 		if(!login.equals("admin") && !login.equals(id)){
 			msg = "본인만 탈퇴가 가능합니다.";
 			url = "main.jsp";
 		}else if(!login.equals("admin") && login.equals(id)){
 			if(!dbpass.equals(inputpass)){
 				msg = "비밀번호가 틀립니다.";
 				url = "deleteForm.jsp?id="+id;
 			}else{
 				if(m.delete(id)>0){
 					msg = "탈퇴하셨습니다.";
 					url = "logout.jsp";
 				}else{
 					msg = "탈퇴중 오류가 발생하였습니다.";
 					url = "info.jsp?id="+id;
 				}
 					
 			}
 		}
 		if(login.equals(id) && login.equals("admin")){
 			msg = "관리자는 탈퇴가 불가능합니다.";
 			url = "list.jsp";
 		}else if(!login.equals(id) && login.equals("admin")){
 			if(m.delete(id) >0){
					msg = "탈퇴하였습니다.";
					url = "list.jsp";
				}else{
					msg = "탈퇴중 오류가 발생하였습니다.";
					url = "info.jsp?id="+id;
				}
 		}
 		
 	}else{
 		msg = "로그인하세요";
 		url = "loginForm.jsp";
 		
 	}
   
   
   %>
   <script>
	alert("<%= msg %>");
	location.href="<%=url %>";
	</script>
   
<!--  -->   
