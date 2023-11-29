<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0031)http://www.qyyqyj.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>果蔬购物网站</TITLE>
<LINK rel=stylesheet type=text/css 
href="style/css.css">

<STYLE type=text/css>BODY {
	BACKGROUND-IMAGE: none; MARGIN: 0px
}
</STYLE>
<LINK rel=stylesheet type=text/css href="dbjxsys_files/style.css">
<STYLE type=text/css>.STYLE3 {
	COLOR: #333333; FONT-SIZE: 12px
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: none
}
A:active {
	TEXT-DECORATION: none
}
</STYLE>

<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=GENERATOR content="MSHTML 8.00.6001.19222"></HEAD>
<BODY>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=1002 align=center>
  <TBODY>
  <TR>
    <TD background=dbjxsys_files/bj.jpg align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=800>
        <TBODY>
       
       
       
       
       
       
       
       <jsp:include page="top.jsp"></jsp:include>
                  
                  
                  
                  
                  
                  
                  
                  
        <TR>
          <TD vAlign=top>
            <table width="100%" cellspacing="0" cellpadding="0" border="0"> 
              <tbody> 
              <tr> 
                 
                 
                 
                </tr></tbody></table>
            
            <table width="100%" cellspacing="0" cellpadding="0" border="0"><tbody><tr> 
                 
                 
                  
                  <jsp:include page="left.jsp"></jsp:include>
                 
                 
                 
                 
                 
                <%
                 HashMap umap = (HashMap)session.getAttribute("user");
                 umap = new CommDAO().getMap(umap.get("id").toString(),"members");
                 %> 
                 
                 
                <td valign="top"> 
                 
                 
                <form action='/dbjxsys/dbjxsys?ac=regmemberx&amp;id=<%=umap.get("id") %>' onSubmit="return check();" name="f1" enctype="multipart/form-data"> 
                <table width="92%" cellspacing="0" cellpadding="0" border="0" align="center"> 
                  <tbody> 
                    <tr> 
                      <td><table width="100%" cellspacing="0" cellpadding="0" border="0"> 
                          <tbody> 
                            <tr> 
                              <td height="10" colspan="2"><br></td> 
                            </tr> 
                            <tr> 
                              <td width="228" height="37" background="dbjxsys_files/ny_y3.jpg" align="left"> 
                               
                             <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户注册</strong>                              </td> 
                              <td background="dbjxsys_files/ny_ybj.jpg">&nbsp;</td> 
                            </tr> 
                          </tbody> 
                      </table></td> 
                    </tr> 
                    <tr> 
                      <td height="20">&nbsp;</td> 
                    </tr> 
                    <tr> 
                      <td valign="top" align="left" class="css"><table width="100%" cellspacing="0" cellpadding="0" border="0"> 
                          <tbody> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">用户名</td> 
                              <td width="46%" height="32" background="dbjxsys_files/ny_xt.jpg" align="left" class="css"><label> 
                                <input type="text" name="uname" readonly="readonly" id="uname"> 
                              </label></td> 
                              <td width="30%" align="center" rowspan="3" class="css"> 
                                 
                                <img height="100" src='upfile/<%=umap.get("filename") %>'> 
                                 
                                </td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">密码</td> 
                              <td width="46%" height="32" background="dbjxsys_files/ny_xt.jpg" align="left" class="css"><input type="text" name="upass" id="upass"></td> 
                              </tr> 
                             
                             <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">头像</td> 
                              <td width="46%" height="32" background="dbjxsys_files/ny_xt.jpg" align="left" class="css"><input type="file" name="txt" id="txt" size="32"></td> 
                              </tr> 
                             
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">姓名</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="tname" id="tname" size="15"></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">性别</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><label> 
                                <input type="radio" name="sex" id="sex" value="男" checked> 
男 
<input type="radio" name="sex" id="sex" value="女"> 
女 
                              </label></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">年龄</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="age" id="age" size="15"></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">电话</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="tel" id="tel" size="15"></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">住址</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="addrs" id="addrs" size="50"></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">QQ</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="qq" id="qq" size="15"></td> 
                            </tr> 
                            <tr> 
                              <td width="24%" height="32" background="dbjxsys_files/ny_xt.jpg" align="center" class="css">口腔病史</td> 
                              <td height="32" background="dbjxsys_files/ny_xt.jpg" align="left" colspan="2" class="css"><input type="text" name="kqbs" id="kqbs" size="50"></td> 
                            </tr> 
                          </tbody> 
                      </table> 
                      </td></tr><tr> 
                      <td height="33" align="center" colspan="2"><label> 
                        <input type="submit" name="button" id="button" value="提交">&nbsp;&nbsp;&nbsp; 
                        <input type="reset" name="button2" id="button2" value="重置"> 
                      </label></td> 
                      </tr> 
                    <tr> 
                      <td align="middle" colspan="2">&nbsp;</td> 
                    </tr> 
                  </tbody> 
                </table> 
                </form> 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                </td> 
              </tr></tbody></table>
              
              
              </TD></TR>
       
       
       
       
       
       
      <jsp:include page="foot.jsp"></jsp:include>
      
      
      
      
      
      
      
      
      
      </TABLE></TD></TR></TBODY></TABLE>
      
<SCRIPT type=text/javascript charset=utf-8 
src="dbjxsys_files/2462870.jss"></SCRIPT>


</BODY></HTML>
<script type="text/javascript">
<!--
<%if(request.getAttribute("suc")!=null){%>
alert("操作成功");
<%}%>
//-->
</script>
<%
CommDAO dao = new CommDAO();
List<HashMap> list = dao.select("select * from members");
String unames = "";
for(HashMap map:list)
{
unames+=map.get("uname")+",";
}
 %>
<script type="text/javascript">
<!--
function check()
{

}
//-->
</script>
<%=Info.tform(umap)%>