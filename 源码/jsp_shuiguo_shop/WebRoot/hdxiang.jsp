<%@ page language="java" import="java.util.*,java.text.* " contentType="text/html;charset=utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
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
                      <TD width=529><span class="STYLE4" style="color:#CC6633">活动详情</span></TD>
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
            HashMap h = dao.select("select * from mixinfo where id="+id).get(0);
			%>
				<td width="76%">	  
					  <table cellspacing=0 cellpadding=2 width="100%" border=0>
                          <tbody>
                          
                          
                      
                          
                          
                            
                            <tr>
                              <td  height="37" align="center"><span class="STYLE5"><%=h.get("title") %></span></td>
                              </tr>
                              
                              <tr>
                              <td  height="37" align="center"><img height=130 src="/shuiguo_shop/upfile/<%=h.get("filename") %>"   border=0></td>
                              </tr>
                              
                              <tr>
                              <td  height="37" align=""><span class=""><%=h.get("content") %></span></td>
                              </tr>
                              
                          </tbody>
                      </table>				</td>
			 </tr>
                    
                    
                    
                    
                    
                     
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
