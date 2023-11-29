<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="dao.CommDAO"/>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0061)http://www.sqjia.com/sqejia/web/familymanage/updatemember.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>Head</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="shop/globle.css" type=text/css rel=stylesheet><LINK 
href="shop/head.css" type=text/css rel=stylesheet><LINK 
href="shop/copyright.css" type=text/css rel=stylesheet>
<SCRIPT src="shop/engine.js" type=text/javascript></SCRIPT>

<SCRIPT src="shop/util.js" type=text/javascript> </SCRIPT>

<SCRIPT src="shop/ejproselect.js" type=text/javascript></SCRIPT>

<SCRIPT src="shop/bwuhan.js" type=text/javascript> </SCRIPT>

<SCRIPT src="shop/unamecheck.js" type=text/javascript> </SCRIPT>

<SCRIPT language=javascript>
<!--
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight; return;}}} 

}

//-->
</script>

<SCRIPT src="shop/checkpass.js" type=text/javascript></SCRIPT>
<LINK href="shop/head.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.6000.16981" name=GENERATOR>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</HEAD>
<BODY>
<jsp:include page="top.jsp"></jsp:include>
<FORM action=/sxy/school.action?methods=fbsp method=post name=f1 enctype="multipart/form-data">


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
          <TD height=2>            </TD></TR>
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
                      <TD width=529>
                      
                      
                      <a href="/shuiguo_shop/"><span class="STYLE4" style=" color:#CC6633">最新水果</span></a>
                      <%
                      CommDAO dao = new CommDAO();
                      List<HashMap> typelist = dao.select("select * from protype");
                      for(HashMap m:typelist){
                       %>
                      &nbsp;&nbsp;&nbsp;&nbsp; 
                      <a href="/shuiguo_shop/index.jsp?f=f&key=<%=m.get("typename") %>"><span class="STYLE4" style=" color:#CC6633"><%=m.get("typename") %></span></a>
                      <%} %>
                      
                       &nbsp;&nbsp;&nbsp;&nbsp; 
                      <a href="/shuiguo_shop/hdxx.jsp"><span class="STYLE4" style=" color:red">查看最新动态</span></a>
                      
                      
                      </TD>
                      <TD vAlign=bottom width=38>&nbsp;</TD>
                    </TR>
                    <TR>
                      <TD colSpan=2 height=5></TD></TR>
                    <TR bgColor=#cecfce>
                      <TD colSpan=2 height=1></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD align=middle><table cellspacing=0 cellpadding=3 width="100%" border=0>
                  <tbody>
                  
                                
			<!--=======================================================-->	
			<%
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 

String ptype = request.getParameter("ptype");if(ptype==null)ptype="";
String key = request.getParameter("key");if(key==null)key="";
if(request.getParameter("f")!=null)
key = Info.getUTFStr(key);

String sql = "select * from mixinfo a where 1=1 ";


if(!key.equals(""))
{
sql+=" and (a.proname like'%"+key+"%' or a.protype like'%"+key+"%' or a.content like'%"+key+"%' ) ";
}

sql+="order by a.id desc ";

  int i=0;
PageManager pageManager = PageManager.getPage("/shuiguo_shop/hdxx.jsp?1=1",4, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> list=(ArrayList)bean.getCollection();
for(HashMap h:list)
{
                                i++;
			%>
			
			  <tr>
				<td>	  
					  <table cellspacing=0 cellpadding=2 width="100%" border=0>
                          <tbody>
                            <tr>
                              <td height=10></td>
                            </tr>
                            <tr>
                              <td width="13%" rowspan=4>
                              <img height=80 width="90" src="/shuiguo_shop/upfile/<%=h.get("filename") %>" align=left border=0></td>
                              <td width="87%" align="left"><a href="/shuiguo_shop/hdxiang.jsp?id=<%=h.get("id")%>" >
                              <font color=#ff6600><%=h.get("title") %></font></a></td>
                            </tr>                          
                           
                            <tr>
                              <td width="87%" align="left" valign="top">
                              
                          <%= Info.subStr(Info.filterStrIgnoreCase(h.get("content").toString(),"<",">"),220)   %>

                            </td>
                            </tr>
                          </tbody>
                      </table>				</td>
			
                             
                    </tr>
                    
                    
                       <%
                                }
                                 %>
                    
                    
                     <tr>
     
			              <td height="37" align="center" colspan="4" >	  
					
					${page.info }
					
					                  	</td>
			
                    </tr>
                    
                    
                    
                    
                  </tbody>
                </table></TD>
              </TR>
              
             
              
              </TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD>
    
  </TR></TBODY></TABLE>
  
                      
                      
                      
                      <jsp:include page="foot.jsp"></jsp:include>
                      
                      </BODY></HTML>
<script type='text/javascript' src='/sxy/dwr/engine.js'></script>
<script type='text/javascript' src='/sxy/dwr/util.js'> </script>
<script type='text/javascript' src='/sxy/dwr/interface/Sysuser.js'> </script>