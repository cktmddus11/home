<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!-- 3. �а� ���þ��� �ֱ� �ۼ��� ������  -->
<div class="card mb-3" id="evaluation">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> �ۼ��� ������
		</div>
		<div class="card-body">
			<table class="w3-table-all" style="width: 100%" id="evaltable">
				<thead>
				<tr>
					<th>���̵�</th>
					<th>�а���</th>
					<th>�����</th>
					<th width="166px">������</th>
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
		<div class="card-footer small text-muted">�б� ���� �������� ���� �ֽ��ϴ�</div>
	</div>
	<!-- ���� ����Ȯ�� ������ ���� �󼼺��� �������� -->