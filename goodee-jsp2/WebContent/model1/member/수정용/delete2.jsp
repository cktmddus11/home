<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
  1. 로그아웃 상태 : 로그인하세요 메시지 출력, loginForm.jsp 페이지 이동
  2. 	로그인 상태 
  		- 관리자가 아니고, id와 login 이 다른 경우 
  				"본인만 탈퇴가 가능합니다." 메시지 출력. main.jsp 페이지로 이동 
  		- id가 관리자인 경우는 
  				"관리자는 탈퇴가 불가능합니다." 메시지 출력. list.jsp 페이지로 이동 
  				
  		- 일반 사용자
  		(1) 아이디, 비밀번호 정보를 파라미터로 전송
  		(2)  비밀번호 불일치 => 입력된 비밀번호와 db의 비밀번호를 검증
  			  		"비밀번호가 틀립니다. 메세지 출력. deleteForm.jsp 페이지 이동
  		- 관리자 
  		(1) 아이디 정보를 파라미터로 전송
  3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db 에서 회원정보 삭제하기
  		삭제성공 : 일반사용자 : 로그아웃 후, 탈퇴메시지 출력. loginForm.jsp로 페이지 이동
  						관리자 : 탈퇴메시지 출력. list.jsp
  		삭제 실패 : 일반사용자 : 삭제실패 메시지 출력. info.jsp 페이지 이동. 
  						관리자 : 삭제 실패 메세지 출력. list.jsp 페이지 이동
  
  
   --%>
   <% 
 String msg = null;
  String url = null;
  String id = request.getParameter("id");

  Member dao = new MemberDao().selectOne(id);
  String dbpass = dao.getPass();
  
  
  String login = (String)session.getAttribute("login");
  if(login != null) {  // 로그인 상태
	  if(!login.equals("admin")){ // 일반 사용자
		  if(!login.equals(id)){
			  msg = "본인만 탈퇴가 가능합니다.";
			  url = "main.jsp";
		  }
		 
		  String pass = request.getParameter("pass");
		  if(!pass.equals(dbpass)) { // 비밀번호 불일치
			  msg = "비밀번호가 틀립니다.";
		  		url = "deleteForm.jsp?id="+id;
		  	}else{ // 비밀번호일치
		  		MemberDao mdao = new MemberDao();
		  		int result = mdao.delete(id);
		  		if(result > 0){ // 탈퇴 성공
		  			msg = "탈퇴하셨습니다.";
		  			url = "loginForm.jsp";
		  		}else{ //  탈퇴 실패 
		  			msg = "탈퇴에 실패하셨습니다.";
		  			url = "info.jsp";
		  		}
		  	}
	  }else{ // 관리자 // 내꺼 남이 다른 사용자 탈퇴 가능하게 되있ㄷ고관리자도 탈퇴가능되게되있음
		 if(id.equals("admin")) {
			  msg = "관리자는 탈퇴가 불가능합니다.";
			  url = "list.jsp";
		  }
		  MemberDao mdao = new MemberDao();
	  		int result = mdao.delete(id);
	  		if(result > 0){ // 탈퇴 성공
	  			msg = "탈퇴하셨습니다.";
	  			url = "list.jsp";
	  		}else{ // 탈퇴 실패
	  			msg = "탈퇴에 실패하셨습니다.";
	  			url = "list.jsp";
	  		}
	  }
  }else{ // 로그아웃 상태
	  msg = "로그인하세요";
  	  url = "loginForm.jsp";
  }
  %>