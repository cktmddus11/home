<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%--
    1. 로그아웃상태인 경우. 로그인 하세요. 메시지 출력 
    	다른 사용자의 비밀번호 변경 불가
    	Opner 페이지를 loginForm.jsp 페이지 이동. 
    	현재 페이지 닫기 -> opener 상대편에 있는 윈도우 객체.location? 
    2. pass, chgpass 파라미터값 저장 
    3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 
    	비밀번호 오류 메시지 출력. passwordForm.jsp 페이지 이동
    4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 
    	비밀번호 수정. opner 페이지를 updateForm.jsp 페이지 이동
    	현재 페이지 닫기 
     --%>    
    
<%
String login = (String) session.getAttribute("login");
MemberDao m = new MemberDao();
Member dao = m.selectOne(login);
String dbpass = dao.getPass(); // 로그인한 아이디에 맞는 비밀번호 db에서 조회
String pass = request.getParameter("beforepass"); // 사용자가 입력한비밀번호

String afterpass = request.getParameter("afterpass");
//System.out.println("dbpass : "+dbpass+", pass : "+pass);

String msg = null;
String url = null;
boolean closer = false;
boolean opener = false;
if(login == null || login.trim().equals("")){
	msg = "로그인하세요.";
	url = "loginForm.jsp";
	closer = true;
	opener = true;
}else{
	if(dbpass.equals(pass)){
		int result = m.updatePw(login, afterpass); //수정할 비밀번호와 id전달.
		if(result >0){
			msg = "비밀번호가 수정되었습니다.";
			url = "updateForm.jsp?id="+login;
			closer = true;
			opener = true;
		}else{
			msg = "비밀번호 수정중 오류 발생";
			url = "passwordForm.jsp";
		}
	}else{
		System.out.println(closer+":"+opener);
		msg = "비밀번호가 틀렸습니다.";
		url = "passwordForm.jsp";
	}
}


%>    
<script>
<%-- opner true 면 큰 화면으로 나타나게 하고 opner false
면 자식 창에 그대로 뜨게함--%>
	alert("<%=msg%>");  
	<%if(opener){ %>
		opener.location.href="<%=url %>";
	<%}else {%>
		location.href="<%=url%>";
	<%}%>
	<%if(closer){ %>
		self.close();
	<%} %>
</script>