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
<script language="javascript" src="/sys/theme/calendar/WdatePicker.js"></script>
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
   <%
   CommDAO dao = new CommDAO();
                 String tjid = request.getParameter("tjid");
                 if(tjid!=null)
                 {
                 String tj = request.getParameter("tj");
                 dao.commOper("update books set tj='"+tj+"' where id="+tjid);
                 }
                  %>
   <%
   String sbname = request.getParameter("sbname");
   if(sbname==null)sbname="";
   String typee = request.getParameter("type");
   if(typee==null)typee="";
   String did = request.getParameter("did");
   if(did!=null)
   {
   new CommDAO().commOper("delete from yqlj where id="+did);
   }
   
    %>
  <form action="/shuiguo_shop/servlet/AddYqlj" name="f1" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="6" colspan="2"></td>
            </tr>
            <tr>
              <td width="118" class="main_title_td_center"> 信息列表</td>
              <td class="main_title_td_bg">&nbsp;</td>
            </tr>
          </table>        
				<table width="100%" border="0" 
            cellspacing="0" style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
                  <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                    <td width="74" align="center" class="main_title_td_center2">编号</td>
                    <td width="153" align="center" class="main_title_td_center2">书名</td>
                   
                    <td width="139" align="center" class="main_title_td_center2">类别</td>
                    <td width="94" align="center" class="main_title_td_center2">价格</td>
                    <td width="118" align="center" class="main_title_td_center2">发行时间</td>
                    <td width="137" align="center" class="main_title_td_center2">作者</td>
                    <td width="60" align="center" class="main_title_td_center2">推荐</td>
                    <td width="60" align="center" class="main_title_td_center2">修改</td>
                    <td width="60" align="center" class="main_title_td_center2">删除</td>
                  </tr>
           <%
           
           List<HashMap> list = dao.select("select a.*,b.typename from books a,protype b where a.protype=b.id order by a.id desc");
          int pages =  0;
                if(list.size()%10==0)pages=list.size()/10;
                if(list.size()%10!=0)pages=list.size()/10+1;
                
                int i = 0;
                for(HashMap t:list)
                {
               
                i++;
                String style = "none";
                if(i<11)
                {
                style = "";
                }
                 %>
               <tr id="<%=i %>" style="display:<%=style %>"  
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                    <td width="74" align="center" valign="middle" class="main_matter_td">
                    <%=t.get("bookno") %>                    </td>
                    <td width="153" align="center" valign="middle" class="main_matter_td">
                    <a href="<%=t.get("qyurl") %>" target="_blank" >
                    <%=t.get("bookname") %>                    </a>                    </td>
                 
                    <td width="139" align="center" valign="middle" class="main_matter_td"><%=t.get("typename") %></td>
                    <td width="94" align="center" valign="middle" class="main_matter_td"><%=t.get("price") %></td>
                    <td width="118" align="center" valign="middle" class="main_matter_td"><%=t.get("fxtime") %></td>
                    <td width="137" align="center" valign="middle" class="main_matter_td"><%=t.get("author") %></td>
                 <td width="60" align="center" valign="middle" class="main_matter_td">
                 
                
                 
                 <%
                 if(((String)t.get("tj")).equals("0"))
                 {
                  %>
                 <a href="/shuiguo_shop/admin/spgl.jsp?tj=1&tjid=<%=t.get("id") %>">推荐</a>
                 <%
                 }
                  %>
                  
                  
                  <%
                 if(((String)t.get("tj")).equals("1"))
                 {
                  %>
                 <a href="/shuiguo_shop/admin/spgl.jsp?tj=0&tjid=<%=t.get("id") %>"><font color="red">取消</font></a>
                 <%
                 }
                  %>
                 
                 
                 </td>
                 <td width="60" align="center" valign="middle" class="main_matter_td"><a href="javascript:update('<%=t.get("id") %>')">修改</a></td>
                 <td width="60" align="center" valign="middle" class="main_matter_td"><a href="/shuiguo_shop/admin/upyqlj.jsp?did=<%=t.get("id") %>">删除</a></td>
               </tr>
              <%
              }
               %>
               
                <tr>
                
                  
                    <td height="32" align="center" colspan="15"  class="main_matter_td">
                    <font color="#0066CC">
                    当前第&nbsp;
                    
                    <font color="red"><div id="dpage" style="display: inline;">1</div></font>
                    
                    
                    &nbsp;页
                    &nbsp;&nbsp;
                   共&nbsp;<%=pages %>&nbsp;页 &nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="sy()">首页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="syy()">上一页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="xyy()">下一页</label>
&nbsp;&nbsp;
                    <label style="cursor: hand"  onclick="wy()">尾页</label></font></td>
                  </tr>
                </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                
               
              <script language=javascript>
                 function update(id) 
                 {
                  var pop=new Popup({ contentType:1,isReloadOnClose:false,width:450,height:317});
                  pop.setContent("contentUrl","/shuiguo_shop/admin/upsp.jsp?id="+id);
                  pop.setContent("title","修改水果信息");
                  pop.build();
                  pop.show();
                 }
               </script>
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
<script type="text/javascript">
var pages = <%=pages%>;
</script>
<script language=javascript src="/shuiguo_shop/admin/images/fy.js"></script>
