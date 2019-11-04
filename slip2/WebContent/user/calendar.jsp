<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.Date" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*" %>
<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
System.out.println("year : "+strYear);
String strMonth = request.getParameter("month");
System.out.println("month : "+strMonth);
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
  
}else{
	System.out.println("오늘");
}
// 년도/월 셋팅
cal.set(year, month, 1); // 년, 월 은 현재 반영, 1은 시작으로 초기화

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); // 14일 
int start = cal.get(java.util.Calendar.DAY_OF_WEEK); 
// 요일 번호 일 1, 월 2~토7 -> day_of_week:요일 번호출력 2019년 04월01일 월요일 2출력
//System.out.println("시작 "+start);
int newLine = 0;

// 오늘 날짜 저장
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));


%>

<html lang="ko">
<head>
	<title>캘린더</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	 <!-- <link rel ="stylesheet" type="text/css" href="./style.css"> -->
</head>
<body>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content" style="width:auto; height:auto; overflow-x:auto">
			<table> <!-- 오늘 버튼 있는 테이블 -->
			<tr>
				<td align="right">
				<input type="button" onclick="javascript:location.href='/slip2/user/calpage.jsp'" value="오늘"/>
				</td>
			</tr>
			</table> <!-- 오늘 버튼 있는 테이블 끝 -->
			
	<!-- 날짜 이동 테이블 -->
	<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
		<tr>
		<td height="60">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10"></td>
			</tr>	
					
			<tr>
			<td align="center"> <!-- <.%  year-1  여기 사이에 공백잇으면 오류남 %> -->
				<a href="calpage.jsp?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
				<b>&lt;&lt;</b><!-- 이전해   &lt : < --> 
				</a>
				<%if(month > 0){ %> <!-- month 가 0이면 -> 1월인듯 -> 2월이상이면 이전달로 돌아갈수 있음 -->
				<a href="calpage.jsp?year=<%=year%>&amp;month=<%=month-1 %>" target="_self">
				<b>&lt;</b> <!-- 이전달  -->
				</a>
				<%} else {%> <!-- 1월이면 이전달로 돌아갈거 없으니까 a태그 없 -->
					<b>&lt;</b>
				<%} %>
				&nbsp;&nbsp;
				<%=year %>년
				
				<%=month+1 %>월
				&nbsp; &nbsp;
				<%if(month<11){ %> <!-- 0~10 -> 1월부터11월이면 다음 달로 넘어갈 수 있음 -->
				<a href="calpage.jsp?year=<%=year%>&amp;month=<%=month+1 %>" target="_self">
					<!-- 다음달 --><b>&gt;</b>
				</a>
				<%}else{%> <!-- month 11이상이면 -> 12월이상이면 다음 달로 넘어가지 않음 -->
				<b>&gt;</b>
				<%} %>
				<a href="calpage.jsp?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
					<!-- 다음해 --><b>&gt;&gt;</b>
				</a>
			</td>
		</tr>
		</table>

		</td>
	</tr>
	</table>
	<!-- 날짜 이동 테이블 -->
	<br>
	<!--  달력 테이블 -->
	<div class="col-sm-12">
	<table class="table table-bordered dataTable no-footer" id="dataTable" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
		<thed>
			<tr role="row" bgcolor="CECECE">
				<td width='100px'>
				<div align="center"><font color="red">일</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="black">월</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="black">화</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="black">수</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="black">목</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="black">금</font></div>
				</td>
				<td width='100px'>
				<div align="center"><font color="#529dbc">토</font></div>
				</td>
			</tr>
		</thed>
		
		<tbody>
		<tr>
		<%
			// 처음 빈 공란 표시
			for(int index = 1; index < start; index++){ // start == 2
				out.println("<td>&nbsp;</td>");	 // 한칸 공백 후 1일 시작 
				newLine++;
				//System.out.println("newLine : "+newLine);
			}
			for(int index = 1; index <= endDay; index++){ // endDay 마지막 일 
				String color = "";
				
				if(newLine==0){
					color="RED";
				}else if(newLine==6){
					color="#529dbc";
				}else{ // 달력 기본 5줄 나오니까 그거 검은색으로 설정인듯
					color="BLACK";
				}
				String sUseDate = Integer.toString(year);
				//System.out.println(sUseDate); 2019 30번출력
				sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
				//System.out.println(sUseDate); 201904 30번출력 -> 1월 ~ 9월 : 월이 한자리 수이면 앞에 0붙이고 4연결 -> 04월 /10월~12월 그냥 출력
				// Integer.toString() : string형 int형으로 변환
				sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
				// index 몇 일 
				
				
				int iUseDate = Integer.parseInt(sUseDate); // 년,월,일 붙어서 출력
				//System.out.println(iUseDate);
				
				String backColor = "#EFEFEF"; // 기본 배경 색 
				if(iUseDate == intToday){ //오늘날짜 배경 바꿈
					backColor = "#c9c9c9c9";
				}
				// 달력 칸 생성(열 생성)
				out.println("<td style='cursor:pointer' onclick=location.href='calpage.jsp?date="+iUseDate+"' valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
				%>
				<font color='<%=color %>'>
					<a href="insert_form.jsp?date=<%=iUseDate%>"><%=index %></a> <!--  일 출력, 색 적용 -->
				</font>
				<% 
				//out.println("<br>");
				//out.println("<a href="+"insert_form.jsp?date="+iUseDate+">"+iUseDate+"</a>"); // 칸마다 날짜 출력 
				%>
				
				<%
				//out.println("<br>"); 
				
				// 일정 내용 출력
				%>
				<%
request.setCharacterEncoding("utf-8");

Connection conn = null;
//PreparedStatement pstmt = null;
Statement stmt = null;
ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver");

try{
	int no;
	String task;
	String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
	String user = "root";
	String pass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, user, pass);
	stmt = conn.createStatement();
	String sql = "select sch_no,task from calendar_view where id="+session.getAttribute("sessionID")+" and date="+iUseDate;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		no = rs.getInt(1);
		task = rs.getString(2);
		if(task.length()>3){
		%>
		<li><a href="update_form.jsp?date=<%=iUseDate %>&no=<%= no%>"><%=task.substring(0, 4)+".." %></a>
		<% 
		}else{%>
			<li><a href="update_form.jsp?date=<%=iUseDate %>&no=<%= no%>"><%=task %></a>
	<%	}
	}
	
	
}finally{
	if(rs != null) try{ rs.close();}catch(SQLException ex){ System.out.println(ex);}
	if(stmt != null) try{ stmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(conn != null) try{ conn.close();}catch(SQLException ex){ System.out.println(ex);}
}
%>
				<%				
				
				//기능 제거	
				out.println("</td>");
				newLine++;

				if(newLine == 7)
				{
				  out.println("</tr>");
				  if(index <= endDay)
				  {
				    out.println("<tr>");
				  }
				  newLine=0;
				}
			}
			//마지막 공란 LOOP
			while(newLine > 0 && newLine < 7)
			{
			  out.println("<tr>&nbsp;</tr>");
			  newLine++;
			}
			%>
		</tr>
		</tbody>
	</table>
	<!--  달력 테이블 -->	
	</div>		
	</div>
	
	</form>
	


</body>
</html>