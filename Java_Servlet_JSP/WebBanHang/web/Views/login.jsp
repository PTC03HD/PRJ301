<%-- 
    Document   : login
    Created on : Oct 20, 2023, 2:49:37 PM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="eng">
    <head>
        <link rel="stylesheet" href="css/styleLogin.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    </head>

    <body>

        <div id="form">
            <div class="container">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
                    <div id="userform">
                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Sign up</a></li>
                            <li><a href="#login"  role="tab" data-toggle="tab">Log in</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="signup">
                                <h2 class="text-uppercase text-center"> Sign Up for Free</h2>
                                <c:if test="${warning}">
                                    <div class="alert alert-danger" role="alert">
                                        Username Or Email Or Phone Number exits!
                                    </div>
                                </c:if>
                                <form id="signup" action="login" method="post">
                                    <div class="form-group">
                                        <label>Username<span class="req">*</span> </label>
                                        <input type="text" name="username" class="form-control" id="username" required data-validation-required-message="Please enter your name." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label> Your Email<span class="req">*</span> </label>
                                        <input type="email" name="email" class="form-control" id="email" required data-validation-required-message="Please enter your email address." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label> Your Phone Number<span class="req">*</span> </label>
                                        <input type="number" name="phone" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label> Password<span class="req">*</span> </label>
                                        <input type="password" name="password" class="form-control" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                        <span class="eye">
                                            <i class="glyphicon glyphicon-eye-open" id="hide1" style="display: none" onclick="myFunction()"></i>
                                            <i class="glyphicon glyphicon-eye-close" id="hide2" style="display: block" onclick="myFunction()"></i>
                                        </span>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label>Re-Password<span class="req">*</span> </label>
                                        <input type="password" name="password" class="form-control" id="password2" required data-validation-required-message="Please enter your password" autocomplete="off">
                                        <span class="eye">
                                            <i class="glyphicon glyphicon-eye-open" id="hide3" style="display: none" onclick="myFunction()"></i>
                                            <i class="glyphicon glyphicon-eye-close" id="hide4" style="display: block" onclick="myFunction()"></i>
                                        </span>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <span>
                                            <input type="radio" name="chkIsSeller" class="check" value="0" checked> User
                                            <input type="radio" name="chkIsSeller" class="check" value="1"> Seller
                                        </span>
                                    </div>
                                    <div class="mrgn-30-top">
                                        <button type="submit" class="btn btn-larger btn-block" name="btnSignup" value="signup"/>Sign up</button>
                                    </div>  
                                </form>
                            </div>
                            <div class="tab-pane fade in" id="login">
                                <h2 class="text-uppercase text-center"> Log in</h2>
                                <c:if test="${alert!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        Wrong Username or Password
                                    </div>
                                </c:if>
                                <form id="login" action="login" method="post">
                                    <div class="form-group">
                                        <label>Username<span class="req">*</span> </label>
                                        <input type="text" name="username" class="form-control" id="username" required data-validation-required-message="Please enter your username." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label> Password<span class="req">*</span> </label>
                                        <input type="password" name="password" class="form-control" id="password1" required data-validation-required-message="Please enter your password" autocomplete="off">
                                        <span class="eye">
                                            <i class="glyphicon glyphicon-eye-open" id="hide1.1" style="display: none" onclick="myFunction()"></i>
                                            <i class="glyphicon glyphicon-eye-close" id="hide2.1" style="display: block" onclick="myFunction()"></i>
                                        </span>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="mrgn-30-top">
                                        <button type="submit" class="btn btn-larger btn-block" name="btnLogin" value="login"/>
                                        Log in
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container --> 
        </div>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- partial -->
        <script  src="js/scriptLogin.js"></script>
        <script>
                                                function myFunction() {
                                                    var x = document.getElementById("password");
                                                    var y = document.getElementById("hide1");
                                                    var z = document.getElementById("hide2");
                                                    var a = document.getElementById("password1");
                                                    var b = document.getElementById("hide1.1");
                                                    var c = document.getElementById("hide2.1");
                                                    var m = document.getElementById("password2");
                                                    var n = document.getElementById("hide3");
                                                    var p = document.getElementById("hide4");
                                                    if (x.type === 'password') {
                                                        x.type = "text";
                                                        y.style.display = "block";
                                                        z.style.display = "none";
                                                    } else {
                                                        x.type = "password";
                                                        y.style.display = "none";
                                                        z.style.display = "block";
                                                    }
                                                    if (a.type === 'password') {
                                                        a.type = "text";
                                                        b.style.display = "block";
                                                        c.style.display = "none";
                                                    } else {
                                                        a.type = "password";
                                                        b.style.display = "none";
                                                        c.style.display = "block";
                                                    }
                                                    if (m.type === 'password') {
                                                        m.type = "text";
                                                        n.style.display = "block";
                                                        p.style.display = "none";
                                                    } else {
                                                        m.type = "password";
                                                        n.style.display = "none";
                                                        p.style.display = "block";
                                                    }
                                                }
        </script>
    </body>
</html>
