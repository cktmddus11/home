<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/main.css">
<title></title>
</head>
<body>
<!-- �Էµ� ������ join.jsp �� ����ϱ� 
�� 1. useBean, setProperty �� �̿��ϱ�
2. BeanŬ������ �̸��� chap7.Member -->
	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="member" class="chap7.Member" scope="page"/>
	<!--  id : jsp ������ ���� �ڹٺ� ��ü�� ������ �� ����ϴ� �̸��̴�. 
	class : ��Ű�� �̸��� ������ �ڹٺ� Ŭ������ ������ �̸� �Է�
	scope : �ڹٺ� ��ü�� ����� ������ ����. 
	page pageContext �⺻��ü
	, request request �⺻��ü 
	, session session �⺻��ü, 
	application application �⺻��ü �� �ϳ��� 
	������ ���´�. �⺻���� page  -->
	
	<!-- 
	Member member = (Member)request.getAttribute("member");
	if(member == null){
		member = new Member();
		request.setAttribute("member", member);
	}
	�±׿��� id�Ӽ����� ������ �̸��� �Ӽ����� ���� ���  
	�� ��ü�� �״�λ���ϰ� ������ ���ο� ��ü�� �����Ѵ�. 
	 -->
	<jsp:setProperty name="member" property="*" />
	<%--   name : ������Ƽ�� ���� ������ �ڹٺ� ��ü�� �̸�
	<jsp:useBean> �׼��±��� id �Ӽ����� ������ ���� ���
	property : ���� ������ ������Ƽ�� �̸� 
	value : ������Ƽ�� �� ǥ���� ����  
	property �Ӽ��� ���� * �� ������ �� ����. �̷� ��� ������ 
	������Ƽ�� ���� ���� �̸��� ���� �Ķ������ ������ �����Ѵ�. 
	
	tel �Ķ������ ����  tel������Ƽ�� ������ ����
	private String id;
	private String password;
	private int gender;
	private int age;
	private String email; --> --%>
	
	<jsp:setProperty name="member" property="password" param="pass"/>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>���̵� </th>
			<td><jsp:getProperty name="member" property="id"/></td>
		</tr>
		<tr>
			<th>��й�ȣ </th>
			<td><jsp:getProperty name="member" property="password"/></td>
		</tr>
		<tr>
			<th>���� </th>
			<td><jsp:getProperty name="member" property="gender2"/></td>
		</tr>
		<tr>
			<th>���� </th>
			<td><jsp:getProperty name="member" property="age"/></td>
		</tr>
		<tr>
			<th>�̸��� </th>
			<td><jsp:getProperty name="member" property="email"/></td>
		</tr>
		
	</table>

	
</body>
</html>