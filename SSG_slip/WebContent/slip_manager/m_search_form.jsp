<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의실 정보</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/slip_manager/m_search_list.jsp" method="post">
		<select name="sk"> <!-- 검색키 -->
		<option value="building">건물명</option>
		<option value="dept">학과명</option>
		</select>
		<input type="text" name="sv"> <!-- 검색값 -->
		<input type="submit" value="검색버튼">
	</form>
</body>
</html>