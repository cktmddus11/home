<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <%
    request.setCharacterEncoding("euc-kr"); %> <!--  ���� -->
    <%-- Member mem = new Member(); --%>
     <jsp:useBean id="mem" class="model1.Member" />
    <jsp:setProperty name="mem" property="*"/> <!--  �Է��� ��й�ȣ -->
    <%-- mem.setId(request.getParameter("id")) --%>
    <% 
    // selectOne(id) : ����� id�� �ش��ϴ� db���� Member ��ü�� ����
    // dbmem : ������ Member ���� ����
    Member dbmem = new MemberDao().selectOne(mem.getId());
    String pass =  dbmem.getPass(); // db ��й�ȣ
    String login = (String) session.getAttribute("login");
    // ���Ǽ��� ����,            mem.getPass�� pass �������� ??
   	if(!login.equals("admin") && !pass.equals(mem.getPass())){  
   		%> 
   		<script>
   			alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
   			location.href="updateForm.jsp?id=<%=mem.getId() %>";
   		</script>
   		<% 
   	}else{ // ��й�ȣ�� ��ġ�ϴ� ���
   		MemberDao dao = new MemberDao();
   	// db�� ȸ�� ���� ���� ���. ��� ������ ����
   		int result  = dao.update(mem); // useBean ������ �Է��Ѱ� ��ü mem
		if(result > 0){
			%>
			<script>
			alert("��������");
			location.href="info.jsp?id=<%=mem.getId() %>";
			</script>
			<% 
		}else{
			%>
			<script>
			alert("��������");
			location.href="main.jsp";
			</script>
			<% 
		}
   	}
    
    
    %>
  <%--
  1. ��� �Ķ���� Member ��ü�� ����
  2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ������
  		"��й�ȣ�� Ʋ�Ƚ��ϴ�". �޽��� ��� ��, updateForm.jsp�������� �̵�
  3.  1���� ������ db�� �����ϱ�
  		int MemberDao.update(Member) 
  		����� 0���� ũ�� �������� �޽��� ���. info.jsp ������ �̵� 
  					0 ���ϸ� ���� ���� �޽��� ���. main.jsp ������ �̵�
  
   --%>
