<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass �Ķ���͸� ������ ����
	2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
		Ʋ����� : ��й�ȣ ���� �޽��� ���, deleteForm.jsp ������ �̵�
	3. ��й�ȣ�� �´� ��� : �Խù� ����
		���� ���� : ���� ���� �޽��� ���, list.jsp ������ �̵�
		���� ���� : ���� ���� �޽��� ���, info.jsp

--%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

BoardDao dao = new BoardDao();
Board b = dao.selectOne(num);

String msg = null;
String url = null;
if(b == null){
	msg = "���� �Խñ� �Դϴ�.";
	url = "list.jsp";
}else{
	String dbpass = b.getPass();
	if(dbpass.equals(pass)){
		if(dao.delete(num)){
			msg = "���� �Ǿ����ϴ�.";
			url = "list.jsp";
		}else{
			msg = "������ ���� �߻�";
			url = "info.jsp?num="+num;
		}
	}else{
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		url = "deleteForm.jsp?num="+num;
	}
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>