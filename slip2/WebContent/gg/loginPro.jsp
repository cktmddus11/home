<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	// 로그인 화면에 입력된 아이디와 비밀번호를 가져옴
	int id= Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("password");
	
	// DB에서 아이디, 비밀번호 확인
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.loginCheck(id, pw);
	
	// URL 및 로그인 관련 전달 메시지
	String msg = "";
	
	if(check == 1){
		// 로그인 성공
		session.setAttribute("sessionID", id);
		msg = "main.jsp";
	}
	else if(check == 0){
		// 비밀번호 틀릴 경우
		msg = "login.jsp?msg=0";
	}
	else {
		msg = "login.jsp?msg=-1";
	}
	// sendRedirect(String URL)
	// URL 뒤에 get방식 처럼 데이터 전달 가능
	response.sendRedirect(msg);
	
	%>
</body>
</html>