<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel ="stylesheet" type="text/css" href="../resources/css/table.css?ver=1"> 
 <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css"> 
  <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="u_menubar.jsp";
%> 
 <%
 
   String contentPage=request.getParameter("contentPage");
   if( contentPage ==null)
         contentPage="u_Detail_search_form.jsp";
%> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   	   <script>
   	      $(function(){
   	      	var pull=$('#pull');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pull).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('part');}   });
   	   	  });
   	   
 </script>
</head>
<body>
<jsp:include page="<%=contentPage2 %>" />	
<div id="funclog">
	  <div class="boardcss_list_table">
	  	<table class="list_table">
	  	<caption></caption>
      	<colgroup>
      		<col width="5%" />
			<col width="5%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
      	</colgroup>
      	<thead>
         <tr>
            	<th>번호</th>
				<th>요일</th>
				<th>강의명</th>
				<th>교 수</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>사용여부</th>
		</tr>
		</thead>	
<% 
Calendar cal = Calendar.getInstance(Locale.KOREA); 
SimpleDateFormat t = new SimpleDateFormat("yyyyMMdd");
int y= cal.get(Calendar.YEAR);
int M= cal.get(Calendar.MONTH);
int d= cal.get(Calendar.DATE);
cal.set(y,M,d);
 int daynum = cal.get(Calendar.DAY_OF_WEEK);
 
 java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("HHmmss"); 
 String now=formatter.format(new java.util.Date());
  //out.println(daynum);
 //out.println (now); // 현재 시간
 /*
  switch(daynum){ // daynum 요일 번호
  case 1:
 	 out.println("일");
 	 break;
  case 2:
 	 out.println("월");
 	 break;
  case 3:
 	 out.println("화");
 	 break;
  case 4:
 	 out.println("수");
 	 break;
  case 5:
 	 out.println("목");
 	 break;
  case 6:
 	 out.println("금");
 	 break;
  case 7:
 	 out.println("토");
 	 break;
  }*/
Connection conn = null;
PreparedStatement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs0 = null;
ResultSet rs = null;
  
 try{
    int id;
    String yoil, confirm, lecturename, professor, start, end;
    
    
    int datacount=0; 
    int pagecount;

    String num= request.getParameter("num"); 
    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8","root","1234"); 
   if(conn==null){
   throw new Exception("데이터베이스 연결 실패");  }
   
   stmt = conn.prepareStatement("select count(id) from test where lecturenum='"+num+"'");
   rs0 = stmt.executeQuery();


     if(rs0.next()){
       datacount=rs0.getInt(1);
       rs0.close(); 
     }
     
    int pagesize=10; 
    pagecount = datacount/(pagesize+1)+1; 
    int mypage=1; 
    int abpage=1; 
   
    if(request.getParameter("mypage") !=null){
       mypage = Integer.parseInt(request.getParameter("mypage")); 
       abpage = (mypage-1)*pagesize;
       if(abpage<=0) abpage=1; 
        }
      
        pstmt = conn.prepareStatement("select id, yoil, lecturename, professor, str_to_date(start, '%H%i%s'), str_to_date(end, '%H%i%s'), start, end from test where lecturenum='"+num+"' order by id desc" );
        rs = pstmt.executeQuery();
        
        if(!rs.next()){
            pagesize=0; 
         } else{
            rs.absolute(abpage); 
         } 
       
        for(int k=1; k<=pagesize; k++) {
        	 id = rs.getInt("id");
             yoil = rs.getString("yoil");
             lecturename = rs.getString("lecturename");
             professor=rs.getString("professor");
             String start1 = rs.getString("str_to_date(start, '%H%i%s')");
             String end1 = rs.getString("str_to_date(end, '%H%i%s')");
             start = rs.getString("start");
             end = rs.getString("end");
          
            
        /* out.println("건물:"+building+"학과:"+dept+"강의실:"+lecturenum+"강의명"+lecturename+"시작시간:"+start+"종료시간"+end); */
         %>
         <% 
         
         int yoil_num=daynum;
        int number = 0;
        int int_start = Integer.parseInt(start);
        int int_now = Integer.parseInt(now);
        int int_end = Integer.parseInt(end);
       
        if(yoil.equals("일")) number = 1;
        else if(yoil.equals("월")) number = 2;
        else if(yoil.equals("화")) number = 3;
        else if(yoil.equals("수")) number = 4;
        else if(yoil.equals("목")) number = 5;
        else if(yoil.equals("금")) number = 6;
        else if(yoil.equals("토"))number = 7;
 
	String color = "#ed6363";
        if(number == yoil_num) {
        		if((int_start <= int_now) && (int_end >= int_now)){
     	   			confirm="y";
        		}
        		else {confirm = "n"; color="#65a965;";}
        }
        else {
     	   confirm = "n";
     	  color="#65a965;";
        }
 %>
        <tbody>
         <tr> 
            	<td> <a href="u_Detail_view.jsp?num=<%=id%>&use=<%=confirm%>"><%=id %></a></td>
				<td> <%=yoil  %></td>
				<td> <%=lecturename %></td>
				<td> <%=professor %></td>
				<td> <%=start1 %></td>
				<td> <%=end1 %></td>
				<td style="background-color : <%=color%>;"> <%=confirm %></td>
         </tr>
      </tbody>
      <% 
      if(rs.getRow()==datacount){
          break; 
        }else{
         rs.next(); 
        }
            }
      
        rs.close();
        conn.close();
        stmt.close();
        pstmt.close();
     
    
     %>
    </table>
    
    <br>
    
    
    <%

       if(pagecount != 1) {
              for(int l=1; l<=pagecount; l++){
       out.println("<a href=user_Detail.jsp?mypage=" + l+ ">"+ l + "|</a>");
         }
      }
      else{
         out.println("1"); 
      }
    } catch(Exception e){
        out.println(e);
    } 

     %>
      <jsp:include page="<%=contentPage%>" />

</div>
 <input type="submit" value="이전 목록" onclick='history.go(-1); return false;' >
</div>
</body>
</html>