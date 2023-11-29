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
<script language="javascript" src="/sys/theme/calendar/WdatePicker.js"></script>
</head>

<body>
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
new CommDAO().commOper("update bookorder set state='"+state+"' where id="+upid);

if(state.equals("1"))
{
int num = Integer.parseInt(request.getParameter("num"));
int price = Integer.parseInt(request.getParameter("price"));
int jf = num*price;
String uid = request.getParameter("uid");
dao.commOper("update buser set jf=0 where id="+uid+" and jf is null ");
dao.commOper("update buser set jf=jf+"+jf+" where id="+uid+" ");


}

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
 
  <form action="/shuiguo_shop/admin/hygl.jsp" name="f1" method="post">
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
                    <td width="126" align="center" class="main_title_td_center2">用户</td>
                    <td width="323" align="center" class="main_title_td_center2">水果名</td>
                    <td width="105" align="center" class="main_title_td_center2">单价</td>
                    <td width="86" align="center" class="main_title_td_center2">数量</td>
                    <td width="230" align="center" class="main_title_td_center2">水果图片</td>
                    <td width="174" align="center" class="main_title_td_center2">发送时间</td>
                    <td width="261" align="center" class="main_title_td_center2">操作</td>
                    <td width="90" align="center" class="main_title_td_center2">删除</td>
                  </tr>
              <%
             
           
              String sql = "select a.*,b.typename,c.num,c.state,c.savetime as stime,c.id as did,c.uid ,d.uname from books a,booktype b,bookorder c,buser d where c.uid=d.id and a.booktype=b.id and a.id=c.bid and c.state='0'  order by c.id desc ";
              
              List<HashMap> list = dao.select(sql);
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
               <tr id="<%=i %>" style="display:<%=style %>"  >
                 <td width="126" align="center" valign="middle" class="main_matter_td"><%=t.get("uname") %></td>
                 <td width="323" align="center" valign="middle" class="main_matter_td"><%=t.get("bookname")  %></td>
                 <td width="105" align="center" valign="middle" class="main_matter_td"><%=t.get("price")  %></td>
                 <td width="86" align="center" valign="middle" class="main_matter_td"><%=t.get("num")  %></td>
                 <td width="230" align="center" valign="middle" class="main_matter_td"><img src="/shuiguo_shop/upfile/<%=t.get("img")  %>" height="60" /></td>
                 <td width="174" align="center" valign="middle" class="main_matter_td"><%=t.get("stime") %></td>
                 <td width="261" align="center" valign="middle" class="main_matter_td"><a href="/shuiguo_shop/admin/ckdd.jsp?upid=<%=t.get("did") %>&state=1&price=<%=t.get("price") %>&num=<%=t.get("num") %>&uid=<%=t.get("uid") %>">接受并发货</a>&nbsp;|&nbsp;<a href="/shuiguo_shop/admin/ckdd.jsp?upid=<%=t.get("did") %>&state=2">拒绝</a></td>
                 <td width="90" align="center" valign="middle" class="main_matter_td"><a href="/shuiguo_shop/admin/ckdd.jsp?did=<%=t.get("did") %>">删除</a></td>
               </tr>
              <%
              }
               %>
               
               
                <script language=javascript>
                 function update(no) 
                 {
                  var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:258});
                  pop.setContent("contentUrl","/shuiguo_shop/admin/upmember.jsp?id="+no);
                  pop.setContent("title","修改会员信息");
                  pop.build();
                  pop.show();
                 }
                 </script>
               
               
             <tr>
                
                  
                    <td height="32" align="center" colspan="8"  class="main_matter_td">
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
                
                  
                    <td  align="center"  class="main_matter_td">c<!--   当前第&nbsp;
                    
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
<script language=javascript>
var page = 1;
var pages = <%=pages%>;
function sy()
{
page = 1;
fenye();
}


function syy()
{
page = page-1;
if(page<1)
{
page = 1;
}
fenye();
}



function xyy()
{
page = page+1;
if(page>pages)
{
page = pages;
}
fenye();
}

function wy()
{
page = pages;
fenye();
}

function fenye()
{
for(a=1;a<(pages*10+1);a++)
{
var d = document.getElementById(a);
if(d==null)
{
continue;
}
if((a==(page-1)*10+1||a>(page-1)*10+1)&&a<page*10+1)
{
d.style.display="";
}else
{
d.style.display="none";
}
}

var bb = document.getElementById("dpage");

bb.innerHTML = page;
}

</script>
<script language="javascript" src="/shuiguo_shop/shop/popup.js"></script>
<script type="text/javascript">
var pages = <%=pages%>;
</script>
<script language=javascript src="/shuiguo_shop/admin/images/fy.js"></script>
