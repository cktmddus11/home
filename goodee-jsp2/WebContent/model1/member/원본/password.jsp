<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
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
String login = (String)session.getAttribute("login");
boolean opener = false;
boolean closer = false;
String msg = null;
String url = null;

if(login == null  || login.trim().equals("")){	
	opener = true;
	closer = true;
	msg = "�α��� �ϼ���";
	url = "loginForm.jsp";
}else{
	//String id = request.getParameter("id2");
	Member dao = new MemberDao().selectOne(login); // ���� �α��ε� id�� db���� ��й�ȣ ��ȸ 
	String dbpass = dao.getPass(); // ��ȸ�� ��й�ȣ

	String afterpass = request.getParameter("afterpass"); //�ٲ� ��й�ȣ
	String beforepass = request.getParameter("beforepass"); // ���� ��й�ȣ
	if(!dbpass.equals(beforepass)){ // ���� �Է��� ��й�ȣ�� db ��й�ȣ�� �ٸ��� ��й�ȣ ���� ����x
		msg = "��й�ȣ �����Դϴ�. Ȯ���ϼ���.";
		url = "passwordForm.jsp";
	}else{ // ���� �Է��� ��й�ȣ�� db ��й�ȣ�� ������ ��й�ȣ ���� ����
		MemberDao mdao = new MemberDao();
		int result = mdao.updatePw(login, afterpass); // ���� �α��ε� id�� �ٲ� ��й�ȣ�Ѱ��༭ ��й�ȣ ����
		//System.out.println(result);
		if(result >0){
			opener = true;
			closer = true;
			msg = "����Ǿ����ϴ�";
			url = "updateForm.jsp?id="+login;
		}
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


