<%@ page language="java" %>

<%
    session.invalidate();

    response.sendRedirect("admin_dashboard.jsp");
%>
