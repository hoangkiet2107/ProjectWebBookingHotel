<%-- 
    Document   : deleteOrder
    Created on : Mar 25, 2022, 2:52:50 AM
    Author     : Admin
--%>

<%@page import="DAO.OrderDAO"%>
<%
    String id = request.getParameter("id");
    OrderDAO pro = new OrderDAO();
    pro.delete(Integer.valueOf(id));
    response.sendRedirect("orderManager.jsp");
    
%>