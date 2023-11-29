<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>

<script>
	       var win=window;
            while(win.parent!=window.top)
            {
            	win=win.parent;
            }
            win.parent.location.replace("/shuiguo_shop/LoginOut.jsp");  
</script>