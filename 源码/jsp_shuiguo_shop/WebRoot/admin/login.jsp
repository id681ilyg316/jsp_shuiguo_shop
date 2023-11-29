<%@page contentType="text/html;charset=UTF-8"%>
<%@page session="true"%>
<%
session.invalidate();
%>
<html>
	<head>
		<title>管理后台</title>
		
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			overflow:hidden;
		}
		.STYLE3 {color: #528311; font-size: 12px; }
		.STYLE4 {
			color: #42870a;
			font-size: 12px;
		}
		-->
		</style>
	  <script language="javascript">
      function checkform() {
	      if (document.loginForm.adminName.value=="" || document.loginForm.password.value==""){
		      alert("用户名或密码为空！");
		      //return false;
     	  }
     	  document.getElementById('login').submit();
	      //return true;
      }
    </script>
	</head>

	<body>
	<FORM name=loginform action="/shuiguo_shop/servlet/Login?utype=0" method=post>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#e5f6cf">&nbsp;</td>
  </tr>
  <tr>
    <td height="608" background="/shuiguo_shop/admin/images/login_03.gif"><table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="266" background="/shuiguo_shop/admin/images/login_04.gif">
       </td>
      </tr>
      <tr>
        <td height="95"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="424" height="95" background="/shuiguo_shop/admin/images/login_06.gif">&nbsp;</td>
            <td width="183" background="/shuiguo_shop/admin/images/login_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="21%" height="30"><div align="center"><span class="STYLE3">用户</span></div></td>
                <td width="79%" height="30"><input type="text" id="a" name="luname"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td height="30"><div align="center"><span class="STYLE3">密码</span></div></td>
                <td height="30"><input type="password" id="b" name="lupass"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30"><img src="/shuiguo_shop/admin/images/dl.gif" width="81" height="22" border="0" usemap="#Map" >&nbsp;
                 <SCRIPT language=javascript>
			function check()
{
         var a = document.getElementById("a").value;
		 var b =  document.getElementById("b").value;
		 if(a=="")
		 {
		 alert("请输入帐号");
		 return;
		 }
		  if(b=="")
		 {
		 alert("请输入密码");
		 return;
		 }
		 loginform.submit();
}
			</SCRIPT>
                </td>
              </tr>
            </table></td>
            <td width="255" background="/shuiguo_shop/admin/images/login_08.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="247" valign="top" background="/shuiguo_shop/admin/images/login_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" height="30">&nbsp;</td>
            <td width="56%">&nbsp;</td>
            <td width="22%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="44%" height="20">&nbsp;</td>
                <td width="56%" class="STYLE4">版本 2010V1.0 </td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#a2d962">&nbsp;</td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="3,3,36,19" href="#" onclick="javascript:return(check());"><area shape="rect" coords="40,3,78,18" href="javascript:document.getElementById('login').reset();"></map>
</form>
</body>
</html>
<script type="text/javascript" src="/weboa/images/popup.js"></script>