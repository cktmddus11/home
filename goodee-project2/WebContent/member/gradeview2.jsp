<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>	
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<div class="card mb-3" id="grade">
		<div class="card-header">
			<i class="fas fa-chart-area"></i>���� ��Ȳ
		</div>
		<div class="card-body">
			<form method="post" name="scoreform" action="scoreupdate.do">
			 <h3>�� ������� : ${list[0].grade_avg}/4.5</h3>
			 <h3>�� �̼� ���� : ${list[0].sum_credit}/${sessionScope.mem.score}</h3>
			<i class="fas fa-cog" style="padding-left : 90%" id="setting"></i>
			<div id="scoresetting" style="display:none">	
			<input type='text' name='score2' value="${sessionScope.mem.score}">&nbsp;&nbsp;
        	<input type="submit" value="�������� ����">
        
			</div>
			</form>
		</div>
		<div class="card-footer small text-muted">������ ���� �󼼺���� �̵�</div>
	</div>		