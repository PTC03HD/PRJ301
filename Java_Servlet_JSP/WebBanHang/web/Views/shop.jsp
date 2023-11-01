<%-- 
    Document   : blank
    Created on : Oct 19, 2023, 12:27:56 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <!-- Link--><a class="nav-link" href="loadDB?page=index">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="paging?page=shop&index=1">Shop</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown">
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=index">Homepage</a>
                                        <a class="dropdown-item border-0 transition-link" href="paging?page=shop&index=1">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=detail">Product detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=cart">Shopping cart</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=checkout">Checkout</a>
                                    </div>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">               
                                <li class="nav-item">
                                    <a class="nav-link" href="loadDB?page=cart"> 
                                        <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Cart
                                        <small class="text-gray fw-normal">(2)</small></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${acc==null?"Account":acc.username}</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown">
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=login">Login/Sign Up</a>
                                        <a class="dropdown-item border-0 transition-link" href="logout?action=logout">Logout</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=myAccount">Account detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="loadDB?page=dashboard&index=1">Dashboard</a>
                                    </div>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>

            <div class="container">

                <!-- HERO SECTION-->
                <section class="py-5 bg-light">
                    <div class="container">
                        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                            <div class="col-lg-6">
                                <h1 class="h2 text-uppercase mb-0">Shop</h1>
                            </div>
                            <div class="col-lg-6 text-lg-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                                        <li class="breadcrumb-item"><a class="text-dark" href="loadDB?page=index">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="py-5">
                    <div class="container p-0">
                        <div class="row">
                            <!-- SHOP SIDEBAR-->
                            <div class="col-lg-3 order-2 order-lg-1">
                                <h5 class="text-uppercase mb-4">Categories</h5>
                                <div class="py-2 px-4 bg-dark text-white mb-3"><strong class="small text-uppercase fw-bold">Modern Tech</strong></div>
                                <form method="post"action="paging" style="margin-bottom: 1rem">
                                    <h6 class="text-uppercase mb-3">Category</h6>
                                    <input name="page" type="text" value="shop" hidden="">
                                    <input name="index" type="text" value="1" hidden="">
                                    <c:forEach items="${dao.c}" var="cate">
                                        <div class="form-check mb-1">
                                            <input class="form-check-input" name="cateF" 
                                                   type="checkbox" id="chk${cate.name}" 
                                                   value="${cate.id}" 
                                                   ${cateFilter[0]==cate.id||cateFilter[1]==cate.id
                                                     ||cateFilter[2]==cate.id||cateFilter[3]==cate.id?"checked":""}>
                                            <label class="form-check-label" for="chk${cate.name}">${cate.name}</label>
                                        </div>
                                    </c:forEach>

                                    <h6 class="text-uppercase mb-4" style="margin-top: 1rem">Price Range</h6>
                                    <div class="price-range pt-4 mb-5">
                                        <div id="range"></div>
                                        <div class="row pt-2">
                                            <div class="col-6"><strong class="small fw-bold text-uppercase">From:</strong></div>
                                            <div class="col-6 text-end"><strong class="small fw-bold text-uppercase">To:</strong></div>
                                            <input name="txt" type="text" value="${txt}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." hidden="">
                                            <input name="page" type="text" value="shop" hidden="">
                                            <input name="index" type="text" value="1" hidden="">
                                            <div class="col-6">
                                                <input class="form-control" id="minValue" name="minValue" value="${min}" hidden>
                                            </div>
                                            <div class="col-6">
                                                <input class="form-control" id="maxValue" name="maxValue" value="${max}" hidden="">
                                            </div>

                                        </div>
                                    </div>
                                    <button style="font-size: 0.85rem; border-radius: 7%" class="btn btn-primary" type="submit">Submit</button>
                                </form>
                            </div>
                            <!-- SHOP LISTING-->
                            <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-6 mb-2 mb-lg-0">
                                        <p class="text-sm text-muted mb-0">Showing 1–12 of 53 results</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
                                            <li class="list-inline-item">
                                                <form action="paging" method="post" class="form-inline my-2 my-lg-0">
                                                    <div class="input-group input-group-sm">
                                                        <input name="txt" type="text" value="${txt}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                                        <input name="page" type="text" value="shop" hidden>
                                                        <c:forEach items="${dao.c}" var="cate">
                                                            <input class="form-check-input" name="cateF" 
                                                                   type="checkbox" id="chk${cate.name}" 
                                                                   value="${cate.id}" 
                                                                   ${cateFilter[0]==cate.id||cateFilter[1]==cate.id
                                                                     ||cateFilter[2]==cate.id||cateFilter[3]==cate.id?"checked":""} hidden>
                                                        </c:forEach>
                                                        <input class="form-control" id="maxValue" name="maxValue" value="${max}" hidden>
                                                        <input class="form-control" id="minValue" name="minValue" value="${min}" hidden>
                                                        <input name="index" type="text" value="1" hidden>
                                                        <div class="input-group-append">
                                                            <button type="submit" class="btn btn-secondary btn-number">
                                                                <i class="fa fa-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <c:forEach items="${dao.pagingPro}" var="pro">
                                        <!-- PRODUCT-->
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="product text-center">
                                                <div class="mb-3 position-relative">
                                                    <div class="badge text-white bg-"></div>
                                                    <a class="d-block" href="loadDB?page=detail&pid=${pro.id}">
                                                        <img class="img-fluid w-100" src="${pro.img}" alt="..." style="border: 2px solid black">
                                                    </a>
                                                    <div class="product-overlay">
                                                        <ul class="mb-0 list-inline">
                                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="cart.html">Add to cart</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <h6 style="height: 40px"> <a class="reset-anchor"  href="page=detail&pid=${pro.id}">${pro.name}</a></h6>
                                                <p class="small text-muted">${pro.convertPrice()}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- PAGINATION-->
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center justify-content-lg-end">
                                        <li class="page-item mx-1"><a class="page-link" href="paging?page=shop&index=1&txt=${txt}${cateUrl}&minValue=${min}đ&maxValue=${max}đ" aria-label="Home"><span aria-hidden="true">«</span></a></li>
                                        <li class="page-item mx-1"><a class="page-link" href="paging?page=shop&index=${index>1?index-1:index}&txt=${txt}${cateUrl}&minValue=${min}đ&maxValue=${max}đ" aria-label="Previous"><span aria-hidden="true">‹</span></a></li>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item mx-1 ${index==i?"active":""}"><a  class="page-link" href="paging?page=shop&index=${i}&txt=${txt}${cateUrl}&minValue=${min}đ&maxValue=${max}đ">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item ms-1"><a class="page-link" href="paging?page=shop&index=${index<endP?index+1:index}&txt=${txt}${cateUrl}&minValue=${min}đ&maxValue=${max}đ" aria-label="Next"><span aria-hidden="true">›</span></a></li>
                                        <li class="page-item ms-1"><a class="page-link" href="paging?page=shop&index=${endP}&txt=${txt}${cateUrl}&minValue=${min}đ&maxValue=${max}đ" aria-label="End"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
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
            <script src="js/jquery-1.11.1.min.js"></script>
            <script src="js/front.js"></script>
            <!-- Nouislider Config-->
            <script>
                $(document).ready(function () {
                    var rangeSlider = document.getElementById('range');
                    var minValue = document.getElementById('minValue');
                    var maxValue = document.getElementById('maxValue');

                    noUiSlider.create(rangeSlider, {
                        start: [parseFloat(minValue.value), parseFloat(maxValue.value)],
                        range: {
                            'min':${minPrice},
                            'max':${maxPrice}
                        },
                        step: 10000,
                        margin: 300,
                        connect: true,
                        direction: 'ltr',
                        orientation: 'horizontal',
                        behaviour: 'tap-drag',
                        tooltips: true,
                        format: {
                            to: function (value) {
                                return Math.round(value) + ' đ';
                            },
                            from: function (value) {
                                return Number(value.replace('đ', ''));
                            }
                        }
                    });

                    rangeSlider.noUiSlider.on('update', function (values) {
                        var handleValue = rangeSlider.noUiSlider.get();
                        minValue.value = handleValue[0];
                        maxValue.value = handleValue[1];
                    });
                });

            </script>

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