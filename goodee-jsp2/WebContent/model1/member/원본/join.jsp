
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. �Ķ���� ������ Member ��ü�� ����
2. Member ��ü�� db�� ���� => model ���
3. ȸ������ ���� : loginForm.jsp ������ �̵�
    ȸ������ ���� : joinForm.jsp ������ �̵�. - ���̵� �ߺ���
 --%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="model1.Member" />
<jsp:setProperty name="m" property="*"/>
<%
	MemberDao dao = new MemberDao();
	int result = dao.insert(m);
	String msg = null;
	String url = null;
	if(result > 0){
		msg = m.getName() + "�� ȸ�� ���� �Ϸ�";
		url = "loginForm.jsp";
	}else{
		msg = "ȸ������ ����";
		url = "loginForm.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url%>";
</script>
