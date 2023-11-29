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
new CommDAO().delete(request,"bmessage"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"bmessage",ext,true,true); 
HashMap mmm = new CommDAO().getmap(id,"bmessage"); 
%>
<body>
<form  action="bmessagexg.jsp?f=f&id=<%=mmm.get("id")%>"  name="f1"  onsubmit="return checkform()" >
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" colspan="2" align="center"><strong>回复留言</strong></td>
  </tr>
  <tr>
    <td width="351" height="34" align="center">回复 </td>
    <td width="894" height="28" align="left"><textarea  cols='35'  onblur='checkform()'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='reback'   ></textarea></td>
  </tr>
 

  <tr>
    <td height="38" colspan="2" align="center"><label>
      <input type="submit" name="button" id="button" value="提交信息" />&nbsp;&nbsp;&nbsp;
      <input type=button value='返回上页' onclick='popclose();' />
    </label></td>
  </tr>
</table>
</form>
</body>
</html>
<script language=javascript src='/shuiguo_shop/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/shuiguo_shop/js/ajax.js'></script> 
<script language=javascript src='/shuiguo_shop/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
return true;   
}   
var frames = parent.document.getElementsByTagName("iframe");
for(var i=0;i<frames.length;i++){ 
var alliframe = parent.document.getElementsByTagName("iframe")[i];  
if(alliframe.name=="ifr_popup0")
alliframe.style.height=document.body.scrollHeight+12; 
} 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
