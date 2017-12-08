<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
 <%
   Calendar cal =Calendar.getInstance();
  int nowYear = cal.get(Calendar.YEAR);
  int nowMonth = cal.get(Calendar.MONTH)+1; // +1
  int nowDay = cal.get(Calendar.DAY_OF_MONTH);
  request.setCharacterEncoding( "utf-8");
  String strYear = request.getParameter( "year");
  String strMonth = request.getParameter( "month");
 
    int year = nowYear; // 현재의 년을 받아옴.
    int month = nowMonth; // 현재의 월을 받아옴.
    if(strYear != null)
    {
     year = Integer.parseInt(strYear); 
    }
  
    if(strMonth != null)
    {
     month = Integer.parseInt(strMonth);
    }
   
    cal.set(year,month-1,1);
    int startDay = 1;
   
    int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int week = cal.get(Calendar.DAY_OF_WEEK);
   
%>



<script type="text/javascript">
function window_onload()
 {
    for ( i=2016;i<=2020 ; i++)
   {
        var op= new Option(i+ "년",i);
         syear.options[i -2016]=op; 
         if(i== <%=year %> )
         {
            syear.options[i -2016].selected ="selected" ;
         }
   }
     for ( i=1;i<=12 ; i++)
     {
        var op= new Option(i+ "월",i);
         smonth.options[i -1]=op;
         if(i== <%=month %>)
         {
             smonth.options[i -1].selected = "selected";
         }
     }
 }
function month_onchange()
{   
     var month = smonth.value;
     var year = syear.value;
     var addr = "scheduler.do?year=" + year +"&month=" + month;
    // alert(addr);
    //addr 이 가지는 주소값으로  페이지를 이동시킨다.       
   location.href = addr;
   
}
function year_onchange()
{
     var year = syear.value;
     var month = smonth.value;
     var addr = "scheduler.do?year=" + year +"&month=" + month;
    
        location.href = addr;
    
}

</script>
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li class="active"><a href="#"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>Today Scheduler</span></a></li>
                <li><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>Personal Scheduler</span></a></li>
                <li><a href="#"><i class="fa fa-hdd-o"></i>&nbsp;<span>Team Scheduler</span></a></li>
                <!-- <li><a href="#"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
                <li><a href="#"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
                <li><a href="#"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li> -->
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-calendar-check-o" aria-hidden="true"></i></i>&nbsp;스케쥴관리&nbsp;<a href="#">
        <i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
       <!--  <input type="button" value="버튼">
        <input type="submit" value="제출">
        <input type="reset" value="리셋">
        <a href="#" class="button">a태그버튼</a> -->
       
 <body onload ="window_onload()" >
    <table align = "center" cellspacing= "1" cellpadding= "2" bgcolor ="#e6f6e6" >
  <tr >
   <td width="1200" colspan = "7" style=" color: blue; border: solid 1px red;" >
   <b>&nbsp;
   <select id = "syear" onchange= "year_onchange()" >
    <option ></option >
    </select ></b>
    <b>&nbsp;
    <select   id= "smonth" onchange= "month_onchange()"  >
     <option ></option >
    </select ></b>
   </td>
  </table >
  
  <table align = "center" cellspacing= "1" cellpadding= "2" bgcolor ="#cccccc" >
   <tr >
     <td bgcolor = "skyblue" width="100" height="50" style=" color: red; font-weight: bold;" > SunDay</td >
     <td bgcolor = "skyblue" width="100" height="50" style="font-weight: bold;"> MunDay </td >
     <td bgcolor = "skyblue" width="100" height="50" style="font-weight: bold;"> TuesDay </td >
     <td bgcolor = "skyblue" width="100" height="50" style="font-weight: bold;"> WednesDay </td >
     <td bgcolor = "skyblue" width="100" height="50" style="font-weight: bold;"> ThursDay </td >
     <td bgcolor = "skyblue" width="100" height="50" style="font-weight: bold;"> FriDay </td >
     <td bgcolor = "skyblue" width="100" height="50" style=" color: blue; font-weight: bold;" > SaturDay  </td>
    
   </tr >
   <%
      int newLine=0;
      %><tr>
     
     <%for(int i=1; i<week; i++)
      {%>
       <td width='170' height='100' bgcolor='#ffffff'>&nbsp;</td>
       <%newLine++;
      }
     
      for(int i=startDay; i<=endDay; i++)
      {
       String fontColor=(newLine==0)?
                "red":(newLine==6)? "blue": "black";
       String bgColor=(nowYear==year)&&(nowMonth==month)
                &&(nowDay==i)? " #e6e4e6": "#ffffff";
       out.print( "<td width='170' height='100' bgcolor="+bgColor+ "><font color="+fontColor+ ">"+i+ "</font></td>" );
      newLine++;
     
           if(newLine ==7 &&i!=endDay)
           {
            out.print( "</tr><tr>" );
            newLine=0;
           }
      }
     while(newLine>0 && newLine<7)
     {
      out.print( "<td width='170' height='100' bgcolor='#ffffff'>&nbsp;</td>");
      newLine++;
     }
    %></tr>
  
   
  </table >



        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(4) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>