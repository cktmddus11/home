<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
<style type="text/css">
   .btn { border: 0px solid 맑은 고딕; background-color:gray;
   color:white;  }   
   body { margin: 5px; text-align:center; }
  


</style></head>
<body>
<table cellspacing="0" width="40%" cellpadding="3" align="center" border="1"> 

	<form action="t_uploadAction.jsp" method="post" enctype="multipart/form-data">
	<tr> <td width="35%"> 	파일 </td> <td> <input type="file" name="file">  </td></tr>
	<tr><td colspan="2">	<input class="btn" type="submit" value="업로드"> &nbsp; 
        <input class="btn" type="reset" value="취소" />
         </td></tr>
	</form>
	</table>
</body>
</html>