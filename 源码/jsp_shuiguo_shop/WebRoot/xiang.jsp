<%@ page language="java" import="java.util.*,java.text.* " contentType="text/html;charset=utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0034)http://www.huachu.com.cn/index.asp -->
<HTML><HEAD><TITLE>果蔬购物网站</TITLE>
<LINK href=/shuiguo_shop/yyfiles/ys1.css type=text/css rel=stylesheet>

<STYLE type=text/css>
.STYLE4 {font-size: 18px}
.STYLE5 {
	font-size: 24px;
	font-weight: bold;
}
</STYLE>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR></HEAD>

<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<STYLE type=text/css>.style1 {
	COLOR: #ffff00
}
</STYLE>
<jsp:include page="top.jsp"></jsp:include>

<TABLE cellSpacing=0 cellPadding=0 width=779 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=779>
      <TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
        <TBODY>
        <TR>
          <TD height=5></TD></TR>
        <TR>
          <TD height=13>            </TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width=100% align=center 
              border=0><TBODY>
              <TR>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width=100% align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=529><span class="STYLE4" style="color:#CC6633">水果详情</span></TD>
                      <TD vAlign=bottom width=38>&nbsp;</TD>
                    </TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR bgColor=#cecfce>
                      <TD colSpan=2 height=1></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD align=middle><table cellspacing=0 cellpadding=3 width="100%" border=0>
                  <tbody>
                    <tr>
                                
			<!--=======================================================-->	
			<%
			CommDAO dao = new CommDAO();
            String id = request.getParameter("id");
            HashMap h = dao.select("select * from pros where id="+id).get(0);
			%>
				<td width="76%">	  
					  <table cellspacing=0 cellpadding=2 width="100%" border=0>
                          <tbody>
                          
                          
                      
                          
                          
                            
                            <tr>
                              <td width="32%" height="37" align="center"><span class="STYLE5"><%=h.get("proname") %></span></td>
                              </tr>
                          </tbody>
                      </table>				</td>
			 </tr>
                    
                    
                    
                    
                    
                     
                     
                     <tr>
                                
			
				<td width="76%">	  
					  <table cellspacing=0 cellpadding=2 width="100%" border=0>
                          <tbody>
                          
                          
                      
                          
                          
                            
                            <tr>
                              <td width="76%">&nbsp;&nbsp;
                              
                              <a href="javascript:car('<%=h.get("id") %>')"><font color=#ff6600 style="FONT-FAMILY: 华文行楷;font-size: 21px"><strong>放入购物车</strong></font></a>
                              <script type="text/javascript">
                                function car(no)
							    {
							     <%
							    HashMap map = (HashMap)session.getAttribute("user");
							    if(map==null)
							    {
							    %>
							    alert("请先登录");
							    return;
							    <%
							    }
							    %>
							    
							 
                  var pop=new Popup({ contentType:1,isReloadOnClose:false,width:240,height:108});
                  pop.setContent("contentUrl","/shuiguo_shop/num.jsp?id="+no);
                  pop.setContent("title","输入数量");
                  pop.build();
                  pop.show();
                 
							    
							   // fcar.action='/shuiguo_shop/servlet/Bookcar?bookid='+no; 
							  //  fcar.submit();
							  //  alert("已放入购物车");
							    }
                              </script>                              </td>
                              <td width="24%" rowspan="6" align="center"><img height=100 src="/shuiguo_shop/upfile/<%=h.get("filename") %>" align=left border=0></td>
                            </tr>    
                            
                            
                            <tr>
                              <td width="76%">&nbsp; 保质期：<font 
                              color=#ff0000>
                                  <%=h.get("cpcj") %></font></td>
                              </tr>
                              
                              <tr>
                              <td width="76%">&nbsp; 产地：<font 
                              color=#ff0000>
                                  <%=h.get("cand") %></font></td>
                              </tr>                      
                           
                            <tr>
                              <td width="76%">
                              &nbsp;&nbsp;价格：<font color=#ff0000><%=h.get("mprice") %>￥</font> 
                              &nbsp;&nbsp;&nbsp;&nbsp;折扣：<font color=#ff0000><%=!h.get("discount").equals("不打折")?h.get("discount")+" 折":"不打折" %></font>
                              
                              
                              </td>
                              </tr>
                            <tr>
                              <td width="76%">&nbsp;&nbsp;上架时间：<font 
                              color=><%=((String)h.get("savetime")).substring(0,10) %></font></td>
                              </tr>
                             <tr>
                              <td width="76%">&nbsp;&nbsp;类别：<font 
                              color=><%=h.get("protype") %></font></td>
                              </tr>
                              
                              
                              
                              <tr>
                              <td width="52%">&nbsp;&nbsp;水果评级：<font 
                              color=>
                              
                           <%
                           int jj = dao.getInt("select avg(pj) from pinj where proid='"+id+"'");
                           for(int i=0;i<jj;i++)
                           {
                            %>   
                              ☆
                            <%} %>  
                              
                              </td>
                              </tr>
                              
                          </tbody>
                      </table>				</td>
			 </tr>
             
             
             
             
             
             <tr>
                              <td width="76%">
                              <font color=#ff6600>&nbsp;&nbsp;&nbsp;<%=h.get("pcontent") %></font></td>
                            </tr>
                      
                      
                        <%
                    for(HashMap pmap:dao.select("select * from pinlun where proid="+id))
                      {
                       %>   
               <tr>
                  <td width="" align="left">
                  <%=pmap.get("saver") %> ( <%=pmap.get("savetime") %> ) 评论:<br /><%=pmap.get("content") %> 
                   </td>
                </tr>          
                       <%} %>  
                      
                         
                         
                      <%
                      if(Info.getUser(request)!=null)
                      {
                       %>   
               <tr>
                  <td width="" align="center">
                 <c:if test="${ sessionScope.user ne null }">
                  <form action="/shuiguo_shop/shuiguo_shop?ac=addpinlun&proid=<%=id %>" method="post">
                  <textarea rows="3" cols="40" name="pcontent"></textarea><br />
                  
                  <input type="submit" value="发表评论">
                <br /> <br /> 
                  
                <%
                if(dao.select("select * from pinj where saver='"+Info.getUser(request).get("uname")+"' and proid='"+id+"'").size()==0)
                {
                 %>  
                  评级 : <a href="/shuiguo_shop/shuiguo_shop?ac=pinj&proid=<%=id %>&pj=5">☆☆☆☆☆</a> &nbsp;&nbsp;&nbsp;
		                 <a href="/shuiguo_shop/shuiguo_shop?ac=pinj&proid=<%=id %>&pj=4"> ☆☆☆☆</a> &nbsp;&nbsp;&nbsp;
		                 <a href="/shuiguo_shop/shuiguo_shop?ac=pinj&proid=<%=id %>&pj=3"> ☆☆☆</a> &nbsp;&nbsp;&nbsp;
		                  <a href="/shuiguo_shop/shuiguo_shop?ac=pinj&proid=<%=id %>&pj=2">☆☆</a> &nbsp;&nbsp;&nbsp;
		                 <a href="/shuiguo_shop/shuiguo_shop?ac=pinj&proid=<%=id %>&pj=1"> ☆</a> &nbsp;&nbsp;&nbsp;
                  <%} %>
                  </form>
                  </c:if>
                  
                  <c:if test="${ sessionScope.user eq null }">
                   <h1>登陆后才可以发表评论</h1>
                  </c:if>
                   </td>
                </tr>          
                       <%} %>  
                         
                         
                         
                         
                         
                         
                          </tbody>
                      </table>				</td>
			 </tr>
			 
			 
			 
			 
			 
			 
			 
                     
                     
                    
                    
                    
                  </tbody>
                </table></TD>
              </TR>
              
             
              
              </TBODY></TABLE></TD></TR>
    
  <iframe width="0" height="0" frameborder="0" src="" name="tobookcar"></iframe>
<form action="" name=fcar target="tobookcar"></form>
<TABLE cellSpacing=0 cellPadding=0 width=779 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=100%>
<jsp:include page="foot.jsp"></jsp:include>
<MAP 
name=Map>
        
      </MAP></BODY></HTML>
