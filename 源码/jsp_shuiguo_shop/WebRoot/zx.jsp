<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    
    <title>My JSP 'zx.jsp' starting page</title>
    
	

  </head>
  
  <body>
    <%
    session.removeAttribute("user");
    request.getRequestDispatcher("index.jsp").forward(request,response);
     %>
  </body>
</html>
