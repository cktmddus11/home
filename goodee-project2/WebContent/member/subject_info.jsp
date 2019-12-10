<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="change" class="w3-table-all">
	<tr>
		<td>수업</td>
		<td>강의평 작성</td>
	</tr>
	<c:if test="${!empty gradeInfo}">
		<c:forEach var="list" items="${gradeInfo}">
			<tr>
				<input type="hidden" value="${list.subject_no}">
				<td><a href="subjectview.do?no=${list.subject_no}">${list.subject}</a></td>
				<td><button id="btn2"onclick="return writeform2click(${list.subject_no})">강의평
						작성</button></td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty gradeInfo}">
		<tr>
			<td colspan="2">강의평을 작성하려면 학점계산기-성적관리에서 수업를 등록해야합니다</td>
		</tr>
	</c:if>
</table>