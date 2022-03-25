<%-- 
    Document   : deleteproduct
    Created on : Mar 9, 2022, 9:37:13 PM
    Author     : ADMIN
--%>

<%@page import="DAO.ProductDAO"%>
<%
    String id = request.getParameter("id");
    ProductDAO pro = new ProductDAO();
    pro.delete(Integer.valueOf(id));
    response.sendRedirect("ManagerProduct.jsp");
    
%>