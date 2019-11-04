<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel ="stylesheet" type="text/css" href="../resources/css/table.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script language="javascript"> 
 function check(){
	 var myform = document.myform;
  if(!myform.building.value){
	  alert("건물명을 입력해 주세요.");
	  myform.building.focus();
	  return;
  }
  if(!myform.dept.value){
	  alert("학과명을 입력해 주세요.");
	  myform.dept.focus();
	  return;
  }
  if(!myform.layer.value){
	  alert("층 수를 입력해 주세요.");
	  myform.layer.focus();
	  return;
  }
  if(!myform.lecturenum.value){
	  alert("호 수를 입력해 주세요.");
	  myform.lecturenum.focus();
	  return;
  }
  if(!myform.yoil.value){
	  alert("요일을 입력해 주세요.");
	  myform.yoil.focus();
	  return;
  }
  if(!myform.lecturename.value){
	  alert("강의명을 입력해 주세요.");
	  myform.lecturename.focus();
	  return;
  }
  if(!myform.professor.value){
	  alert("교수님 성함을 입력해 주세요.");
	  myform.professor.focus();
	  return;
  }
  if(!myform.start.value){
	  alert("시작시간을 입력해 주세요.");
	  myform.start.focus();
	  return;
  }
  if(!myform.end.value){
	  alert("종료시간을 입력해 주세요.");
	  myform.end.focus();
	  return;
  }
    myform.submit();
}
</script> 
<style>
th{
background-color : #faf9fa;
}
.boardcss_list_table{
width:90%;
} 
.list_table{
padding-left:12%;
}
.list_table input{
width:88%;
}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   	   <script>
   	      $(function(){
   	      	var pull=$('#pull');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pull).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('part');}   });
   	   	  });
   	   
 </script>
<link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
 <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
%> 
</head>
<body>
<jsp:include page="<%=contentPage2 %>" />	
<div id="funclog">
  <div class="boardcss_list_table">
    <form name="myform" id="myform" method="post" action="m_Insert.jsp">
    <!-- <form name="form1" method="post" action="insert_pstmt.jsp"> -->
       	<table class="list_table" style="height:412px;">
            <tr>
                <th>건물명: </th>
                <td><input type="text" placeholder="건물명을 입력하세요. "  name="building" class="form-control"/></td>
            </tr>
          <tr>
                <th>학과명: </th>
                <td><input type="text" placeholder="학과을 입력하세요. " name="dept" class="form-control"></td>
            </tr>
             <tr>
                <th>층수: </th>
                <td><input type="text" placeholder="층수을 입력하세요. " name="layer" class="form-control" ></td>
            </tr>
            <tr>
                <th>강의실 호수: </th>
                <td><input type="text" placeholder="강의실 호수를 입력하세요. " name="lecturenum" class="form-control"/></td>
            </tr>
            <tr>
            	<th>요 일 : </th>
            	 <td><input type="text" placeholder="요일을 입력하세요. " name="yoil" class="form-control"/></td>
            </tr>
			<tr>
                <th>강의명: </th>
                <td><input type="text" placeholder="강의명을 입력하세요." name="lecturename"  class="form-control"/></td>
            </tr>
            <tr>
                <th>교수님: </th>
                <td><input type="text" placeholder="교수님 성함을 입력하세요." name="professor" class="form-control"/></td>
            </tr>
            <tr>
                <th>시작시간: </th>
                <td><input type="text" placeholder="시작시간을 입력하세요." name="start" class="form-control"/></td>
            </tr>
			<tr>
                <th>종료시간: </th>
                <td><input type="text" placeholder="종료시간을 입력하세요." name="end" class="form-control"/></td>
            </tr> 
        </table>       
    </form>
    <input type="button" value="등록" id="insert" OnClick="javascript:check();">
        	<input type=button value="취소" OnClick="javascript:history.back(-1)">
    </div>
</body>
</html>