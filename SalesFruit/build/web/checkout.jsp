<%-- 
    Document   : checkout
    Created on : Mar 11, 2022, 9:24:46 PM
    Author     : ADMIN
--%>

<%@page import="DTO.User"%>
<%@page import="DTO.Product"%>
<%@page import="DTO.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("signin.jsp");
    }
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

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
            <div class="checkout__form">
                <%
                    if(request.getAttribute("check")!=null){%>
                        <center style="color:red;"><%out.println(request.getAttribute("check"));%></center>
                        <%}
                %>
                <h4>Detail</h4>
                <form action="checkoutServlet" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <%if(session.getAttribute("user") == null){
                                %>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Họ<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Tên<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Địa chỉ<span>*</span></p>
                                <input type="text" placeholder="" class="checkout__input__add">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Số điện thoại<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <%
                            }else{
                                User user = (User)session.getAttribute("user");                 
                            %><div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Full name<span>*</span></p>
                                        <input type="text" value="<%=user.getFullname()%>">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="" value="<%=user.getAddress()%>" class="checkout__input__add">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" value="<%=user.getPhone()%>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="<%=user.getEmail()%>">
                                    </div>
                                </div>
                            </div>
                                <%}%>
                            
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <div class="checkout__order__products">Product<span>Price</span></div>
                                <ul>
                                    <%
                                        for (int i = 0; i < list.size(); i++) {
                                               Product pro =  productDAO.getOne(list.get(i).getProductID());

                                               total+=list.get(i).getPrice()*list.get(i).getQuantity();
                                    %>
                                    <li><%=pro.getProductName()%>(<%=list.get(i).getQuantity()%>)<span><%=list.get(i).getPrice()*list.get(i).getQuantity()%></span></li>
                                    <%}
                                    %>
                                </ul>
                                    <div class="checkout__order__total">Total <span><%=total%></span></div>
                                <button type="submit" class="site-btn">Confirm</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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