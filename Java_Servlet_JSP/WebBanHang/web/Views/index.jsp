<%-- 
    Document   : index
    Created on : Oct 19, 2023, 12:22:45 AM
    Author     : phamt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Boutique | Ecommerce bootstrap template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- gLightbox gallery-->
        <link rel="stylesheet" href="vendor/glightbox/css/glightbox.min.css">
        <!-- Range slider-->
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
        <!-- Choices CSS-->
        <link rel="stylesheet" href="vendor/choices.js/public/assets/styles/choices.min.css">
        <!-- Swiper slider-->
        <link rel="stylesheet" href="vendor/swiper/swiper-bundle.min.css">
        <!-- Google fonts-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
        <!-- theme stylesheet-->    
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.png">
    </head>
    <body>
        <div class="page-holder">
            <!-- navbar-->
            <header class="header bg-white">
                <div class="container px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="loadDB?page=index"><span class="fw-bold text-uppercase text-dark">Boutique</span></a>
                        <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="loadDB?page=index">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="paging?page=shop&index=1">Shop</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown">
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=index">Homepage</a>
                                        <a class="dropdown-item border-0 transition-link" href="paging?page=shop&index=1">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="cart">Shopping cart</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=checkout">Checkout</a>
                                    </div>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">               
                                <li class="nav-item">
                                    <a class="nav-link" href="cart"> 
                                        <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Cart
                                        <small class="text-gray fw-normal">(2)</small></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="pagesDropdown1" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${acc==null?"Account":acc.username}</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown">
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=login">Login/Sign Up</a>
                                        <a class="dropdown-item border-0 transition-link" href="logout?action=logout">Logout</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=myAccount">Account detail</a>
                                        <c:if test="${sessionScope.acc!=null&&sessionScope.acc.getIsAdmin()}">
                                            <a class="dropdown-item border-0 transition-link" href="paging?page=dashboard&index=1">Dashboard</a>
                                        </c:if>
                                    </div>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- HERO SECTION-->
            <div class="container">
                <section class="hero pb-3 bg-cover bg-center d-flex align-items-center" style="background: url(img/hero-banner-alt.jpg)">
                    <div class="container py-5">
                        <div class="row px-4 px-lg-5">
                            <div class="col-lg-6">
                                <p class="text-muted small text-uppercase mb-2">New Inspiration 2020</p>
                                <h1 class="h2 text-uppercase mb-3">20% off on new season</h1><a class="btn btn-dark" href="loadDB?page=index">Browse collections</a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- CATEGORIES SECTION-->
                <section class="pt-5">
                    <header class="text-center">
                        <p class="small text-muted small text-uppercase mb-1">Carefully created collections</p>
                        <h2 class="h5 text-uppercase mb-4">Browse our categories</h2>
                    </header>
                    <div class="row">
                        <div class="col-md-4">
                            <a class="category-item" href="loadDB?page=shop&index=1&cateF=2"><img class="img-fluid" src="img/cate-phone (1).jpg" alt=""/><strong class="category-item-title">Smartphone</strong></a>
                        </div>
                        <div class="col-md-4">
                            <a class="category-item mb-4" href="loadDB?page=shop&index=1&cateF=3"><img class="img-fluid" src="img/cate-camera (1).png" alt=""/><strong class="category-item-title">Camera</strong></a>
                            <a class="category-item" href="loadDB?page=shop&index=1&cateF=1"><img class="img-fluid" src="img/cate-laptop (1).jpg" alt=""/><strong class="category-item-title">Laptop</strong></a>
                        </div>
                        <div class="col-md-4">
                            <a class="category-item" href="loadDB?page=shop&index=1&cateF=4"><img class="img-fluid" src="img/cat-img-4.jpg" alt=""/><strong class="category-item-title">Accessory</strong></a>
                        </div>
                    </div>
                </section>
                <!-- TRENDING PRODUCTS-->
                <section class="py-5">
                    <header>
                        <p class="small text-muted small text-uppercase mb-1">Made the hard way</p>
                        <h2 class="h5 text-uppercase mb-4">Top trending products</h2>
                    </header>
                    <div class="row">
                        <!-- PRODUCT-->
                        <c:forEach items="${dao.p}" var="pro" begin="1" end="8">
                            <div class="col-xl-3 col-lg-4 col-sm-6">
                                <div class="product text-center">
                                    <div class="position-relative mb-3">
                                        <c:choose>
                                            <c:when test="${sessionScope.acc!=null&&sessionScope.acc.getIsAdmin()}">
                                                <div class="badge text-white bg-"></div><a class="d-block" href="update?pid=${pro.id}&type=0&index=1"><img style="border: 2px solid black" class="img-fluid w-100" src="${pro.img}" alt="product_img"></a>
                                            </c:when>
                                            <c:when test="${sessionScope.acc!=null&&!sessionScope.acc.getIsAdmin()}">
                                                <div class="badge text-white bg-"></div><a class="d-block" href="loadDB?page=detail&pid=${pro.id}"><img style="border: 2px solid black" class="img-fluid w-100" src="${pro.img}" alt="product_img"></a>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="badge text-white bg-"></div><a class="d-block" href="loadDB?page=login"><img style="border: 2px solid black" class="img-fluid w-100" src="${pro.img}" alt="product_img"></a>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="product-overlay">
                                            <ul class="mb-0 list-inline">
                                                <c:choose>
                                                    <c:when test="${sessionScope.acc!=null&&sessionScope.acc.getIsAdmin()}">
                                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="update?pid=${pro.id}&type=0&index=1">Edit items</a></li>
                                                    </c:when>
                                                    <c:when test="${sessionScope.acc!=null&&!sessionScope.acc.getIsAdmin()}">
                                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="cart?pid=${pro.id}">Add to cart</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="loadDB?page=login">Add to cart</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                    <h6 style="height: 40px"> <a class="reset-anchor" href="loadDB?page=detail&pid=${pro.id}">${pro.name}</a></h6>
                                    <p class="small text-muted">${pro.convertPrice()}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
                <!-- SERVICES-->
                <section class="py-5 bg-light">
                    <div class="container">
                        <div class="row text-center gy-3">
                            <div class="col-lg-4">
                                <div class="d-inline-block">
                                    <div class="d-flex align-items-end">
                                        <svg class="svg-icon svg-icon-big svg-icon-light">
                                        <use xlink:href="#delivery-time-1"> </use>
                                        </svg>
                                        <div class="text-start ms-3">
                                            <h6 class="text-uppercase mb-1">Free shipping</h6>
                                            <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-inline-block">
                                    <div class="d-flex align-items-end">
                                        <svg class="svg-icon svg-icon-big svg-icon-light">
                                        <use xlink:href="#helpline-24h-1"> </use>
                                        </svg>
                                        <div class="text-start ms-3">
                                            <h6 class="text-uppercase mb-1">24 x 7 service</h6>
                                            <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-inline-block">
                                    <div class="d-flex align-items-end">
                                        <svg class="svg-icon svg-icon-big svg-icon-light">
                                        <use xlink:href="#label-tag-1"> </use>
                                        </svg>
                                        <div class="text-start ms-3">
                                            <h6 class="text-uppercase mb-1">Festivaloffers</h6>
                                            <p class="text-sm mb-0 text-muted">Free shipping worldwide</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- NEWSLETTER-->
                <section class="py-5">
                    <div class="container p-0">
                        <div class="row gy-3">
                            <div class="col-lg-6">
                                <h5 class="text-uppercase">Let's be friends!</h5>
                                <p class="text-sm text-muted mb-0">Nisi nisi tempor consequat laboris nisi.</p>
                            </div>
                            <div class="col-lg-6">
                                <form action="#">
                                    <div class="input-group">
                                        <input class="form-control form-control-lg" type="email" placeholder="Enter your email address" aria-describedby="button-addon2">
                                        <button class="btn btn-dark" id="button-addon2" type="submit">Subscribe</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="bg-dark text-white">
                <div class="container py-4">
                    <div class="row py-5">
                        <div class="col-md-4 mb-3 mb-md-0">
                            <h6 class="text-uppercase mb-3">Customer services</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#!">Help &amp; Contact Us</a></li>
                                <li><a class="footer-link" href="#!">Returns &amp; Refunds</a></li>
                                <li><a class="footer-link" href="#!">Online Stores</a></li>
                                <li><a class="footer-link" href="#!">Terms &amp; Conditions</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4 mb-3 mb-md-0">
                            <h6 class="text-uppercase mb-3">Company</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#!">What We Do</a></li>
                                <li><a class="footer-link" href="#!">Available Services</a></li>
                                <li><a class="footer-link" href="#!">Latest Posts</a></li>
                                <li><a class="footer-link" href="#!">FAQs</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="text-uppercase mb-3">Social media</h6>
                            <ul class="list-unstyled mb-0">
                                <li><a class="footer-link" href="#!">Twitter</a></li>
                                <li><a class="footer-link" href="#!">Instagram</a></li>
                                <li><a class="footer-link" href="#!">Tumblr</a></li>
                                <li><a class="footer-link" href="#!">Pinterest</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="border-top pt-4" style="border-color: #1d1d1d !important">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start">
                                <p class="small text-muted mb-0">&copy; 2021 All rights reserved.</p>
                            </div>
                            <div class="col-md-6 text-center text-md-end">
                                <p class="small text-muted mb-0">Template designed by <a class="text-white reset-anchor" href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template">Bootstrapious</a></p>
                                <!-- If you want to remove the backlink, please purchase the Attribution-Free License. See details in readme.txt or license.txt. Thanks!-->
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- JavaScript files-->
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/glightbox/js/glightbox.min.js"></script>
            <script src="vendor/nouislider/nouislider.min.js"></script>
            <script src="vendor/swiper/swiper-bundle.min.js"></script>
            <script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
            <script src="js/front.js"></script>
            <script>
                // ------------------------------------------------------- //
                //   Inject SVG Sprite - 
                //   see more here 
                //   https://css-tricks.com/ajaxing-svg-sprite/
                // ------------------------------------------------------ //
                function injectSvgSprite(path) {

                    var ajax = new XMLHttpRequest();
                    ajax.open("GET", path, true);
                    ajax.send();
                    ajax.onload = function (e) {
                        var div = document.createElement("div");
                        div.className = 'd-none';
                        div.innerHTML = ajax.responseText;
                        document.body.insertBefore(div, document.body.childNodes[0]);
                    }
                }
                // this is set to BootstrapTemple website as you cannot 
                // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
                // while using file:// protocol
                // pls don't forget to change to your domain :)
                injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

            </script>
            <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        </div>
    </body>
</html>