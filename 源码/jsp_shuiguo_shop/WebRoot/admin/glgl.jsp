<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="dao.CommDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="java.util.ArrayList"%>

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

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+350; return;}}} 

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
  new CommDAO().commOper("delete from buser where id="+did);
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
	        <td width="281" background="/shuiguo_shop/admin/images/tab_05.gif" align="right">
	        
	        <a href="addgl.jsp">添加管理员</a>
	        
	        &nbsp;&nbsp;
	        </td>
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
            <td width="29%" height="18" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">用户名</td>
            <td width="25%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">密码</td>
            <td width="24%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">姓名</td>
            <td width="7%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">性别</td>
            <td width="6%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">修改</td>
            <td width="9%" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">删除</td>
          </tr>

         
         
          <%
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 




String sql = "select * from buser where utype!='1'  ";




sql+="order by id desc ";

int records = dao.select(sql).size();
int pages = 0;
if(records%7==0)pages=records/7;
if(records%7!=0)pages=records/7+1;
if(dpage<1)dpage=1;
if(dpage>pages)dpage=pages;

System.out.println(sql);

PageManager pageManager = PageManager.getPage("/shuiguo_shop/glgl.jsp?1=1",10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
for(HashMap h:nlist)
{
 %>
          <tr> 
          <td height="26" align="left" bgcolor="#FFFFFF" class="">    <%=h.get("uname") %>  </td>
          <td height="26" align="center" bgcolor="#FFFFFF" class="">       <%=h.get("upass") %>     </td>
          <td height="26" align="center" bgcolor="#FFFFFF" class=""> <%=h.get("tname") %></td>
          <td height="26" align="center" bgcolor="#FFFFFF" class=""> <%=h.get("sex") %></td>
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><a href="/shuiguo_shop/admin/upmember.jsp?id=<%=h.get("id") %>">修改</a>      </td>    
          <td height="26" align="center" bgcolor="#FFFFFF" class="">
          <a href="/shuiguo_shop/admin/glgl.jsp?did=<%=h.get("id") %>"> 删除</a>            </td>
          </tr>
 <%
 }
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
            <td height="29" align="center" nowrap="nowrap">
${page.info }  

</td>
            </tr>
            
            
        </table></td>
        <td width="14"><img src="/shuiguo_shop/admin/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table>
    </td>
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
