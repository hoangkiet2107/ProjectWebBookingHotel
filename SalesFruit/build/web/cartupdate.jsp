<%-- 
    Document   : cartupdate
    Created on : Mar 11, 2022, 11:58:52 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DTO.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        int Id = Integer.valueOf(request.getParameter("id"));
        String action = request.getParameter("action");
        if(action.equals("plus")){
            session = request.getSession();
            ArrayList<OrderDetail> objCartBean = (ArrayList<OrderDetail>) session.getAttribute("cart");
            for (int i = 0; i < objCartBean.size(); i++) {
                if (Id==objCartBean.get(i).getProductID()) {
                    int quan = objCartBean.get(i).getQuantity();
                    objCartBean.get(i).setQuantity(quan+1);
                }
            }
        }else if(action.equals("minus")){
            session = request.getSession();
            ArrayList<OrderDetail> objCartBean = (ArrayList<OrderDetail>) session.getAttribute("cart");
            for (int i = 0; i < objCartBean.size(); i++) {
                if (Id==objCartBean.get(i).getProductID()) {
                    if(objCartBean.get(i).getQuantity() == 1){
                        objCartBean.remove(objCartBean.get(i));
                    }else{
                        int quan = objCartBean.get(i).getQuantity();
                        objCartBean.get(i).setQuantity(quan-1);
                    }
                }
            }
        }else{
            session = request.getSession();
            ArrayList<OrderDetail> objCartBean = (ArrayList<OrderDetail>) session.getAttribute("cart");
            for (int i = 0; i < objCartBean.size(); i++) {
                if (Id==objCartBean.get(i).getProductID()) {
                    objCartBean.remove(objCartBean.get(i));
                }
            }
        }
        
        response.sendRedirect("shoppingcart.jsp");
%>