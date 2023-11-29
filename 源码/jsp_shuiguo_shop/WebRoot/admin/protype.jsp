<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="dao.CommDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="util.Info"%>

<html>
<head>
<title></title>
 <style type="text/css">
img{border:0px;}
.STYLE1 {font-weight: bold}
 .STYLE2 {font-weight: bold}
 </style>

</head>
<SCRIPT language=javascript>
<!--
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 

}

//-->
</script>
<body >

<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 <script language=javascript>
 alert("用户编号已存在，请使用其他编号");
 </script>
 <%
 }
  %>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  new CommDAO().commOper("delete from protype where id="+did);
  List<HashMap> dlist = dao.select("select * from books where protype ='"+did+"'");
  for(HashMap h:dlist)
  {
  Info.delPic("/shuiguo_shop/upfile/",(String)h.get("img"));
  }
  dao.commOper("delete from books where protype ='"+did+"'");
  }
   %>
 
  <form action="/shuiguo_shop/servlet/AddType" name="f1" method="post">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  	<tr>
  		<td height="30">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="30"><img src="/shuiguo_shop/admin/images/tab_03.gif" width="15" height="30" /></td>
	        <td width="1101" background="/shuiguo_shop/admin/images/tab_05.gif"><img src="/shuiguo_shop/admin/images/311.gif" width="16" height="16" />&nbsp;<span class="STYLE4"></span></td>
	        <td width="281" background="/shuiguo_shop/admin/images/tab_05.gif">&nbsp;</td>
	        <td width="14"><img src="/shuiguo_shop/admin/images/tab_07.gif" width="14" height="30" /></td>
            </tr>
    	</table>
    </td>
  	</tr>
  	<tr>
  	<td>
  	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  	  <td width="9" background="/shuiguo_shop/admin/images/tab_12.gif">&nbsp;</td>
      <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
          <tr align="center"> 
            <td height="18" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">类别名称</td>
            <td width="8%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">删除</td>
             <td height="18" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">类别名称</td>
            <td width="8%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">删除</td>
          </tr>

         
         
          <%
     List<HashMap> list = dao.select("select * from protype order by savetime");
     int ii=0;
     
            %>
          <tr> 
           <%
                for(HashMap h:list)
     {
     ii++;
               %>
            <td height="26" align="left" bgcolor="#FFFFFF" class="">    <%=h.get("typename") %>  
            <td height="26" align="center" bgcolor="#FFFFFF" class="">
            
           <a href="/shuiguo_shop/admin/protype.jsp?did=<%=h.get("id") %>"> 删除</a>
            
            </td>
          
        <%
                  if(ii%2==0)
                  {
                   %>
                   </tr>
                   <tr>
                   <%
                   }}
                    %>   
          
          
          
          
        </table>
        </td></table></tr>
        
        <tr>
    <td height="29">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      
        <td width="15" height="29"><img src="/shuiguo_shop/admin/images/tab_20.gif" width="15" height="29" /></td>
        <td background="/shuiguo_shop/admin/images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" align="center" nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            
            
        </table></td>
        <td width="14"><img src="/shuiguo_shop/admin/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table>
    </td>
  </tr>
  </table>


  <table align=center width=100% cellspacing=0 cellpadding=0>
<tr>
		  <td height="24" colspan="2" align="center" ><strong></strong><label></label>
	        <strong>添加类别</strong><br></td>
</tr>
    
    <tr>
		  <td width="23%" align="center" >请输入类别名称<br></td>
          <td width="77%" align="left" ><label>
            <input name="typename" type="text" id="textfield" size="50">
          </label></td>
    </tr>
    
    <tr>
		  <td height="39" colspan="2" align="center" ><label>
		    <input type="submit" name="button" id="button" value="提交">&nbsp;&nbsp;&nbsp;
		    <input type="reset" name="button2" id="button2" value="重置">
		  </label></td>
</tr>
  </table>
</form>
 
</body>
</html>
<script language=javascript>
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("操作成功");
<%
}
%>
</script>
