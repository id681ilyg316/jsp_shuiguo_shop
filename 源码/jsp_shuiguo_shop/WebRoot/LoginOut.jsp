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
<FORM  >


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
                      
                      
                      <a href="/shuiguo_shop/"><span class="STYLE4" style=" color:#CC6633">全部水果</span></a>
                      
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
                    <tr>
                                
			<!--=======================================================-->	
			<%
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 

String ptype = request.getParameter("ptype");if(ptype==null)ptype="";
String key = request.getParameter("key");if(key==null)key="";
String wr = request.getParameter("wr");if(wr==null)wr="";
if(request.getParameter("f")!=null)
key = Info.getUTFStr(key);

String sql = "select * from pros a where status='已上架' ";
 


if(!key.equals(""))
{
sql+=" and (a.proname like'%"+key+"%' or a.protype like'%"+key+"%' or a.pcontent like'%"+key+"%' ) ";
}

sql+="order by a.id desc ";

  int i=0;
PageManager pageManager = PageManager.getPage("/shuiguo_shop/index.jsp?1=1",12, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> list=(ArrayList)bean.getCollection();
for(HashMap h:list)
{
                                i++;
                                String proid = h.get("id").toString();
int ynum = dao.getInt("select count(*) from bookorder where state='0' and bid='"+proid+"'");
String tgrs = dao.select("select* from pros where id='"+proid+"'").get(0).get("tgrs").toString(); 
                                
			%>
				<td  >	  
					  <table cellspacing=0 cellpadding=2 width="229%" border=0>
                          <tbody>
                            <tr>
                              <td height=10></td>
                            </tr>
                            <tr>
                              <td width="18%" rowspan=5>
                              <img height=80 src="/shuiguo_shop/upfile/<%=h.get("filename") %>" width=92 align=left border=0></td>
                              <td width="82%" align="left"><a href="/shuiguo_shop/xiang.jsp?id=<%=h.get("id")%>" >
                              <font color=#ff6600><%=h.get("proname") %> </font></a></td>
                            </tr>                          
                           
                            <tr>
                              <td width="82%" align="left">
                              
                           <font  color=red>单价：<%=h.get("mprice") %></font>
                             
                                  
                                  </td>
                            </tr>
                            <tr>
                              <td width="82%" align="left">保质期：<font 
                              color=><font  color=black><%=h.get("cpcj") %></font></td>
                            </tr>
                             <tr>
                              <td width="82%" align="left">本店折扣：<font 
                              color=><%=!h.get("discount").equals("不打折")?h.get("discount")+" 折":"不打折" %></font></td>
                            </tr>
                          </tbody>
                      </table>				</td>
			 <%
                                if(i%3==0)
                                {%>
                                </tr><tr>
                                <%
                                }
                                }
                                 %>
                    </tr>
                    
                    
                    
                    
                    
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