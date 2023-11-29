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
  CommDAO dao = new CommDAO();
String did = request.getParameter("did");
if(did!=null)
{
new CommDAO().commOper("delete from bookorder where id="+did);
}

String upid = request.getParameter("upid");
if(upid!=null)
{
String state = request.getParameter("state");
String num = request.getParameter("num");
if(state.equals("1"))
{
 new CommDAO().commOper("update pros set tgrs=((tgrs+0)-"+num+")+'' where id="+upid); 

}

new CommDAO().commOper("update bookorder set state='"+state+"' where id="+upid);



}

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
            <td width="" height="18" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">用户</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">品名</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">数量</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">单价</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">送货地址</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">送货方式</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">支付方式</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">联系电话</td>
             
            
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">操作</td>
            <td width="" background="/shuiguo_shop/admin/images/tab_14.gif" class="STYLE1">删除</td>
            </tr>

         
         
          <%
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 




String sql = "select a.uname,b.proname,b.mprice,b.id as proid,c.*,b.discount from buser a,pros b,bookorder c where c.state='0' and a.id=c.uid and b.id=c.bid  ";




sql+=" order by c.bid desc ";

int records = dao.select(sql).size();
int pages = 0;
if(records%7==0)pages=records/7;
if(records%7!=0)pages=records/7+1;
if(dpage<1)dpage=1;
if(dpage>pages)dpage=pages;

PageManager pageManager = PageManager.getPage("/shuiguo_shop/ckdd.jsp?1=1", 10, request);
										pageManager.doList(sql);

										PageManager bean = (PageManager) request.getAttribute("page");
										ArrayList<HashMap> list = (ArrayList) bean.getCollection();
for(HashMap h:list)
{
System.out.println(h.toString());
String proid = h.get("bid").toString();
int ynum = dao.getInt("select count(*) from bookorder where state='0' and bid='"+proid+"'");
String tgrs = dao.select("select* from pros where id='"+proid+"'").get(0).get("tgrs").toString(); 
 %>
          <tr> 
          <td width="" height="26" align="left" bgcolor="#FFFFFF" class="">    <%=h.get("uname") %>  </td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class="">       <%=h.get("proname") %>     </td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""> <%=h.get("num") %>件</td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""><%=h.get("mprice") %>元 - <%=h.get("discount").equals("不打折")?"不打折":h.get("discount")+"折" %></td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""><%=h.get("shdz") %></td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""><%=h.get("shfs") %></td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""><%=h.get("zffs") %></td>
          <td width="" height="26" align="center" bgcolor="#FFFFFF" class=""><%=h.get("lxdh") %></td>
           
          
          <td width="" align="center"bgcolor="#FFFFFF"  valign="middle" class="main_matter_td"><a href="/shuiguo_shop/admin/ckdd.jsp?upid=<%=h.get("id") %>&state=1&price=<%=h.get("price") %>&num=<%=h.get("num") %>&uid=<%=h.get("uid") %>&proid=<%=h.get("proid") %>">接受并发货</a>&nbsp;|&nbsp;<a href="/shuiguo_shop/admin/ckdd.jsp?upid=<%=h.get("id") %>&state=2">拒绝</a></td>
                 <td width="" align="center" valign="middle" bgcolor="#FFFFFF"  class="main_matter_td"><a href="/shuiguo_shop/admin/ckdd.jsp?did=<%=h.get("id") %>">删除</a></td>
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

</script>
