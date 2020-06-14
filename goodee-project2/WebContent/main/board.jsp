<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- 메인화면 자유게시판 -->
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> <a href="${path}/board/list.do1">자유게시판</a>
		</div>
		<div class="card-body">
				<table class="w3-table-all" id="boardtable">
				<thead>
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>추천수</th>
					<th>조회수</th>
				
				</tr>
				</thead>
				<tbody>
					
				</tbody>
				
				<%-- <c:forEach var="board" items="${list3}" varStatus="status">
				<c:if test="${status.index le 6}">
				<tr> 
					<td><i class="fab fa-hotjar"></i>&nbsp;${board.nickname}</td>
					<td><a href="${path}/board/info.do1?num=${board.num}">${board.title}</a></td>
					<td>${board.up}</td>
					<td>${board.readcnt}</td>
				</tr>
				</c:if>
				</c:forEach> --%>
				</table>
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>