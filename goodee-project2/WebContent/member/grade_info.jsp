<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var= "gs" value="${requestScope.list2}"/>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<input type="hidden" name="semester2" value="${requestScope.semester2}">
<table id="change" class="w3-table-all">
				<tr>
					<td colspan="5" style="text-align : right">�̼����� : ${gs[0].sum_credit}
					 &nbsp;&nbsp;&nbsp; ${gs[0].grade_avg}/4.5</td>
				</tr>	
				<tr>
					<td>����</td>
					<td>����</td>
					<td>����</td>
			<%-- 	<c:if test="${path ne 'member/gradeview'}">
					<td>����</td>
				</c:if>	 --%>
					<td>����</td>
				
				</tr>
				<c:if test="${empty gradeInfo}">
					<tr>
						<td colspan="4">���� ������ �߰����ּ���</td>
					</tr>
				</c:if>
				<c:if test="${!empty gradeInfo}">
				<c:forEach var = "list" items="${gradeInfo}">
				<tr>
					<input type="hidden" value="${list.subject_no}" name="subject_no">
					<td><c:if test="${list.grade eq 4.5}">A+</c:if><c:if test="${list.grade eq 4.0}">A0</c:if><c:if test="${list.grade eq 3.5}">B+
						</c:if><c:if test="${list.grade eq 3.0}">B0
						</c:if><c:if test="${list.grade eq 2.5}">C+
						</c:if><c:if test="${list.grade eq 2.0}">C0
						</c:if><c:if test="${list.grade eq 1.5}">D+
						</c:if><c:if test="${list.grade eq 1.0}">D0
						</c:if><c:if test="${list.grade eq 0.0}">F
						</c:if><c:if test="${list.grade eq -0.1}">P
						</c:if><c:if test="${list.grade eq -0.2}">NP
						</c:if>
					</td>
					<td>${list.subject}</td>
					<td>${list.credit}</td>
				<%-- 	<c:if test="${!path ne 'member/gradeview'}">
					<td><a href="#" onclick="gradeupdate()">����</a></td>
					</c:if> --%>
					<td>
					<a href="#" onclick="deletegrade()"><i class="fas fa-trash-alt"></i></a>
					</td>
				</tr>
				</c:forEach>
				</c:if>
			</table>