<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="dao.CommDAO"/>
<jsp:directive.page import="util.Info"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns=""><HEAD><TITLE>果蔬购物网站欢迎你</TITLE>




<META content="MSHTML 6.00.6000.16981" name=GENERATOR>
<style type="text/css">
<!--
.STYLE3 {font-size: 14px}
-->
</style>
</HEAD>
<BODY ><LINK href="shop/head.css" 
type=text/css rel=stylesheet>


<jsp:include flush="true" page="top.jsp"></jsp:include>

<%
CommDAO dao = new CommDAO();
HashMap user = (HashMap)session.getAttribute("user");
String clear = request.getParameter("clear");
String fs = request.getParameter("fs");
if(clear!=null)
{
dao.commOper("delete from bookcar where uname='"+user.get("id")+"'");
}



String did = request.getParameter("did");
if(did!=null)
{
dao.commOper("delete from bookcar where uname='"+user.get("id")+"' and bookid='"+did+"'");
}

String sql = "select a.*,c.booknum,c.bookid,c.uname from pros a,bookcar c where  a.id=c.bookid and c.uname='"+user.get("id")+"'";

List<HashMap> list = dao.select(sql);











if(fs!=null)
{

for(HashMap h:list)
{
dao.commOper("insert into bookorder(uid,bid,num,savetime,state) values('"+h.get("uname")+"','"+h.get("bookid")+"','"+h.get("booknum")+"','"+Info.getDateStr()+"','0')");
}
dao.commOper("delete from bookcar where uname='"+user.get("id")+"'");

%>

<script type="text/javascript">
alert("订单已发送,请等待管理员回应");
window.location.replace("/shuiguo_shop/");
</script>

<%
}

 %>

<TABLE cellSpacing=0 cellPadding=0 width=950 align=center border=0>
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
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
           

          </TD>
        </TR>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
            

           

            <TABLE cellSpacing=0 cellPadding=0 width="100%" 
            background=shop/02side(1).gif border=0>
              <TBODY>
             
              <TR>
                <TD>
                  <TABLE cellSpacing=5 cellPadding=3 width="98%" align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD align=left width="33%">
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" 
border=0>
                          <TBODY>
                          <TR>
                            <TD class=menutitle1>
                              <TABLE cellSpacing=5 cellPadding=3 width="98%" 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                
                                
                                
                                <%
                                int i=0;
                                double ztotal = 0;
                                double ztotalz = 0;
                                for(HashMap h:list)
                                {
                                i++;
                                int dj = Integer.parseInt((String)h.get("mprice")) ;
                                int booknum =  Integer.parseInt((String)h.get("booknum")) ;
                                int dtotal = 0;
                                if(!h.get("discount").equals("不打折"))
                                 dtotal = ((dj*booknum)/10)*Integer.parseInt(h.get("discount").toString());
                                ztotal+=dtotal;
                                
                                 int dtotalz =  dj*booknum ;
                                ztotalz+=dtotalz;
                                 %>
                                <TD align=left width="33%">
                                <TABLE cellSpacing=0 cellPadding=0 width="100%" 
                                border=0>
                                <TBODY>
                                <TR>
                                <TD width="38%" rowspan="4" class=menutitle1><img src="/shuiguo_shop/upfile/<%=h.get("filename") %>" width="70" height="67" /></TD>
                                <TD width="62%" height="19" class=menutitle1><a class=orange 
                                href="/shuiguo_shop/xiang.jsp?id=<%=h.get("id") %>" >
                                <%=h.get("proname") %>(<%=h.get("booknum") %>)</a></TD>
                                </TR>
                                <TR>
                                <TD class=menutitle2 height="19" >价格:<%=h.get("mprice") %>
                               
                                  
                                </TD>
                                </TR>
                                
                                 <TR>
                                <TD class=menutitle2 height="19" >
                               
                               折扣:<%=!h.get("discount").equals("不打折")?h.get("discount")+" 折":"不打折" %>
                                
                                </TD>
                                </TR>
                                
                                <TR>
                                  <TD class=menutitle2 height="19" ><a href="car.jsp?did=<%=h.get("id") %>">移出购物车</a></TD>
                                </TR>
                                </TBODY></TABLE></TD>
                                <%
                                if(i%3==0)
                                {%>
                                </tr><tr>
                                <%
                                }
                                }
                                 %>
                                
                                
                                
                                </TR>
                                
                                
                                
                                
                                
                                
                                
                                 <TR>
                                <td align="center" colspan="3" height="30">
                                 
                                  <span class="STYLE3">应付款:
                                  <%
                                   if(50000>=ztotal)
                                  {
                                  out.print(ztotal);
                                  }
                                 
                                  %> 
                                  
                                  
                                  </span>&nbsp;&nbsp;&nbsp;
                                
                                <a href="car.jsp?clear=clear"><span class="STYLE3" style="cursor: hand">清空购物车</span></a>
                                
                                  &nbsp;&nbsp;&nbsp;
                                
                                <a href="javascript:fsdd();"><span class="STYLE3" style="cursor: hand">确认发送订单</span></a>
                                
                                <script type="text/javascript">
                                function fsdd()
                                {
                                  var pop=new Popup({ contentType:1,isReloadOnClose:false,width:390,height:190});
                                  pop.setContent("contentUrl","/shuiguo_shop/fs.jsp?tgj=<%=ztotal%>&zhj=<%=ztotalz%>");
				                  pop.setContent("title","发送订单");
				                  pop.build();
				                  pop.show();
                                }
                                </script>
                                
                                
                                 </td>
                                </TR>
                                
                                
                                
                                
                                
                                
                                
                                </TBODY>
                                
                                
                                
                                
                                
                                
                                </TABLE>
                              <A 
                              class=titleblue14 
                              href=""></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD height=1></TD>
        </TR>
        <TR>
          <TD><LINK href="shop/globle.css" type=text/css 
            rel=stylesheet><LINK href="shop/head.css" type=text/css 
            rel=stylesheet><LINK href="shop/copyright.css" 
            type=text/css rel=stylesheet>
         

           </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE><LINK 
href="shop/head.css" type=text/css rel=stylesheet>


<form action="/sxy/school.action?methods=sendorder" target="mainn" name="f22">
<input type="hidden" name="pid" />
<input type="hidden" name="shopid" />
</form>
<script type="text/javascript">
function send(no,sid)
{
f22.pid.value=no;
f22.shopid.value=sid;
alert('订单已发送 ^_^');
f22.submit();
}
</script>
<iframe frameborder="0" name=mainn width="0" height="0"></iframe>


<jsp:include flush="true" page="foot.jsp"></jsp:include>



</BODY></HTML>



