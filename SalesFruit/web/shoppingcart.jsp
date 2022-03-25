<%-- 
    Document   : shoppingcart
    Created on : Mar 11, 2022, 9:25:28 PM
    Author     : ADMIN
--%>

<%@page import="DAO.ProductDAO"%>
<%@page import="DTO.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int total = 0;
    ProductDAO productDAO = new ProductDAO();
    ArrayList<OrderDetail> list;
    if(session.getAttribute("cart")!= null){
        list = (ArrayList<OrderDetail>) session.getAttribute("cart");
    }else{
        list = new ArrayList<OrderDetail>();
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
                                        <li><a href="">Adidas</a></li>
                                    </ul>
                                </li>
                                <li><a href="./signin.jsp">Login</a></li>
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
                        <li><a href="#">Adidas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <input type="text" placeholder="What do you need?">
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
<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product">Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < list.size(); i++) {
                                       Product pro =  productDAO.getOne(list.get(i).getProductID());
                                    
                                       total+=list.get(i).getPrice()*list.get(i).getQuantity();
                            %>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="img/product/<%=pro.getImage()%>.jpg" alt="">
                                    <h5><%=pro.getProductName()%></h5>
                                </td>
                                <td class="shoping__cart__price">
                                    <%=list.get(i).getPrice()%>
                                </td>
                                <td class="shoping__cart__total">
                                        <div class="pro-qty1">
                                            <span class="dec qtybtn"><a href="cartupdate.jsp?action=minus&id=<%=list.get(i).getProductID()%>">-</a></span>
                                            <input type="text" value="<%=list.get(i).getQuantity()%>">
                                            <span class="inc qtybtn"><a href="cartupdate.jsp?action=plus&id=<%=list.get(i).getProductID()%>">+</a></span>
                                        </div>
                                </td>
                                <td class="shoping__cart__total">
                                    <%=list.get(i).getPrice()*list.get(i).getQuantity()%>
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="inc qtybtn"><a href="cartupdate.jsp?action=delete&id=<%=list.get(i).getProductID()%>">Delete</a></span>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <ul>
                        <li>Total <span><%=total%></span></li>
                    </ul>
                    <a href="./checkout.jsp" class="primary-btn">Check out</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->
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