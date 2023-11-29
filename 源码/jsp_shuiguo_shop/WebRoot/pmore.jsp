<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="dao.CommDAO"/>
<jsp:directive.page import="util.Info"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns=""><HEAD><TITLE>果蔬购物网站欢迎你</TITLE>
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
<SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>
<SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>
<SCRIPT src="shop/pro.js" type=text/javascript> </SCRIPT>
<SCRIPT src="shop/ejproselect.js" type=text/javascript></SCRIPT>
<SCRIPT src="shop/bwuhan.js" type=text/javascript> </SCRIPT>
<script type='text/javascript' src='/sxy/dwr/engine.js'></script>
<script type='text/javascript' src='/sxy/dwr/util.js'> </script>
<script type='text/javascript' src='/sxy/dwr/interface/Sysuser.js'> </script>

<META content="MSHTML 6.00.6000.16981" name=GENERATOR>
</HEAD>
<BODY onLoad="startclock()"><LINK href="shop/head.css" 
type=text/css rel=stylesheet>
<SCRIPT src="shop/head.js" type=text/javascript></SCRIPT>

<SCRIPT type=text/javascript>
function chkdatatop(){
		    	var a = document.getElementById("street1").value;			
		    	var b = document.getElementById("area1").value;
		    	var c = document.getElementById("uname").value;
		    	//alert("dc");
		    if(b==""||b=="选择行政区")
		    {
			     if(c==""||c=="请输入关键字")
				 {
				// alert("d");
				 alert("请输入关键字或至少选择一个区");
				 return false; 
				 }
		    }else{
			 
			
			 
			}	
    }
</SCRIPT>

<jsp:include flush="true" page="top.jsp"></jsp:include>

<%
CommDAO dao = new CommDAO();
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 

String ptype = request.getParameter("ptype");if(ptype==null)ptype="";
String key = request.getParameter("key");if(key==null)key="";
String f = request.getParameter("f");

if(f==null)key=Info.getUTFStr(key);


String sql = "select a.*,b.typename from books a,protype b where a.protype=b.id ";

if(!ptype.equals(""))
{
sql+=" and a.protype='"+ptype+"' ";
}

if(!key.equals(""))
{
sql+=" and (a.bookname like'%"+key+"%' or a.cbs like'%"+key+"%' or a.author like'%"+key+"%' or a.content like'%"+key+"%') ";
}

sql+="order by a.id desc ";

int records = dao.select(sql).size();
int pages = 0;
if(records%27==0)pages=records/27;
if(records%27!=0)pages=records/27+1;
if(dpage<1)dpage=1;
if(dpage>pages)dpage=pages;

sql+=" limit "+(dpage-1)*27+","+dpage*27+" ";







List<HashMap> list = dao.select(sql);
 %>

<TABLE cellSpacing=0 cellPadding=0 width=950 align=center border=0>
  <TBODY>
  <TR>
   
  </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=962 align=center border=0>
  <TBODY>
  <TR>
    <jsp:include flush="true" page="left.jsp"></jsp:include>
    <TD vAlign=top width=6></TD>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
            <SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>

            <SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/pro.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/ejproselect.js" 
            type=text/javascript></SCRIPT>

            <SCRIPT src="shop/bwuhan.js" 
type=text/javascript> </SCRIPT>

            <SCRIPT type=text/javascript> 
     function t(no)
     {
      var b = document.getElementById(105);
     
     for(i=101;i<105;i++)
     {
     var a = document.getElementById(i);
     var b = document.getElementById(i+4);
     if(no==i)
     {
     a.style.display="";
     b.className="titleblue14";
     }else
     {
      a.style.display="none";
      b.className="";
     }
     }
     }
     
     </SCRIPT></TD>
        </TR>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
            <SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>

            <SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/pro.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/ejproselect.js" 
            type=text/javascript></SCRIPT>

            <SCRIPT src="shop/bwuhan.js" 
type=text/javascript> </SCRIPT>

            <TABLE cellSpacing=0 cellPadding=0 width="100%" 
            background=shop/02side(1).gif border=0>
              <TBODY>
              <TR>
                <TD background=shop/02top(1).gif height=27>
                  <TABLE cellSpacing=0 cellPadding=0 width=730 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD class=titleorange14 align=left width=244>水果列表<br></TD>
                      <TD width="486" align=right class=orangelight>&nbsp; <IMG height=14 
                        src="shop/arrororange.gif" width=14 
                        align=absMiddle></TD>
                    </TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <TABLE cellSpacing=5 cellPadding=3 width="98%" align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD align=left width="33%">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD class=menutitle1>
                              <TABLE cellSpacing=5 cellPadding=3 width="98%" 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                
                                
                                
                                <%
                                int i=0;
                                for(HashMap h:list)
                                {
                                i++;
                                 %>
                                <TD align=left width="33%">
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                                border=0>
                                <TBODY>
                                <TR>
                                <TD width="38%" rowspan="3" class=menutitle1><img src="/shuiguo_shop/upfile/<%=h.get("img") %>" width="70" height="60" /></TD>
                                <TD width="62%" class=menutitle1><a class=orange 
                                href="/shuiguo_shop/bookxiang.jsp?id=<%=h.get("id") %>" 
                                target=_blank><%=h.get("bookname") %></a></TD>
                                </TR>
                                <TR>
                                <TD class=menutitle2><a 
                                href="/shuiguo_shop/bookxiang.jsp?id=<%=h.get("id") %>" 
                                target=_blank>价格 &nbsp;<%=h.get("price") %></a></TD>
                                </TR>
                                <TR>
                                <TD class=menutitle2><a 
                                href="/shuiguo_shop/bookxiang.jsp?id=<%=h.get("id") %>" 
                                target=_blank>类别:<%=h.get("typename") %></a></TD>
                                </TR></TBODY></TABLE></TD>
                                <%
                                if(i%3==0)
                                {%>
                                </tr><tr>
                                <%
                                }
                                }
                                 %>
                                
                                
                                
                                </TR>
                                
                                
                                
                                
                                
                                
                                
                                 <TR>
                                <td align="center" colspan="3" height="30">
                                
                                共 <%=records %> 条记录
                                
                                &nbsp;&nbsp;
                                
                                当前 <%=dpage %>/<%=pages %> 页
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/pmore.jsp?ptype=<%=ptype %>&key=<%=key %>">首页</a>
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/pmore.jsp?ptype=<%=ptype %>&key=<%=key %>&dpagee=<%=dpage-1 %>">上页</a>
                                
                                &nbsp;&nbsp;
                                
                                <a href="/shuiguo_shop/pmore.jsp?ptype=<%=ptype %>&key=<%=key %>&dpagee=<%=dpage+1 %>">下页</a>
                                
                                &nbsp;&nbsp;
                                
                                
                                <a href="/shuiguo_shop/pmore.jsp?ptype=<%=ptype %>&key=<%=key %>&dpagee=<%=pages %>">末页</a>
                                
                                
                                </td>
                                </TR>
                                
                                
                                
                                
                                
                                
                                
                                </TBODY>
                                
                                
                                
                                
                                
                                
                                </TABLE>
                              <A 
                              class=titleblue14 
                              href=""></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
            <SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>

            <SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/pro.js" type=text/javascript> </SCRIPT>

            <SCRIPT src="shop/ejproselect.js" 
            type=text/javascript></SCRIPT>

            <SCRIPT src="shop/bwuhan.js" 
type=text/javascript> </SCRIPT></TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE><LINK 
href="shop/head.css" type=text/css rel=stylesheet>


<form action="/sxy/school.action?methods=sendorder" target="mainn" name="f22">
<input type="hidden" name="pid" />
<input type="hidden" name="shopid" />
</form>
<script type="text/javascript">
function send(no,sid)
{
f22.pid.value=no;
f22.shopid.value=sid;
alert('订单已发送 ^_^');
f22.submit();
}
</script>
<iframe frameborder="0" name=mainn width="0" height="0"></iframe>


<jsp:include flush="true" page="foot.jsp"></jsp:include>



</BODY></HTML>



