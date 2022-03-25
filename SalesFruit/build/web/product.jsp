<%-- 
    Document   : product
    Created on : Mar 11, 2022, 9:20:50 PM
    Author     : ADMIN
--%>

<%@page import="DTO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
CategoryDAO categoryDAO = new CategoryDAO();
ProductDAO productDAO = new ProductDAO();
        
ArrayList<Product> listProduct = productDAO.getAll();
ArrayList<Category> listCate = categoryDAO.getAll();

if(request.getAttribute("listSearch")!=null){
    listProduct = (ArrayList<Product>) request.getAttribute("listSearch");
}
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fruit Sales</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="product.jsp">Product</a>
                                </li>
                                <li><a>Category</a>
                                    <ul class="header__menu__dropdown">
                                        <%  
                                            for (int i = 0; i < listCate.size(); i++) {
                                                    
                                                
                                        %>
                                        <li><a href="product.jsp"><%=listCate.get(i).getCatagoryName()%></a></li>
                                        <%}%>
                                    </ul>
                                </li>
                                <%
                                    if(session.getAttribute("user") == null){
                                %>
                                <li><a href="./signin.jsp">Login</a></li>
                                <%}else{
                                    %>
                                 <li><a href="./signout.jsp">Logout</a></li>
                                <%}%>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <li><a href="./shoppingcart.jsp"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                                <li><a href="./signin.jsp"><i class="fa fa-user"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Category</span>
                    </div>
                    <ul>
                        <%  
                            for (int i = 0; i < listCate.size(); i++) {
                        %>
                        <li><a href="product.jsp"><%=listCate.get(i).getCatagoryName()%></a></li>
                        <%}%>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="SearchProductServlet" method="POST">
                            <input type="text" name="search" placeholder="What do you need?">
                            <button type="submit" class="site-btn">Search</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>
    <!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Category</h4>
                        <%  
                            for (int i = 0; i < listCate.size(); i++) {
                        %>
                        <div class="sidebar__item__color sidebar__item__color--white">
                            <label for="white">
                                <%=listCate.get(i).getCatagoryName()%>
                                <input type="radio" id="white">
                            </label>
                        </div>
                        <%  
                           }
                        %>
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="row">
                    <%
                        for (int i = 0; i < listProduct.size(); i++) {

                    %>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <form action="AddToCartServlet" method="POST">
                            <input hidden="" name="productId" value="<%=listProduct.get(i).getProductID()%>">
                            <input hidden="" name="productName" value="<%=listProduct.get(i).getProductName()%>">
                            <input hidden="" name="price" value="<%=listProduct.get(i).getPrice()%>">
                            <div class="product__item__pic set-bg" data-setbg="img/product/<%=listProduct.get(i).getImage()%>.jpg">
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#"><%=listProduct.get(i).getProductName()%></a></h6>
                                <h5><%=listProduct.get(i).getPrice()%></h5>
                            </div>
                            <div class="product__item__text">
                                <h5> <input type="submit" value="Add to cart"></h5>
                            </div>
                            </form>
                        </div>
                    </div>
                    
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>



</body>

</html>