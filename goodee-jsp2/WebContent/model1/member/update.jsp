<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
  1. ��� �Ķ���� Member ��ü�� ����
  2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ������
  		"��й�ȣ�� Ʋ�Ƚ��ϴ�". �޽��� ��� ��, updateForm.jsp�������� �̵�
  3.  1���� ������ db�� �����ϱ�
  		int MemberDao.update(Member) 
  		����� 0���� ũ�� �������� �޽��� ���. info.jsp ������ �̵� 
  					0 ���ϸ� ���� ���� �޽��� ���. main.jsp ������ �̵�
  
   --%>
   <%request.setCharacterEncoding("euc-kr");%>
   <%-- Member mem = new Member(); --%>
   <jsp:useBean id="member" class="model1.Member" />
    <%-- mem.setId(request.getParameter("id")) --%>
   <jsp:setProperty name="member" property="*" />
   <%
   String login = (String)session.getAttribute("login");
   String pass = request.getParameter("pass");
	String id = member.getId();
   // selectOne(id) : ����� id�� �ش��ϴ� db���� Member ��ü�� ����
   // dao.getPass() : ������ Member ���� ����
   Member dao = new MemberDao().selectOne(id);
   System.out.println(dao);
   String msg = null;
   String url = null;
   if(!pass.equals(dao.getPass()) && !login.equals("admin") ){ // ����??
	   // admin�� �ƴϰ�, ���� �Է��� ��� �ٸ���
	  	msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	   	url = "updateForm.jsp?id="+id;
   }else{ // admin�̰�, ���� �Է��� ����� ������
	   int result = new MemberDao().update(member); // ���� ���� member
	   if(result > 0){
		   msg = "��������";
		   url = "info.jsp?id="+id;
	   }else{
		   msg = "��������";
		   url = "main.jsp";
	   }
   }
   %>
   <script>
	alert("<%=msg %>");
	location.href="<%=url %>";
   </script>
   