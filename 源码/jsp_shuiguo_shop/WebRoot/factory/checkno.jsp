<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String table = request.getParameter("table")==null?"":request.getParameter("table");
String col = request.getParameter("col")==null?"":request.getParameter("col");
String value = request.getParameter("value")==null?"":request.getParameter("value");
String checktype = request.getParameter("checktype")==null?"":request.getParameter("checktype");
if(checktype.equals("insert"))
{
value = Info.getGBKStr(value);
System.out.println(value);
List list = new CommDAO().select("select * from "+table+" where "+col+"='"+value+"'");
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}

if(checktype.equals("update"))
{
String id = request.getParameter("id")==null?"":request.getParameter("id");
value = Info.getGBKStr(value);
System.out.println(value);
List list = new CommDAO().select("select * from "+table+" where "+col+"='"+value+"' and id!="+id);
System.out.println("select * from "+table+" where "+col+"='"+value+"' and id!="+id);
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}

%>