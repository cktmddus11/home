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
 			msg = "���θ� Ż�� �����մϴ�.";
 			url = "main.jsp";
 		}else if(!login.equals("admin") && login.equals(id)){
 			if(!dbpass.equals(inputpass)){
 				msg = "��й�ȣ�� Ʋ���ϴ�.";
 				url = "deleteForm.jsp?id="+id;
 			}else{
 				if(m.delete(id)>0){
 					msg = "Ż���ϼ̽��ϴ�.";
 					url = "logout.jsp";
 				}else{
 					msg = "Ż���� ������ �߻��Ͽ����ϴ�.";
 					url = "info.jsp?id="+id;
 				}
 					
 			}
 		}
 		if(login.equals(id) && login.equals("admin")){
 			msg = "�����ڴ� Ż�� �Ұ����մϴ�.";
 			url = "list.jsp";
 		}else if(!login.equals(id) && login.equals("admin")){
 			if(m.delete(id) >0){
					msg = "Ż���Ͽ����ϴ�.";
					url = "list.jsp";
				}else{
					msg = "Ż���� ������ �߻��Ͽ����ϴ�.";
					url = "info.jsp?id="+id;
				}
 		}
 		
 	}else{
 		msg = "�α����ϼ���";
 		url = "loginForm.jsp";
 		
 	}
   
   
   %>
   <script>
	alert("<%= msg %>");
	location.href="<%=url %>";
	</script>
   
<!--  -->   
