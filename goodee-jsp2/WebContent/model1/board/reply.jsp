<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. �Ķ���� ���� Board ��ü�� �����ϱ� => useBean �±� ���
	���� ���� : num, grp, grplevel, grpstep
	��� ���� : name, pass, subject, content => ��� ����
2. ���� grp ���� ����ϴ� �Խù����� grpstep���� 1�����ϱ� 
3. Board ��ü�� db�� insert�ϱ�
  		num : maxnum + 1
  		grp : ���۰� ����
  		grplevel : ���� + 1
 4. ��� ������ : "�亯 ��� �Ϸ�" �޽��� ����� list.jsp �� ������ �̵�
 	��� ���н� : "�亯 ��Ͻ� ���� �߻�" �޽��� �����, replyForm.jsp�� ������ �̵�
 --%>
 <%
 // 1. �Ķ���� ���� Board��ü�� �����ϱ�
 request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="b" class = "model1.Board"/>
<jsp:setProperty name="b" property="*"/>
<%
System.out.println(b);
BoardDao dao = new BoardDao();
// 2. ���� grp���� ����ϴ� �Խù��� grpstep���� 1��������
dao.getStepAdd(b.getGrp(), b.getGrpstep());
System.out.println(b);
// 3. Board ��ü�� db�� insert�ϱ�
int grplevel = b.getGrplevel();
int grpstep = b.getGrpstep();
int num = dao.maxnum(); 
String msg = "�亯 ��Ͻ� �����߻�";
String url = "replyForm.jsp?num="+b.getNum();
b.setNum(++num);
b.setGrplevel(grplevel+1);
b.setGrpstep(grpstep + 1); // ����grpstep + 1 -> �ڱ�� ���� �ٷ� �Ʒ��� �޶��
System.out.println(b);
if(dao.insert(b)){
	msg ="�亯 ��� �Ϸ�";
	url = "list.jsp";
}

%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>