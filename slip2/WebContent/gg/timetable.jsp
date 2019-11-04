<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<title>Insert title here</title>
 <!-- 하단 시간표를 클릭할 때, 상단 테이블에 해당되는 위치에 과목명 출력하는 JQuery  -->
 <script>
 $(document).ready(function(){
      $("#select tr").click(function(){
         
        /* 현재 클릭된 Row(<tr>) */
        var tr = $(this);
        var td = tr.children();
        /* td의 세번째 값(과목명) 데이터를 q에 저장 */
        var q=td.eq(3).text();  
        
       /* 시작시간,종료시간 저장할 변수 */  
       var s_time=new Array();
       var e_time=new Array();
       /* 표 병합에 사용할 변수  
          cnt:rowspan개수를 저장할 변수 
          test_r:병합 tr시작 부분
          test_d:병합 td시작 부분
        */
       var cnt=0;
       var test_r;
       var test_d;
       
       s_time=[90000,105000,133500,152000];
       e_time=[104500,123500,151500,171000];
       
      /* 표 가로 세로만큼 이중 for문 */
        for(var i=0;i<6;i++){   
           /* td결정(요일과 비교) */
             if((i+2) == td.eq(4).text()){
              for(var j=0; j<6; j++){
            	  /* 클릭한 시작시간, 종료시간과 s_time,e_time과 비교하여 둘 중 하나라도 동일하면 해당 칸에 과목명을 삽입 */
                  if( s_time[j] == td.eq(6).text() || e_time[j] == td.eq(7).text()) {
                    $('#test tr:eq('+ (j+1) +') > td:eq('+ (i+1) +')').html(q);
                    /* 동일한 과목명 테이블 갯수 */
                    cnt++;
                   
                    if(cnt==1){ 
                       test_d = i+1; 
                       test_r = j+1;
                     }
                  }
                } 
             }
          }     
        $(".first").each(function(){
        	var rows = $(".first:contains('" + $(this).text() + "')");
        	//alert(rows);
        	if (rows.length > 1) {
        	    rows.eq(1).attr("rowspan", rows.length);
        	    rows.not(":eq(0)").remove();
        	  }
        });
        
        $(".second").each(function(){
        	var rows = $(".second:contains('" + $(this).text() + "')");
        	//alert(rows);
        	if (rows.length > 1) {
        	    rows.eq(1).attr("rowspan", rows.length);
        	    rows.not(":eq(0)").remove();
        	  }
        });
      	
   });
      
      
      
  });
</script>
 
</head>
<body>
<!-- for문으로 테이블 생성 -->
<table id="test" border="1"> 
 <thead>
    <tr>
     <th>시간</th>
     <th>Mon</th>
     <th>Tue</th>
     <th>Wed</th>
     <th>thus</th>
     <th>Fri</th>
    </tr>
 </thead>
 <tbody>
    <tr id="1">
    	<td>1</td>
    	<td id="first" class="first"></td>
    	<td id="second" class="second"></td>
    	<td id="3"></td>
    	<td id="4"></td>
    	<td id="5"></td>
    </tr>
    <tr id="2">
    	<td>2</td>
    	<td id="first" class="first"></td>
    	<td id="second" class="second"></td>
    	<td id="3"></td>
    	<td id="4"></td>
    	<td id="5"></td>

    </tr>
    <tr id="3">
    	<td>3</td>
    	<td id="1"></td>
    	<td id="2"></td>
    	<td id="3"></td>
    	<td id="4"></td>
    	<td id="5"></td>

    </tr>
    <tr id="4">
    	<td>4</td>
    	<td id="1"></td>
    	<td id="2"></td>
    	<td id="3"></td>
    	<td id="4"></td>
    	<td id="5"></td>

    </tr>
    <tr id="5">
    	<td>5</td>
    	<td id="1"></td>
    	<td id="2"></td>
    	<td id="3"></td>
    	<td id="4"></td>
    	<td id="5"></td>
    </tr>
    
  </tbody>
 </table>
 
    <table id="select" border="2" cellspacing="1" width="50%">
    <thead>
       <tr>
            <td> no</td>
            <td> 강의실</td>
         <td> 과목코트 </td>
         <td> 과목명 </td>
         <td> 요일 </td>
         <td> 교수 </td>
         <td> 시작시간 </td>
         <td> 종료시간 </td>
        </tr>
   </thead>
   <tbody>
<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
 try{
    int no,sub_no,sub_day,start,end;
    String subject,professor,lecture;
    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8","root","1234"); 
   if(conn==null){
   throw new Exception("데이터베이스 연결 실패");  }

   pstmt = conn.prepareStatement("select *from sub");
   rs = pstmt.executeQuery();
   
   while(rs.next()){
   
   no=rs.getInt("no");
   lecture=rs.getString("lecture");
   sub_no=rs.getInt("sub_no");
   subject=rs.getString("subject");
   sub_day=rs.getInt("sub_day");
   professor=rs.getString("professor");
   start=rs.getInt("start");
   end=rs.getInt("end");
  
         
 %>

     <tr>
       <td> <%=no %></td>
      <td> <%=lecture  %></td>
      <td> <%=sub_no %></td>
      <td> <%=subject %></td>
      <td> <%=sub_day  %></td>
      <td> <%=professor  %></td>
      <td> <%=start %></td>
      <td> <%=end %></td>
     </tr>
      <%
      }
        rs.close();
        pstmt.close();
        conn.close();
        %>
        </tbody>
        </table> 

     <%
      }catch(Exception e){
        out.println(e);
      }
        %>
        
        
</body>
</html>