<%-- 
    Document   : myAccount
    Created on : Oct 23, 2023, 12:19:53 AM
    Author     : phamt
--%>

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
        <link rel="stylesheet" href="css/styleMyAccount.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.png">
        <!--Plugin-->
        <link rel="stylesheet" href="css/plugin.css"/>
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
                                    <a class="nav-link dropdown-toggle active" id="pagesDropdown1" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${acc==null?"Account":acc.username}</a>
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
            <!-- my account start  -->
            <section class="main_content_area">
                <div class="container">   
                    <div class="account_dashboard">
                        <div class="row">
                            <div class="col-sm-12 col-md-3 col-lg-3">
                                <!-- Nav tabs -->
                                <div class="dashboard_tab_button">
                                    <ul role="tablist" class="nav flex-column dashboard-list">
                                        <li><a href="#account-details" data-toggle="tab" class="nav-link">Tài khoản của tôi</a></li>
                                        <li> <a href="#orders" data-toggle="tab" class="nav-link">Đơn hàng</a></li>
                                        <li><a href="logout?action=logout" class="nav-link">Đăng xuất</a></li>
                                    </ul>
                                </div>    
                            </div>
                            <div class="col-sm-12 col-md-9 col-lg-9">
                                <!-- Tab panes -->
                                <div class="tab-content dashboard_content">
                                    <div class="tab-pane fade" id="orders">
                                        <h3>Đơn hàng</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Mã đơn hàng</th>
                                                        <th>Ngày khởi tạo</th>
                                                        <th>Hình thức GD</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Tổng đơn</th>
                                                        <th>Actions</th>	 	 	 	
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${bill}" var="b">
                                                    <tr>
                                                        <td>${b.bill_id}</td>
                                                        <td>${b.date}</td>
                                                        <td><span class="success">${b.payment}</span></td>
                                                        <td>${b.address}</td>
                                                        <td>${b.total}</td>
                                                        <td><a href="user?action=showdetail&bill_id=${b.bill_id}" class="view">view</a></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade show active" id="account-details">
                                        <h3>Tài khoản của tôi </h3>
                                        <div class="login">
                                            <div class="login_form_container">
                                                <div class="account_login_form">
                                                    <form action="user?action=updateinfo" method="POST">
                                                        <label>Tên người dùng</label>
                                                        <input type="text" name="user_name" value="${sessionScope.acc.username}">
                                                        <label>Password</label>
                                                        <input type="password" name="user_pass" value="${sessionScope.acc.userPass}">
                                                        <div class="cart_submit">
                                                            <button type="submit" name="btnChangePass">save</button>
                                                        </div> 
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>        	
            </section>			
            <!--footer-->	
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
            <script src="js/plugins.js"></script>
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
