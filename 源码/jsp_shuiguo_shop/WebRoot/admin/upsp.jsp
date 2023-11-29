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
new CommDAO().delete(request,"pros"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"pros",ext,true,false); 
HashMap mmm = new CommDAO().getmap(id,"pros"); 
%>
<body>
<form  action="upsp.jsp?f=f&id=<%=mmm.get("id")%>"  name="f1"  onsubmit="return checkform()" >
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" colspan="2" align="center"><strong>信息修改</strong></td>
  </tr>
  <tr>
    <td width="221" height="34" align="center">水果名称 </td>
    <td width="1024" height="28" align="left"><input type=text  onblur='checkform()'  class='' id='proname' name='proname' size=35 /><label id='clabelproname' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">保质期 </td>
    <td width="1024" height="28" align="left"><input type=text  onblur='checkform()'  class='' id='cpcj' name='cpcj' size=35 /><label id='clabelcpcj' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">产地 </td>
    <td width="1024" height="28" align="left"><input type=text  onblur='checkform()'  class='' id='cand' name='cand' size=35 /><label id='clabelcand' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">水果类别 </td>
    <td width="1024" height="28" align="left"><%=Info.getselect("protype","protype","typename~无名"," 1=1 ")%><label id='clabelprotype' />
</td>
  </tr>
<tr>
    <td width="221" height="34" align="center">价格 </td>
    <td width="1024" height="28" align="left"><input type='text' size='8'    class='' id='mprice'  name='mprice' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform()' onmouseup='clearNoNum(this);'  /><label id='clabelmprice' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">库存量 </td>
    <td width="1024" height="28" align="left"><input type=text size='8'   class='' id='tgrs'  name='tgrs' onkeyup='clearNoNum(this);' onblur='clearNoNum(this);checkform()' onmouseup='clearNoNum(this);'  /><label id='clabeltgrs' /></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">折扣 </td>
    <td width="1024" height="28" align="left"><select name='discount' onblur='checkform()' >
<option value='不打折'>不打折</option> 
<option value='9'>9</option> 
<option value='8'>8</option> 
<option value='7'>7</option> 
<option value='6'>6</option> 
<option value='5'>5</option> 
<option value='4'>4</option> 
<option value='3'>3</option> 
<option value='2'>2</option> 
<option value='1'>1</option> 
</select>
<label id='clabeldiscount' />
</td>
  </tr>
<tr>
    <td width="221" height="34" align="center">简介 </td>
    <td width="1024" height="28" align="left"><textarea  cols='35'  onblur='checkform()'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='pcontent'   ></textarea></td>
  </tr>
<tr>
    <td width="221" height="34" align="center">图片 </td>
    <td width="1024" height="28" align="left"><%=Info.getImgUpInfo(65)%></td>
  </tr>

  <tr>
    <td height="38" colspan="2" align="center"><label>
      <input type="submit" name="button" id="button" value="提交信息" />&nbsp;&nbsp;&nbsp;
      <input type=button value='返回上页' onclick='window.location.replace("spgl.jsp")' />
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
var pronameobj = document.getElementById("proname");  
if(pronameobj.value==""){  
document.getElementById("clabelproname").innerHTML="&nbsp;&nbsp;<font color=red>请输入水果名称</font>";  
return false;  
}else{ 
document.getElementById("clabelproname").innerHTML="  ";  
}  
var cpcjobj = document.getElementById("cpcj");  
if(cpcjobj.value==""){  
document.getElementById("clabelcpcj").innerHTML="&nbsp;&nbsp;<font color=red>请输入保质期</font>";  
return false;  
}else{ 
document.getElementById("clabelcpcj").innerHTML="  ";  
}  
var candobj = document.getElementById("cand");  
if(candobj.value==""){  
document.getElementById("clabelcand").innerHTML="&nbsp;&nbsp;<font color=red>请输入产地</font>";  
return false;  
}else{ 
document.getElementById("clabelcand").innerHTML="  ";  
}  
var protypeobj = document.getElementById("protype");  
if(protypeobj.value==""){  
document.getElementById("clabelprotype").innerHTML="&nbsp;&nbsp;<font color=red>请输入水果类别</font>";  
return false;  
}else{ 
document.getElementById("clabelprotype").innerHTML="  ";  
}  
var mpriceobj = document.getElementById("mprice");  
if(mpriceobj.value==""){  
document.getElementById("clabelmprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入价格</font>";  
return false;  
}else{ 
document.getElementById("clabelmprice").innerHTML="  ";  
}  
var tgrsobj = document.getElementById("tgrs");  
if(tgrsobj.value==""){  
document.getElementById("clabeltgrs").innerHTML="&nbsp;&nbsp;<font color=red>请输入库存量</font>";  
return false;  
}else{ 
document.getElementById("clabeltgrs").innerHTML="  ";  
}  
return true;   
}   
</script>  
<%=Info.tform(mmm)%>  
