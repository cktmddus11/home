<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- ����ȭ�� �����Խ��� -->
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> <a href="${path}/board/list.do1">�����Խ���</a>
		</div>
		<div class="card-body">
				<table class="w3-table-all" id="boardtable">
				<thead>
				<tr>
					<td>�ۼ���</td>
					<td>����</td>
					<td>��õ��</td>
					<td>��ȸ��</td>
				
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
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>