<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   <% 
 String msg = null;
  String url = null;
  String id = request.getParameter("id");

  Member dao = new MemberDao().selectOne(id);
  String dbpass = dao.getPass();
  
  
  String login = (String)session.getAttribute("login");
  if(login != null) {  // �α��� ����
	  if(!login.equals("admin")){ // �Ϲ� �����
		  if(!login.equals(id)){
			  msg = "���θ� Ż�� �����մϴ�.";
			  url = "main.jsp";
		  }
		 
		  String pass = request.getParameter("pass");
		  if(!pass.equals(dbpass)) { // ��й�ȣ ����ġ
			  msg = "��й�ȣ�� Ʋ���ϴ�.";
		  		url = "deleteForm.jsp?id="+id;
		  	}else{ // ��й�ȣ��ġ
		  		MemberDao mdao = new MemberDao();
		  		int result = mdao.delete(id);
		  		if(result > 0){ // Ż�� ����
		  			msg = "Ż���ϼ̽��ϴ�.";
		  			url = "loginForm.jsp";
		  		}else{ //  Ż�� ���� 
		  			msg = "Ż�� �����ϼ̽��ϴ�.";
		  			url = "info.jsp";
		  		}
		  	}
	  }else{ // ������ // ���� ���� �ٸ� ����� Ż�� �����ϰ� ���֤�������ڵ� Ż�𰡴ɵǰԵ�����
		 if(id.equals("admin")) {
			  msg = "�����ڴ� Ż�� �Ұ����մϴ�.";
			  url = "list.jsp";
		  }
		  MemberDao mdao = new MemberDao();
	  		int result = mdao.delete(id);
	  		if(result > 0){ // Ż�� ����
	  			msg = "Ż���ϼ̽��ϴ�.";
	  			url = "list.jsp";
	  		}else{ // Ż�� ����
	  			msg = "Ż�� �����ϼ̽��ϴ�.";
	  			url = "list.jsp";
	  		}
	  }
  }else{ // �α׾ƿ� ����
	  msg = "�α����ϼ���";
  	  url = "loginForm.jsp";
  }
  %>