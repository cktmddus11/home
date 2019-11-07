<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
  1. 모든 파라미터 Member 객체에 저장
  2. 입력된 비밀번호와 db에 저장된 비밀번호가 같지 않으면
  		"비밀번호가 틀렸습니다". 메시지 출력 후, updateForm.jsp페이지로 이동
  3.  1번에 내용을 db에 수정하기
  		int MemberDao.update(Member) 
  		결과가 0보다 크면 수정성공 메시지 출력. info.jsp 페이지 이동 
  					0 이하면 수정 실패 메시지 출력. main.jsp 페이지 이동
  
   --%>
   <%request.setCharacterEncoding("euc-kr");%>
   <%-- Member mem = new Member(); --%>
   <jsp:useBean id="member" class="model1.Member" />
    <%-- mem.setId(request.getParameter("id")) --%>
   <jsp:setProperty name="member" property="*" />
   <%
   String login = (String)session.getAttribute("login");
   String pass = request.getParameter("pass");
	String id = member.getId();
   // selectOne(id) : 사용자 id에 해당하는 db정보 Member 객체로 리턴
   // dao.getPass() : 변경전 Member 정보 저장
   Member dao = new MemberDao().selectOne(id);
   System.out.println(dao);
   String msg = null;
   String url = null;
   if(!pass.equals(dao.getPass()) && !login.equals("admin") ){ // 순서??
	   // admin이 아니고, 디비랑 입력한 비번 다르면
	  	msg = "비밀번호가 틀렸습니다.";
	   	url = "updateForm.jsp?id="+id;
   }else{ // admin이고, 디비랑 입력한 비번이 같으면
	   int result = new MemberDao().update(member); // 여기 주의 member
	   if(result > 0){
		   msg = "수정성공";
		   url = "info.jsp?id="+id;
	   }else{
		   msg = "수정실패";
		   url = "main.jsp";
	   }
   }
   %>
   <script>
	alert("<%=msg %>");
	location.href="<%=url %>";
   </script>
   