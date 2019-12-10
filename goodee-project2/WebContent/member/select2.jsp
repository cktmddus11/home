<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<tr>
	<td><select name="grade">
			<option value="4.5">A+</option>
			<option value="4.0">A0</option>
			<option value="3.5">B+</option>
			<option value="3.0">B0</option>
			<option value="2.5">C+</option>
			<option value="2.0">C0</option>
			<option value="1.5">D+</option>
			<option value="1.0">D0</option>
			<option value="0.0">F</option>
			<option value="-0.1">P</option>
			<option value="-0.2">NP</option>
	</select></td>

	<td colspan="2"><select name="subject">
			<c:forEach var="info" items="${subjectinfo}">
			<option value="${info.subject_no},${info.credit}">
				강의 : ${info.subject}, 학점  : ${info.credit}, 교수 : ${info.professor}
			</option>
			</c:forEach>
	</select></td>
	<td><input type="submit" name="btn" value="성적 저장"></td>
</tr>