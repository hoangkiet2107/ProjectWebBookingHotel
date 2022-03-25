<%-- 
    Document   : ManagerProduct
    Created on : Jun 26, 2020, 9:51:14 PM
    Author     : ADMIN
--%>


<%@page import="DTO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("user")==null) {
        response.sendRedirect("signin.jsp");
        }else{
    ProductDAO productDAO = new ProductDAO();
        
ArrayList<Product> list = productDAO.getAllAdmin();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <style>
            .img{
                width: 64px;
                height: 64px;
            }
            @-webkit-keyframes example {
                0%   {color: #1CDCE2FF;}
                25%  {color: #EDDB11FF;}
                50%  {color: #CB0FEFFF;}
                100% {color: green;}
            }
            @-webkit-keyframes exampleq {
                0%   {background-color: #1CDCE2FF;}
                25%  {background-color: #EDDB11FF;}
                50%  {background-color: #CB0FEFFF;}
                100% {background-color: green;}
            }
            .hihi{
                display: block;
                font-size: 30px;
                font-weight: 700;
                letter-spacing: 18px;
            }
        </style>
        <style>
            .img{
                width: 64px;
                height: 64px;
            }
            body{
                background-color: #f8f9fc;
            }
            .abc{
                background-image: url("images/BGg.png");
            }
        </style>
    </head>
    <body>

        <div class="container">
            <br>
            <a href="signout.jsp">Logout</a>
            <br>
            <div>
                <th><a href="orderManager.jsp" style="color: black">ORDER MANAGER</a></th>
                <table class="table table-bordered table-hover" >
                    <thead>
                    <tr style="background: #4d72de">
                        <th>STT</th>
                        <th>Product Name</th>
                        <th>Product Image</th>
                        <th>Product Price</th>
                        <th>Product Quantity</th>
                        <th>Product Category ID</th>
                        <th>Product Import Date</th>
                        <th>Product Using Date</th>
                        <th>Product Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                        <th><a href="addnewproduct.jsp" style="color: black">ADD NEW</a></th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            String status;
                            for (int i = 0 ; i < list.size(); i++) {
                                status = list.get(i).getStatus()!= 1 ? "<span class='glyphicon glyphicon-remove-circle text-danger'></span>"
                                        : "<span class='glyphicon glyphicon-ok-circle text-success'></span>";
                        %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=list.get(i).getProductName()%></td>
                            <td><img class="img" src="img/product/<%=list.get(i).getImage()%>.jpg"></td>                  
                            <td><%=list.get(i).getPrice()%></td>
                            <td><%=list.get(i).getQuantity()%></td>
                            <td><%=list.get(i).getCategoryID()%></td>
                            <td><%=list.get(i).getImportDate()%></td>
                            <td><%=list.get(i).getUsingDate()%></td>
                            <td><%=status%></td>
                            <td><a href="updateproduct.jsp?id=<%=list.get(i).getProductID()%>">Edit</a></td>
                            <td><a href="deleteproduct.jsp?id=<%=list.get(i).getProductID()%>">Delete</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
<%}%>
