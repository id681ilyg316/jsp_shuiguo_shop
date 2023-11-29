<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="dao.CommDAO"/>
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
<%
HashMap tuser = (HashMap)session.getAttribute("user");
CommDAO dao = new CommDAO();
String id = (String)tuser.get("id");
 %>
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
<TABLE height=300 cellSpacing=0 cellPadding=0 width="44%" align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=2 height=300></TD>
    <TD width="732" vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD class=gray999 bgColor=#cccccc height=1></TD></TR>
        <TR>
          <TD height=9></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" 
            background=  border=0>
              <TBODY>
              <TR>
                <TD background= height=27>
                  <TABLE cellSpacing=0 cellPadding=0 width=730 align=center 
                  border=0>
                    <TBODY>
                    </TBODY></TABLE></TD></TR>
              <TR>
                <TD height=10>
                  <TABLE cellSpacing=2 cellPadding=3 width="99%" align=center 
                  bgColor=#ffffff border=0>
                    <TBODY>
                    <TR>
                      <TD class=orangelight align=center width=500 
                        bgColor=#F6E1DE>水果名称</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight><LABEL>水果价格</LABEL></TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>订货数量</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>相关图片</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>送货地址</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>送货方式</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>支付方式</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>联系电话</TD>
                      <TD width="500" align=center 
                        bgColor=#F6E1DE class=orangelight>状态</TD>
                    </TR>
                    
                    
                    <%
String dpagee = request.getParameter("dpagee")==null?"1":request.getParameter("dpagee");

int dpage = Integer.parseInt(dpagee); 

String sql = "select a.*,c.num,c.state,c.shdz,c.shfs,c.zffs,c.lxdh from pros a,bookorder c where  a.id=c.bid and c.uid='"+tuser.get("id")+"' order by c.state";

int records = dao.select(sql).size();
int pages = 0;
if(records%5==0)pages=records/5;
if(records%5!=0)pages=records/5+1;
if(dpage<1)dpage=1;
if(dpage>pages)dpage=pages;

PageManager pageManager = PageManager.getPage("/shuiguo_shop/fcdd.jsp?1=1", 10, request);
										pageManager.doList(sql);

										PageManager bean = (PageManager) request.getAttribute("page");
										ArrayList<HashMap> list = (ArrayList) bean.getCollection();
									
				      for(HashMap p:list)
				      {
				      System.out.println(p);
					  String state = "";
					  if(((String)p.get("state")).equals("0"))
					  {
					  state = "对方未处理";
					  }
					  if(((String)p.get("state")).equals("1"))
					  {
					  state = "对方已接收并发货";
					  }
					  if(((String)p.get("state")).equals("2"))
					  {
					  state = "对方已拒绝";
					  }
					  
                     %>
                  
                  <TR>
                      <TD width="500" align=center ><a href="bookxiang.jsp?id=<%=p.get("id") %>" target="_blank"><%=p.get("proname")%></a></TD>
                      <TD width="500" align=center ><%=p.get("mprice") %>元 - <%=p.get("discount").equals("不打折")?"不打折":p.get("discount")+"折" %></TD>
                       <TD width="500" align=center ><%=p.get("num") %>件</TD>
                       <TD width="500" align=center  ><img src="/shuiguo_shop/upfile/<%=p.get("filename") %>" height="60" /></TD>
                         <TD width="500" align=center  ><%=p.get("shdz") %></TD>
                         <TD width="500" align=center  ><%=p.get("shfs") %></TD>
                         <TD width="500" align=center  ><%=p.get("zffs") %></TD>
                         <TD width="500" align=center  ><%=p.get("lxdh") %></TD>
                         <TD width="500" align=center class=orangelight STYLE1><%=state %></TD>
                    </TR>
                    <%
                    }
                     %>
                    
                    
                    
                    
                    
                    
                    
                    <TR>
                      <TD height="31" colspan="9" align=center 
bgColor=#F6E1DE class=selectcity>

${page.info }

</TD>
                      </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM>
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      <jsp:include page="foot.jsp"></jsp:include>
                      
                      </BODY></HTML>
<script type='text/javascript' src='/sxy/dwr/engine.js'></script>
<script type='text/javascript' src='/sxy/dwr/util.js'> </script>
<script type='text/javascript' src='/sxy/dwr/interface/Sysuser.js'> </script>