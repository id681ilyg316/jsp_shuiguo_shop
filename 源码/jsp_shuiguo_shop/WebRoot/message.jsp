<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="dao.CommDAO"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns=""><HEAD><TITLE>果蔬购物网站</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<script type="text/javascript">
<!--
var timerID = null
var timerRunning = false
function MakeArray(size) {
    this.length = size;
    for(var i = 1; i <= size; i++)
      {
        this[i] = "";
      }
  return this;
}
function stopclock (){
    if(timerRunning)
    clearTimeout(timerID);
    timerRunning = false
}
function showtime (){
  var now = new Date();
  var year = now.getYear();
  var month = now.getMonth() + 1;
  var date = now.getDate();
  var hours = now.getHours();
  var minutes = now.getMinutes();
  var seconds = now.getSeconds();
  var day = now.getDay();
  Day = new MakeArray(7);
  Day[0]="星期天";
  Day[1]="星期一";
  Day[2]="星期二";
  Day[3]="星期三";
  Day[4]="星期四";
  Day[5]="星期五";
  Day[6]="星期六";
  var timeValue = " ";
 timeValue += year + "年";
  timeValue += ((month < 10) ? "0" : "") + month + "月";
  timeValue += date + "日 ";
  timeValue += (Day[day]) + " ";
 // timeValue += (hours < 12) ? "上午 " : "下午 ";
  timeValue +=hours;
  timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
  timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
  var clock = document.getElementById("clock");
  clock.innerText = timeValue;
  timerID = setTimeout("showtime()",1000);
  timerRunning = true
}
function startclock () {
  stopclock();
  showtime()
}
//-->
    
    function myOpen(winurl,winname) {
           objWin__ = window.open( winurl,winname, "scrollbars=no,status=yes,resizable=no,top=0,left=0,width="+(screen.availWidth-10)+",height="+(screen.availHeight-30));
 objWin__ .focus();
 
 return true;
}
 

</script>

<LINK 
href="shop/globle.css" type=text/css rel=stylesheet><LINK 
href="shop/head.css" type=text/css rel=stylesheet><LINK 
href="shop/copyright.css" type=text/css rel=stylesheet>

<META content="MSHTML 6.00.6000.16981" name=GENERATOR>
</HEAD>
<BODY style="overflow: scroll"><LINK href="shop/head.css" 
type=text/css rel=stylesheet>
<SCRIPT src="shop/head.js" type=text/javascript></SCRIPT>


<jsp:include flush="true" page="top.jsp"></jsp:include>

<%
CommDAO dao = new CommDAO();

 %>

<TABLE cellSpacing=0 cellPadding=0 width=950 align=center border=0>
  <TBODY>
  <TR>
   
  </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=762 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=6></TD>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD><LINK href="/shuiguo_shop/shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="/shuiguo_shop/shop/head.css" type=text/css 
            rel=stylesheet><LINK href="/shuiguo_shop/shop/copyright.css" 
            type=text/css rel=stylesheet>
            <SCRIPT src="/shuiguo_shop/shop/engine.js" type=text/javascript></SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/util.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/pro.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/ejproselect.js" 
            type=text/javascript></SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/bwuhan.js" 
type=text/javascript> </SCRIPT>

            <TABLE cellSpacing=0 cellPadding=0 width="100%" 
            background=/shuiguo_shop/shop/02side(1).gif border=0>
              <TBODY>
              <TR>
                <TD height=27 colspan="2" background=/shuiguo_shop/shop/02top(1).gif>
                  <TABLE cellSpacing=0 cellPadding=0 width=730 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD class=titleorange14 align=left width=80>留言信息<br></TD>
                      <TD class=orangelight align=right>&nbsp;</TD>
                    </TR></TBODY></TABLE></TD></TR>
             
             
              <%
             
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 

String sql = "select * from bmessage order by id desc";

int records = dao.select(sql).size();
int pages = 0;
if(records%5==0)pages=records/5;
if(records%5!=0)pages=records/5+1;
if(dpage<1)dpage=1;
if(dpage>pages)dpage=pages;

sql+=" limit "+(dpage-1)*5+","+dpage*5+" ";







List<HashMap> list = dao.select(sql);
				      int i=1;
				      for(HashMap n:list)
				      {
					  
					  
              %>
                           
                           <TR>
                           <TD  >&nbsp;
                              
                         <%=i %>  &nbsp;.&nbsp;  <%=n.get("author")+" &nbsp;("+n.get("savetime")+")&nbsp; 说 : <br /><br /> " %>
                         
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <%=n.get("content")   %></TD></TR>
                          
                           
                           
                           <TR>
                                <TD  height="25">
                                
                                
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <font color="orange">
                                <%=n.get("reback").equals("")?"":"管理员回复 : "+n.get("reback")   %>
                                </font>
                              </TD>
                           </TR>
                             
                           
                    <%
                           i++;
                           }
                            %>
                           
                           
                           <TR>
                           <TD>
                           
                         
                           <TABLE cellSpacing=0 cellPadding=7 width="100%"    border=0>
                           <TBODY>
                           <TR>
                           <TD height="27" align="center"  class=>


共 <%=records %> 条记录
                                
                                &nbsp;&nbsp;
                                
                                当前 <%=dpage %>/<%=pages %> 页
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/message.jsp">首页</a>
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/message.jsp?dpagee=<%=dpage-1 %>">上页</a>
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/message.jsp?dpagee=<%=dpage+1 %>">下页</a>
                                
                                &nbsp;&nbsp;
                                
                                
                                <a href="/shuiguo_shop/message.jsp?dpagee=<%=pages %>">末页</a>



</TD>
                           </TR>
                           </TBODY></TABLE>
                          
                           
                           </TD></TR>
                           
                           

 <TR>
                           <TD>
                           
                           <form action="/shuiguo_shop/servlet/Message" name=f1 >
                           <TABLE cellSpacing=0 cellPadding=7 width="100%"    border=0>
                           <TBODY>
                           <TR>
                           <TD align="center"  class=titleorange14_2> 我来说两句</TD>
                           </TR>
                           <TR>
                           <TD>
                              <TABLE class=gray666 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                               
                                <TR>
                                <TD align="center"><label>
                                  <textarea name="content" id="textarea" cols="45" rows="5"></textarea>
                                </label></TD>
                           </TR>
                           
                           <TR>
                                <TD align="center"><label>
                                <input type="submit" name="button" id="button" value="提交">
                                </label></TD>
                           </TR>
                           </TBODY></TABLE></TD></TR></TBODY></TABLE>
                           </form>
                           
                           </TD></TR>








                           










                           
                           




















             <%
            // }
              %>
             
             
             
             
             
             
             
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD align="center"><LINK href="/shuiguo_shop/shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="/shuiguo_shop/shop/head.css" type=text/css 
            rel=stylesheet><LINK href="/shuiguo_shop/shop/copyright.css" 
            type=text/css rel=stylesheet>
            <SCRIPT src="/shuiguo_shop/shop/engine.js" type=text/javascript></SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/util.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/pro.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/ejproselect.js" 
            type=text/javascript></SCRIPT>

            <SCRIPT src="/shuiguo_shop/shop/bwuhan.js" 
type=text/javascript> </SCRIPT>
            ${page.info}</TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE><LINK 
href="/shuiguo_shop/shop/head.css" type=text/css rel=stylesheet>

<jsp:include flush="true" page="foot.jsp"></jsp:include>



</BODY></HTML>



