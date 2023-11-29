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

 
  <form  action="spgl.jsp"  name="f1" method="post">
  
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
   <tr> 
          <td colspan=11 height="26" align="left" bgcolor="#FFFFFF" class="">&nbsp;&nbsp;&nbsp;
<% 
String pproname = request.getParameter("proname")==null?"":request.getParameter("proname"); 
String startproname = request.getParameter("startproname")==null?"":request.getParameter("startproname"); 
String endproname = request.getParameter("endproname")==null?"":request.getParameter("endproname"); 
String pprotype = request.getParameter("protype")==null?"":request.getParameter("protype"); 
String startprotype = request.getParameter("startprotype")==null?"":request.getParameter("startprotype"); 
String endprotype = request.getParameter("endprotype")==null?"":request.getParameter("endprotype"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;&nbsp;
水果名称 
&nbsp;:&nbsp; 
<input type=text class=''  size=20 name='proname' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
水果类别 
&nbsp;:&nbsp; 
<%=Info.getselect("protype","protype","typename"," 1=1 ")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

<input type=submit class='' value='查询信息' />
 &nbsp;&nbsp;
<input type=button   class='' value='添加信息' onclick="window.location.replace('fbsp.jsp')" /> 
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
            <td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">水果名称</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">保质期</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">产地</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">水果类别</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">价格</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">库存量</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">折扣</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">状态</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">发布时间</td>
<td width="" height="22" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">操作</td>
            </tr>

          
          <% 
new CommDAO().delete(request,"pros"); 
if(request.getParameter("statusid1")!=null){ 
 new CommDAO().commOper("update pros set status ='已上架' where id="+request.getParameter("statusid1"));  
} 
if(request.getParameter("statusid2")!=null){ 
 new CommDAO().commOper("update pros set status ='已下架' where id="+request.getParameter("statusid2"));  
} 
String sql = "select * from pros where 1=1 " ;
 if(!pproname.equals("")){ 
 sql+= " and proname like'%"+pproname+"%' " ;
 }  
 if(!startproname.equals("")){  
 mmm.put("startproname",startproname) ;
 sql+= " and proname >'"+startproname+"' " ;
 }  
 if(!endproname.equals("")){  
 mmm.put("endproname",endproname) ;
 sql+= " and proname <'"+Info.getDay(endproname,1)+"' " ;
 }  
 if(!pprotype.equals("")){ 
 sql+= " and protype like'%"+pprotype+"%' " ;
 }  
 if(!startprotype.equals("")){  
 mmm.put("startprotype",startprotype) ;
 sql+= " and protype >'"+startprotype+"' " ;
 }  
 if(!endprotype.equals("")){  
 mmm.put("endprotype",endprotype) ;
 sql+= " and protype <'"+Info.getDay(endprotype,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "spgl.jsp?1=1&proname="+pproname+"&protype="+pprotype+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>
 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("proname")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("cpcj")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("cand")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("protype")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("mprice")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("tgrs")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("discount")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("status")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class=""><%=map.get("savetime")%></td> 
          <td height="26" align="center" bgcolor="#FFFFFF" class="">
<a href="spgl.jsp?value=已上架&statusid1=<%=map.get("id")%>">上架</a>
&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="spgl.jsp?value=已下架&statusid2=<%=map.get("id")%>">下架</a>
&nbsp;&nbsp;|&nbsp;&nbsp;

<a href="upsp.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="spgl.jsp?scid=<%=map.get("id")%>">删除</a>
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
            <td colspan=11 height="29" align="center" nowrap="nowrap">${page.info}</td>
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
mmm.put("proname",pproname); 
mmm.put("protype",pprotype); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/shuiguo_shop/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/shuiguo_shop/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('upsp.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('fbsp.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
