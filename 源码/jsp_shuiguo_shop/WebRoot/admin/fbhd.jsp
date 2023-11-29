<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
  <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<% 
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"mixinfo",ext,true,false); 
%>
<body>
<form  action="fbhd.jsp?f=f&tglparentid=<%=tglparentid%>"  name="f1"  onsubmit="return checkform()" >
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" colspan="2" align="center"><strong>发布活动</strong></td>
  </tr>
  <tr>
    <td width="221" height="34" align="center">标题 </td>
    <td width="1024" height="28" align="left"><input type=text  onblur='checkform()' class='' id='title' name='title' size=55 /><label id='clabeltitle' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">相关图片 </td>
    <td width="1024" height="28" align="left"><%=Info.getImgUpInfo(65)%></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">内容 </td>
    <td width="1024" height="28" align="left"><%=Info.fck(265,"")%></td>
  </tr>

  <tr>
    <td height="38" colspan="2" align="center"><label>
      <input type="submit" name="button" id="button" value="提交信息" />&nbsp;&nbsp;&nbsp;
      <input type=button value='返回上页' onclick='window.location.replace("hdgl.jsp")' />
    </label></td>
  </tr>
</table>
</form>
</body>
</html>
<script language=javascript src='/shuiguo_shop/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/shuiguo_shop/js/popup.js'></script>
<script language=javascript src='/shuiguo_shop/js/ajax.js'></script>
<%@page import="util.Info"%>
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var titleobj = document.getElementById("title");  
if(titleobj.value==""){  
document.getElementById("clabeltitle").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";  
return false;  
}else{
document.getElementById("clabeltitle").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
