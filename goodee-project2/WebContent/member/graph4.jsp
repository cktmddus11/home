<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
[
<c:forEach var ="map" items="${list2}" varStatus = "stat1">
	<c:forEach var="m" items="${map}" varStatus = "stat2">
		<c:if test="${m.key == 'grape'}">{</c:if>
		<c:if test="${m.key != 'grape'}">,</c:if>
			"${m.key}":"${m.value}"
		<c:if test="${m.key != 'grape'}">}</c:if>
	</c:forEach>
	<c:if test="${stat1.count < list2.size()}">,</c:if>
</c:forEach>
]
