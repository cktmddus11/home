<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    
<c:forEach var="list" items="${select_info2}">
<option value='${list.dept}'>${list.dept}</option>
</c:forEach>
