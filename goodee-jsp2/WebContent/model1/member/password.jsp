<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%--
    1. �α׾ƿ������� ���. �α��� �ϼ���. �޽��� ��� 
    	�ٸ� ������� ��й�ȣ ���� �Ұ�
    	Opner �������� loginForm.jsp ������ �̵�. 
    	���� ������ �ݱ� -> opener ����� �ִ� ������ ��ü.location? 
    2. pass, chgpass �Ķ���Ͱ� ���� 
    3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ���� 
    	��й�ȣ ���� �޽��� ���. passwordForm.jsp ������ �̵�
    4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������ 
    	��й�ȣ ����. opner �������� updateForm.jsp ������ �̵�
    	���� ������ �ݱ� 
     --%>    
    
<%
String login = (String) session.getAttribute("login");
MemberDao m = new MemberDao();
Member dao = m.selectOne(login);
String dbpass = dao.getPass(); // �α����� ���̵� �´� ��й�ȣ db���� ��ȸ
String pass = request.getParameter("beforepass"); // ����ڰ� �Է��Ѻ�й�ȣ

String afterpass = request.getParameter("afterpass");
//System.out.println("dbpass : "+dbpass+", pass : "+pass);

String msg = null;
String url = null;
boolean closer = false;
boolean opener = false;
if(login == null || login.trim().equals("")){
	msg = "�α����ϼ���.";
	url = "loginForm.jsp";
	closer = true;
	opener = true;
}else{
	if(dbpass.equals(pass)){
		int result = m.updatePw(login, afterpass); //������ ��й�ȣ�� id����.
		if(result >0){
			msg = "��й�ȣ�� �����Ǿ����ϴ�.";
			url = "updateForm.jsp?id="+login;
			closer = true;
			opener = true;
		}else{
			msg = "��й�ȣ ������ ���� �߻�";
			url = "passwordForm.jsp";
		}
	}else{
		System.out.println(closer+":"+opener);
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		url = "passwordForm.jsp";
	}
}


%>    
<script>
<%-- opner true �� ū ȭ������ ��Ÿ���� �ϰ� opner false
�� �ڽ� â�� �״�� �߰���--%>
	alert("<%=msg%>");  
	<%if(opener){ %>
		opener.location.href="<%=url %>";
	<%}else {%>
		location.href="<%=url%>";
	<%}%>
	<%if(closer){ %>
		self.close();
	<%} %>
</script>