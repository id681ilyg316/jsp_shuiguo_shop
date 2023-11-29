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
 

  <form action="/shuiguo_shop/servlet/Addmember" name="f1" >
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame"
    style="padding: 0px;border-right-width: 0px;border-bottom-width: 0px;">
      <tr>
        <td>
        
       
        
				<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
                 
                  <tr>
                    <td>
                    
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="6" colspan="2"></td>
            </tr>
            <tr>
              <td width="118" class="main_title_td_center"> 信息列表</td>
              <td class="main_title_td_bg">&nbsp;</td>
            </tr>
          </table>
                    
                    
                    <table width="100%" border="0" 
            cellspacing="0"shuiguo_shopstyle="WIDTH: 100%; BORDER-COLLAPSE: collapse">
            
            
            
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td width="390" align="center" class="main_matter_td">用户名</td>
                        <td width="1017" align="left" class="main_matter_td"><label>
                        <input type="text" class="textBox" name="uname" id="textfield2" />
                        </label></td>
                      </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">密码</td>
                          <td align="left" class="main_matter_td"><input type="text" class="textBox" name="upass" id="textfield2" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">姓名</td>
                          <td align="left" class="main_matter_td"><input class="textBox"   name="tname" type="text" id="textfield3" size="10" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">性别</td>
                          <td align="left" class="main_matter_td"><input type="radio" name="sex" checked='checked' id="radio3" value="男" />
男
  <input type="radio" name="sex" id="radio4"   value="女" />
女 </td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">年龄</td>
                          <td align="left" class="main_matter_td"><label>
                            <input name="age" type="text" class="textBox"  id="textfield4" size="10" />
                          </label></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">电话</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  name="tel" type="text" id="textfield5" size="25" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">地址</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  name="addr" type="text" id="textfield6" size="45" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">email</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  name="email" type="text" id="textfield7" size="25" /></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">QQ</td>
                          <td align="left" class="main_matter_td"><input class="textBox"  name="qq" type="text" id="textfield8" size="25" /></td>
                        </tr>
                        
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td colspan="3" align="center" class="main_matter_td">
                          
                          <input type="button" name="button" id="button" onClick="check();"  value="添加用户" />
                          &nbsp;&nbsp;&nbsp;
                          <input type="reset" name="button2" id="button2" value="重新填写" /></td>
                        
                        <script language=javascript>
                        function check()
                  {
                  if(f1.uname.value=="")
                  {
                  alert("请输入用户名");
                  return;
                  }
                  
            var ajax = new AJAX();
            ajax.post("/shuiguo_shop/servlet/CheckUname?uname="+f1.uname.value);
            var msg = ajax.getValue();
            if(msg == 'y'){
                alert("该用户名已存在,请使用其他用户名");
                return;
            }
                                if(f1.upass.value=="")
                                 {
                                 alert("请输入密码");
                                 return;
                                 } 
                                 
                                
                              
                
                f1.submit();
                                 
                                 
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
  <script language="javascript" src="/shuiguo_shop/shop/ajax.js"></script>
