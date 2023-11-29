<%@ page language="java" import="java.util.*,java.text.* " contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0034)http://www.huachu.com.cn/index.asp -->
<HTML><HEAD><TITLE>果蔬购物网站</TITLE>
<LINK href=/shuiguo_shop/yyfiles/ys1.css type=text/css rel=stylesheet>
<SCRIPT src="/shuiguo_shop/admin/images/popup.js" type=text/javascript> </SCRIPT>
<STYLE type=text/css>
.STYLE4 {font-size: 18px}
</STYLE>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR></HEAD>

<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0><br><STYLE type=text/css>.style1 {
	COLOR: #ffff00
}
</STYLE>
	<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			overflow:hidden;
		}
		.STYLE3 {color: #528311; font-size: 12px; }
		.STYLE4 {
			color: #42870a;
			font-size: 12px;
		}
		-->
		</style>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<%
String id = request.getParameter("id");
 %>
           <form name="f33" action="/shuiguo_shop/servlet/Bookcar?bookid=<%=id %>" >
            <TABLE cellSpacing=0 cellPadding=0 width=180 align=center 
              border=0>
             <%
String suc = request.getParameter("suc");

%>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD>
                  <DIV align=center>
                 <%if(suc==null) {%> 请输入数量
                    <input type="text" id="key"
                  style="BORDER-RIGHT: #999999 1px solid; BORDER-TOP: #999999 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #999999 1px solid; BORDER-BOTTOM: #999999 1px solid; BACKGROUND-COLOR: #f9fcff" 
                   name=num><br>
                   
                   <script type="text/javascript">
                   function sub()
                   {
                   
                   f33.submit();
                   }
                   </script>
                   
                 <br>  <span onclick="sub();" style="cursor: hand"> 提交</span>
                 <%}else{ %><br/> 
                 已放入放购物车<br>
                 <br>
                 <span onclick="window.parent.location.replace('car.jsp')" style="cursor: hand"> 购买</span>
                 <span onclick="popclose()" style="cursor: hand"> 继续逛逛</span>
                 <%} %>
                 
                 
                    <script type="text/javascript">
                  
                    </script>
                    
			      </DIV></TD></TR>
            
              <TR>
                <TD height=7></TD></TR>
                </TABLE>
             
                
                
                
                
                
                
                </form>
                
          
          
          </BODY></HTML>
