<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns=""><HEAD><TITLE>欢迎光临本站</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">


<LINK 
href="shop/globle.css" type=text/css rel=stylesheet><LINK 
href="shop/head.css" type=text/css rel=stylesheet><LINK 
href="shop/copyright.css" type=text/css rel=stylesheet>
<SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>
<SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>
<SCRIPT src="shop/pro.js" type=text/javascript> </SCRIPT>
<SCRIPT src="shop/ejproselect.js" type=text/javascript></SCRIPT>
<SCRIPT src="shop/bwuhan.js" type=text/javascript> </SCRIPT>
<script type='text/javascript' src='/databasesys/dwr/engine.js'></script>
<script type='text/javascript' src='/databasesys/dwr/util.js'> </script>
<script type='text/javascript' src='/databasesys/dwr/interface/Sysuser.js'> </script>

<META content="MSHTML 6.00.6000.16981" name=GENERATOR>
</HEAD>
<BODY background="/databasesys/admin/images/bj.gif"><LINK href="shop/head.css" 
type=text/css rel=stylesheet>
<SCRIPT src="shop/head.js" type=text/javascript></SCRIPT>



<%

if(request.getAttribute("suc")!=null)
{
 %>
 <script language=javascript>
 alert("操作成功");
 parent.location.replace("/databasesys/index.jsp");
 </script>
 <%
 }
  %>
  
  <%

if(request.getAttribute("error")!=null)
{
 %>
 <script language=javascript>
 alert("用户名或密码错误");
 </script>
 <%
 }
  %>
<form action="/databasesys/databasesys?ac=memlogin" name="f1" >
<TABLE cellSpacing=0 cellPadding=0 width=950 align=center border=0 >
  <TBODY>
  <TR>
   
  </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100% align=center border=0>
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
             border=0>
              <TBODY>
                <TR>
              <TD colspan="2" align="center" height="10"></TD>
              </TR>
              <TR>
              <TD colspan="2" align="center">
              
              
              
              
              <%
              String filename = request.getParameter("filename");
               %>
              
              <object id=videowindow1 width=300 height=330 classid="CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6"> 
<param name=URL value="/databasesys/upfile/<%=filename %>"> 
<param name=AUTOSTART value="1"></object>
              
     
              
              </TD>
              </TR>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD height=1></TD>
      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      
      </form>
      <LINK 
href="shop/head.css" type=text/css rel=stylesheet>




</BODY></HTML>



