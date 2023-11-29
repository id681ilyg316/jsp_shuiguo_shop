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
HashMap hh = (HashMap)session.getAttribute("user");
HashMap h = dao.select("select * from buser where id="+hh.get("id")).get(0);

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
 
 </script>
 <%
 }
  %>
  <jsp:include page="top.jsp"></jsp:include>
  
 
  <form action="/shuiguo_shop/servlet/Upmemberinfo?utype=1" name="f1" >
  <input type="hidden" name="id" value="<%=hh.get("id") %>" />
    <table width="779" border="0" align="center"  >
      <tr>
        <td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
                 
                  <tr>
                    <td><table width="100%" >
            
     <tr 
              
              >
                          <td height="40" colspan="2" align="center" class=""><strong>修改用户信息</strong>
                        <label></label></td>
                      </tr>
            
                        <tr 
              
              >
                          <td width="212" height="26" align="center" class="">用户名</td>
                        <td width="563" align="left" class=""><label>
                        <%=h.get("uname") %>
                        </label></td>
                      </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">密码</td>
                          <td align="left" class=""><input type="text" class="textBox" name="upass" value="<%=h.get("upass") %>" id="textfield2" /></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">姓名</td>
                          <td align="left" class=""><input class="textBox" value="<%=h.get("tname") %>"   name="tname" type="text" id="textfield3" size="10" /></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">性别</td>
                          <td align="left" class=""><input type="radio" name="sex" <%if(((String)h.get("sex")).equals("男"))out.print("checked='checked'"); %> id="radio3" value="男" />
男
  <input type="radio" name="sex" id="radio4" <%if(((String)h.get("sex")).equals("女"))out.print("checked='checked'"); %>  value="女" />
女 </td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">年龄</td>
                        <td align="left" class=""><label>
                            <input name="age" type="text" class="textBox"  value="<%=h.get("age") %>"  id="textfield4" size="10" />
                          </label></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">电话</td>
                          <td align="left" class=""><input class="textBox"  value="<%=h.get("tel") %>"  name="tel" type="text" id="textfield5" size="25" /></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">地址</td>
                          <td align="left" class=""><input class="textBox"  value="<%=h.get("addr") %>"  name="addr" type="text" id="textfield6" size="45" /></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">email</td>
                          <td align="left" class=""><input class="textBox"  value="<%=h.get("email") %>"  name="email" type="text" id="textfield7" size="25" /></td>
                        </tr>
                        <tr 
              
              >
                          <td height="26" align="center" class="">QQ</td>
                          <td align="left" class=""><input class="textBox"  value="<%=h.get("qq") %>"  name="qq" type="text" id="textfield8" size="25" /></td>
                        </tr>
                        
                        <tr 
              
              >
                          <td colspan="3" align="center" class="">
                          
                          <input type="submit" name="button" id="button"  value="提交信息" />
                          &nbsp;&nbsp;&nbsp;
                          <input type="reset" name="button2" id="button2"  onclick="window.history.go(-1)" value="返回上页" /></td>
                        
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
                
                  
                    <td  align="center"  class="">
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
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>

<script language="javascript" src="/shuiguo_shop/shop/popup.js"></script>
