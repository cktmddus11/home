<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>core �±� : ���ǹ� ����</title>
</head>
<body>
	<h3>���ǹ� ���� �±� : if, choose �±�</h3>
	<c:if test="${5 < 10}"> <!--  test �Ӽ��� boolean���̾���� -->
		<h4>5�� 10���� �۴�</h4>
	</c:if>
	<% if(5 < 10) { %>
		<h4>5�� 10���� �۴�</h4>
	<%}%>
	<c:if test="${6+3 != 9}">
		<h4>6+3�� 9�� �ƴϴ�.</h4>
	</c:if>
	
	<c:choose>
		<c:when test="${5+10==510 }">
			<h4>5 + 4 = 510</h4>
		</c:when>
		<c:otherwise>
			<h4>5 + 10 = ��</h4>
		</c:otherwise>
	</c:choose>
	
</body>
</html>