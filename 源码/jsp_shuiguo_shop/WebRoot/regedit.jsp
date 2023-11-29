<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="util.Info"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns=""><HEAD><TITLE>果蔬购物网站欢迎你</TITLE>
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
<script type='text/javascript' src='/shuiguo_shop/dwr/engine.js'></script>
<script type='text/javascript' src='/shuiguo_shop/dwr/util.js'> </script>
<script type='text/javascript' src='/shuiguo_shop/dwr/interface/Sysuser.js'> </script>

<LINK href=/shuiguo_shop/yyfiles/ys1.css type=text/css rel=stylesheet>

<STYLE type=text/css>
.STYLE4 {font-size: 18px}
</STYLE>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR>
</HEAD>
<BODY background="/shuiguo_shop/admin/images/bj.gif"><LINK href="shop/head.css" 
type=text/css rel=stylesheet>
<SCRIPT src="shop/head.js" type=text/javascript></SCRIPT>



<%

if(request.getAttribute("suc")!=null)
{
 %>
 <script language=javascript>
 alert("注册成功");
 parent.location.replace("/shuiguo_shop/index.jsp");
 </script>
 <%
 }
  %>
  <jsp:include page="top.jsp"></jsp:include>
<form action="/shuiguo_shop/servlet/Regeditmember" name="f1" >

<TABLE cellSpacing=0 cellPadding=0 width=779 align=center border=0 >
  <TBODY>
  <TR>
   
  </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=779 align=center border=0>
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
          <script type="text/javascript">
          
          </script>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" 
            onc border=0>
              <TBODY>
                <TR>
              <TD colspan="2" align="center" height="30"><strong>会员注册</strong></TD>
              </TR>
              
              
              <TR style="display: none">
              <TD width="26%" align="center" height="26">用户类别</TD>
              <TD width="74%">&nbsp;
              
              <label><input type="radio" name="utype"  value="1" checked="checked" >   买家       </label>&nbsp;&nbsp;
         
          



    </TD>
              </TR>
              
              
              
              <TR>
              <TD width="26%" align="center" height="26">用户名</TD>
              <TD width="74%">&nbsp;
<input type="text" name="uname" id="textfield" ><span id=cuname ></span>              </TD>
              </TR>
              <TR>
                <TD align="center" height="26">密码</TD>
                <TD width="74%">&nbsp;
  <input type="password" name="upass" id="textfield"><span id=cupass ></span>           </TD>
              </TR>
              <TR>
                <TD align="center" height="26">请再次输入密码</TD>
                <TD>&nbsp;
<input type="password" name="upass2" id="textfield3"><span id=cupass2 ></span></TD>
              </TR>
              <TR>
                <TD align="center" height="26">姓名</TD>
                <TD>&nbsp;
<input name="tname" type="text" id="textfield4" size="10">
<span id=ctname ></span></TD>
              </TR>
              <TR>
                <TD align="center" height="26">性别</TD>
                <TD>&nbsp;
                  <label>
                  <input type="radio" name="sex" checked="checked" id="radio" value="男">
                  男
                  <input type="radio" name="sex" id="radio2" value="女">
                  女
                  </label>
                  <div id=d4 ></div></TD>
              </TR>
               <TR>
                <TD align="center" height="26">年龄</TD>
                <TD>&nbsp;
                  <input name="age" type="text" id="textfield2" size="10">
                  <span id=cage ></span></TD>
              </TR>
               <TR>
                <TD align="center" height="26">电话</TD>
                <TD>&nbsp;
                  <input name="tel" type="text" id="textfield5" size="25"><span id=ctel ></span>
                 </TD>
              </TR>
               <TR>
                <TD align="center" height="26">地址</TD>
                <TD>&nbsp;
                  <input name="addr" type="text" id="textfield6" size="45"><span id=caddr ></span>
                 </TD>
              </TR>
               <TR>
                <TD align="center" height="26">email</TD>
                <TD>&nbsp;
                  <input name="email" type="text" id="textfield7" size="25"><span id=cemail ></span>
                  </TD>
              </TR>
               <TR>
                <TD align="center" height="26">QQ</TD>
                <TD>&nbsp;
                  <input name="qq" type="text" id="textfield8" size="25"><span id=cqq ></span>
                  </TD>
              </TR>
              <TR>
                <TD height="47" colspan="2" align="center"><label>
                  <input type="button" name="button" onClick="check();" id="button" value="提交">&nbsp;&nbsp;&nbsp;
                  
                  <script type="text/javascript">
                  function check()
                  {
                  if(f1.uname.value=="")
                  {
                  document.getElementById("cuname").innerHTML="<font color=red>&nbsp;请输入用户名</font>";
                  return;
                  }
                  
            var ajax = new AJAX();
            ajax.post("/shuiguo_shop/servlet/CheckUname?uname="+f1.uname.value);
            var msg = ajax.getValue();
            if(msg == 'y'){
                document.getElementById("cuname").innerHTML="<font color=red>&nbsp;该用户名已存在,请使用其他用户名</font>";
                return;
            }else{
            document.getElementById("cuname").innerHTML="";
            }
                                if(f1.upass.value=="")
                                 {
                                  document.getElementById("cupass").innerHTML="<font color=red>&nbsp;请输入密码</font>";
                                 return;
                                 }else{
                                  document.getElementById("cupass").innerHTML="";
                                 }
                                 
                                 if(f1.upass2.value=="")
                                 {
                                 document.getElementById("cupass2").innerHTML="<font color=red>&nbsp;请再次输入密码</font>";
                                 return;
                                 }else{
                                 document.getElementById("cupass2").innerHTML="";
                                 }
                                 
                                 if(f1.upass.value!=f1.upass2.value)
                                 {
                                  document.getElementById("cupass2").innerHTML="<font color=red>&nbsp;两次密码输入不一致</font>";
                                  return;
                                 }else{
                                 document.getElementById("cupass2").innerHTML="";
                                 }
                                 
                                 if(f1.tname.value=="")
                                 {
                                  document.getElementById("ctname").innerHTML="<font color=red>&nbsp;请输入姓名</font>";
                                  return;
                                 }else{
                                  document.getElementById("ctname").innerHTML="";
                                 }
                                 
                                  if(f1.age.value=="")
                                 {
                                  document.getElementById("cage").innerHTML="<font color=red>&nbsp;请输入年龄</font>";
                                  return;
                                 }else{
                                  document.getElementById("cage").innerHTML="";
                                 }
                                 
                                   if(isNaN(f1.age.value))
                                 {
                                  document.getElementById("cage").innerHTML="<font color=red>&nbsp;年龄必须为数字</font>";
                                  return;
                                 }else{
                                  document.getElementById("cage").innerHTML="";
                                 }
                              
                              
                               if(f1.tel.value=="")
                                 {
                                  document.getElementById("ctel").innerHTML="<font color=red>&nbsp;请输入电话号码</font>";
                                  return;
                                 }else{
                                  document.getElementById("ctel").innerHTML="";
                                 }
                                 
                                 if(isNaN(f1.tel.value))
                                 {
                                  document.getElementById("ctel").innerHTML="<font color=red>&nbsp;电话号码必须为数字</font>";
                                  return;
                                 }else{
                                  document.getElementById("ctel").innerHTML="";
                                 }
                                 
                                 
                                 var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                                 
                                 if(!reg.test(f1.email.value))
                                 {
                                  document.getElementById("cemail").innerHTML="<font color=red>&nbsp;email格式不正确</font>";
                                  return;
                                 }else{
                                  document.getElementById("cemail").innerHTML="";
                                 }
                                 
                                 
                                 if(f1.qq.value!=""){
                                  if(isNaN(f1.qq.value))
                                 {
                                  document.getElementById("ctel").innerHTML="<font color=red>&nbsp;qq号码必须为数字</font>";
                                  return;
                                 }else{
                                  document.getElementById("ctel").innerHTML="";
                                 }
                                 }
                                 
                
                             f1.submit();
                                 
                  }
                  </script>
                  
                  <input type="reset" name="button2"  value="重置">
                  <script language="javascript" src="/shuiguo_shop/shop/popup.js"></script>
                  <script language="javascript" src="/shuiguo_shop/yyfiles/ajax.js"></script>
                </label></TD>
                </TR>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD height=1></TD>
      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      
      </form>
      <LINK 
href="shop/head.css" type=text/css rel=stylesheet>

<jsp:include page="foot.jsp"></jsp:include>


</BODY></HTML>



