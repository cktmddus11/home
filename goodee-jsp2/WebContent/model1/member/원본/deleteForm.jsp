<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż�� ��й�ȣ �Է� ȭ�� </title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
		<table>
			<caption>ȸ�� ��й�ȣ �Է�</caption>
			<tr>
				<th> ȸ�� ��й�ȣ �Է�</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Ż���ϱ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>
  <%-- 
  1. �α׾ƿ� ���� : �α����ϼ��� �޽��� ���, loginForm.jsp ������ �̵�
  2. 	�α��� ���� 
  		- �����ڰ� �ƴϰ�, id�� login �� �ٸ� ��� 
  				"���θ� Ż�� �����մϴ�." �޽��� ���. main.jsp �������� �̵� 
  		- id�� �������� ���� 
  				"�����ڴ� Ż�� �Ұ����մϴ�." �޽��� ���. list.jsp �������� �̵� 
  				
  		- �Ϲ� �����
  		(1) ���̵�, ��й�ȣ ������ �Ķ���ͷ� ����
  		(2)  ��й�ȣ ����ġ => �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ����
  			  		"��й�ȣ�� Ʋ���ϴ�. �޼��� ���. deleteForm.jsp ������ �̵�
  		- ������ 
  		(1) ���̵� ������ �Ķ���ͷ� ����
  3. ������ �α���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db ���� ȸ������ �����ϱ�
  		�������� : �Ϲݻ���� : �α׾ƿ� ��, Ż��޽��� ���. loginForm.jsp�� ������ �̵�
  						������ : Ż��޽��� ���. list.jsp
  		���� ���� : �Ϲݻ���� : �������� �޽��� ���. info.jsp ������ �̵�. 
  						������ : ���� ���� �޼��� ���. list.jsp ������ �̵�
  
  
   --%>