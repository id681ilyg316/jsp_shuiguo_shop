<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="dao.CommDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="java.util.ArrayList"%>
  <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
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

 
  <form  action="hdgl.jsp"  name="f1" method="post">
  
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
   <tr> 
          <td colspan=4 height="26" align="left" bgcolor="#FFFFFF" class="">&nbsp;&nbsp;&nbsp;
<% 
String ptitle = request.getParameter("title")==null?"":request.getParameter("title"); 
String starttitle = request.getParameter("starttitle")==null?"":request.getParameter("starttitle"); 
String endtitle = request.getParameter("endtitle")==null?"":request.getParameter("endtitle"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;&nbsp;
标题 
&nbsp;:&nbsp; 
<input type=text class=''  size=20 name='title' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;&nbsp;
<input type=button   class='' value='添加信息' onclick="window.location.replace('fbhd.jsp')" /> 
&nbsp;&nbsp;</td>
    </tr>
  
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
            <td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">标题</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">发布时间</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">操作</td>
            </tr>

          
          <% 
new CommDAO().delete(request,"mixinfo"); 
if(request.getParameter("titleid1")!=null){ 
 new CommDAO().commOper("update mixinfo set title ='' where id="+request.getParameter("titleid1"));  
} 
if(request.getParameter("titleid2")!=null){ 
 new CommDAO().commOper("update mixinfo set title ='' where id="+request.getParameter("titleid2"));  
} 
String sql = "select * from mixinfo where 1=1 " ;
 if(!ptitle.equals("")){ 
 sql+= " and title like'%"+ptitle+"%' " ;
 }  
 if(!starttitle.equals("")){  
 mmm.put("starttitle",starttitle) ;
 sql+= " and title >'"+starttitle+"' " ;
 }  
 if(!endtitle.equals("")){  
 mmm.put("endtitle",endtitle) ;
 sql+= " and title <'"+Info.getDay(endtitle,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "hdgl.jsp?1=1&title="+ptitle+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>
 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("title")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("savetime")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class="">
<a href="uphd.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="hdgl.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%>
 
                  
        </table>
        </td></table></tr>
        
        <tr>
    <td height="29">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      
        <td width="15" height="29"><img src="/shuiguo_shop/admin/images/tab_20.gif" width="15" height="29" /></td>
        <td background="/shuiguo_shop/admin/images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan=4 height="29" align="center" nowrap="nowrap">${page.info}</td>
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
 
<script language=javascript src='/shuiguo_shop/js/ajax.js'></script>
<% 
mmm.put("title",ptitle); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/shuiguo_shop/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/shuiguo_shop/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('uphd.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('fbhd.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
