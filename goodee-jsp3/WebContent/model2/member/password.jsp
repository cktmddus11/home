<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
<%-- opner true �� ū ȭ������ ��Ÿ���� �ϰ� opner false
�� �ڽ� â�� �״�� �߰���--%>
	alert("${msg}");  
	<c:choose>
	<c:when test="${opener}">
		opener.location.href="${url}";
	</c:when>
	<c:otherwise>
		location.href="${url}";
	</c:otherwise>
	</c:choose>
	<c:if test="${closer}">
		self.close();
	</c:if>
</script>