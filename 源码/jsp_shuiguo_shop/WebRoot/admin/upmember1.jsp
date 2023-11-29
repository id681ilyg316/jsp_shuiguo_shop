<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<jsp:directive.page import="util.Info"/>
<%@page import="dao.CommDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin: 0px;
}
-->
</style>

<%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap h = dao.select("select * from buser where id="+id).get(0);

 %>

<link href="/shuiguo_shop/admin/global.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="/shuiguo_shop/theme/calendar/WdatePicker.js"></script>
<SCRIPT language=javascript>
<!--
function window.onload() { 



if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+350; return;}}} 

}

//-->
</script>

</head>

<body>
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 <script language=javascript>
 alert("操作成功");
 parent.location.replace("/shuiguo_shop/admin/hygl.jsp");
 
 </script>
 <%
 }
  %>
 

  <form action="/shuiguo_shop/servlet/Upmemberinfo?utype=0" name="f1" >
  <input type="hidden" name="id" value="<%=id %>" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame"
    style="padding: 0px;border-right-width: 0px;border-bottom-width: 0px;">
      <tr>
        <td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
                 
                  <tr>
                    <td><table width="100%" border="0" 
            cellspacing="0"shuiguo_shopstyle="WIDTH: 100%; BORDER-COLLAPSE: collapse">
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td width="661" align="center" class="main_matter_td">用户名</td>
                        <td width="746" align="left" class="main_matter_td"><label>
                        <%=h.get("uname") %>
                        </label></td>
                      </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">密码</td>
                          <td align="left" class="main_matter_td"><input type="text" class="textBox" name="upass" value="<%=h.get("upass") %>" id="textfield2" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">姓名</td>
                          <td align="left" class="main_matter_td"><input class="textBox" value="<%=h.get("tname") %>"   name="tname" type="text" id="textfield3" size="10" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">性别</td>
                          <td align="left" class="main_matter_td"><input type="radio" name="sex" <%if(((String)h.get("sex")).equals("男"))out.print("checked='checked'"); %> id="radio3" value="男" />
男
  <input type="radio" name="sex" id="radio4" <%if(((String)h.get("sex")).equals("女"))out.print("checked='checked'"); %>  value="女" />
女 </td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">年龄</td>
                          <td align="left" class="main_matter_td"><label>
                            <input name="age" type="text" class="textBox"  value="<%=h.get("age") %>"  id="textfield4" size="10" />
                          </label></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">电话</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  value="<%=h.get("tel") %>"  name="tel" type="text" id="textfield5" size="25" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">地址</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  value="<%=h.get("addr") %>"  name="addr" type="text" id="textfield6" size="45" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">email</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  value="<%=h.get("email") %>"  name="email" type="text" id="textfield7" size="25" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">QQ</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  value="<%=h.get("qq") %>"  name="qq" type="text" id="textfield8" size="25" /></td>
                        </tr>
                        
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td colspan="3" align="center" class="main_matter_td">
                          
                          <input type="submit" name="button" id="button"  value="修改" />
                          &nbsp;&nbsp;&nbsp;
                          <input type="reset" name="button2" id="button2" onMouseDown="popclose();" value="关闭" /></td>
                        
                        <script language=javascript>
                       function check()
                       {
                        
                       }
                        </script>
                        </tr>
                    </table></td>
                  </tr>
                </table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                
                  
                    <td  align="center"  class="main_matter_td">
                 <!--   当前第&nbsp;
                    
                    <font color="red"><div id="dpage" style="display: inline;">1</div></font>
                    
                    
                    &nbsp;页
                    &nbsp;&nbsp;
                   共&nbsp;&nbsp;页 &nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="sy()">首页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="syy()">上一页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="xyy()">下一页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="wy()">尾页</label>
                    -->
                    
                    
                    </td>
                  </tr>
        </table></td>
      </tr>
</table>
</form>
</body>
</html>

<script language="javascript" src="/shuiguo_shop/shop/popup.js"></script>
