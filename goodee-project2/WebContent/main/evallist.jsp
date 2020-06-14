<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!-- 3. 학과 관련없이 최근 작성된 강의평  -->
<div class="card mb-3" id="evaluation">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 작성된 강의평
		</div>
		<div class="card-body">
			<table class="w3-table-all" style="width: 100%" id="evaltable">
				<thead>
				<tr>
					<th>아이디</th>
					<th>학과명</th>
					<th>과목명</th>
					<th width="166px">강의평</th>
				</tr>
				</thead>
				<tbody>
				</tbody>
				<%-- <c:forEach items="${list2}" var="a" varStatus="status">
					<c:if test="${status.index le 6}">
					<tr>
						<td>${fn:substring(a.mem_id, 0,3)}**</td>
						<td>${a.dept}</td>
						<td><a href="subjectview.do?no=${a.subject_no}">${a.subject}</a></td>
						<td>${fn:substring(a.eval_text, 0, 20)}</td>
					</tr>
					</c:if>
				</c:forEach> --%>
			</table>
		</div>
		<div class="card-footer small text-muted">학교 내의 강의평을 볼수 있습니다</div>
	</div>
	<!-- 간단 성적확인 누르면 성적 상세보기 페이지로 -->