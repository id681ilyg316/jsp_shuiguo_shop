<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/dbjxsys/admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/dbjxsys/admin/images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>
<script type="text/javascript"  src="/dbjxsys/fckeditor/fckeditor.js"></script>
 <script language="javascript">
 function fckinit()
 {
   var of = new FCKeditor("content");
		of.BasePath="/dbjxsys/fckeditor/";
		of.Height = "300";
		of.ToolbarSet="Default";
		of.ReplaceTextarea();
 }
 </script>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>

<%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap map = dao.select("select * from news where id="+id).get(0);
 %>

<BODY onLoad="">
<form action="/dbjxsys/dbjxsys?ac=updatenews&id=<%=id %>"  enctype="multipart/form-data" name="f1" method="post">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>请输入作业名称</TD>
    <TD class=forumrowhighlight width="68%" 
      height=24><label>
      <input name="title" type="text" id="olduserpass" value="<%=map.get("title") %>" size="50">
    </label></TD></TR>
  
  <TR>
    <TD height=24 align="center" class=forumrow>请选择作业文件</TD>
    <TD class=forumrowhighlight height=24><label>
    <input name="txt" type="file"  size="50">
    </label></TD>
  </TR>
  
  

  
  
  <TR>
    <TD height=31 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function check()
{
if(f1.olduserpass.value=="")
{
alert("请输入原密码");
return;
}
if(f1.userpass.value=="")
{
alert("请输入新密码");
return;
}
if(f1.copyuserpass.value!=f1.userpass.value)
{
alert("两次密码输入不一致");
return;
}
}
</script>
<script type="text/javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码不对");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/dbjxsys/admin/kcfiles.jsp");
 <%}%>
 </script>
