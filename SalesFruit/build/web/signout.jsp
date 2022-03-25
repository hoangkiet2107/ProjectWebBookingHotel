<%-- 
    Document   : signout
    Created on : Mar 11, 2022, 11:05:55 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("user");
    response.sendRedirect("signin.jsp");
%>
