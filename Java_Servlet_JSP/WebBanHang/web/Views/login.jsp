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
                                        Username exits!
                                    </div>
                                </c:if>
                                <c:if test="${checkPass}">
                                    <div class="alert alert-danger" role="alert">
                                        Confirm password not match!
                                    </div>
                                </c:if>
                                <form id="signup" action="login" method="post">
                                    <div class="form-group">
                                        <label>Username<span class="req">*</span> </label>
                                        <input type="text" name="username" class="form-control" id="username" required data-validation-required-message="Please enter your name." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label> Password<span class="req">*</span> </label>
                                        <input type="password" name="password" class="form-control" required data-validation-required-message="Please enter your password" autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password<span class="req">*</span> </label>
                                        <input type="password" name="rePassword" class="form-control" required data-validation-required-message="Please enter your password" autocomplete="off">
                                        <p class="help-block text-danger"></p>
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
                                        <input type="password" name="password" class="form-control" required data-validation-required-message="Please enter your password" autocomplete="off">
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
    </body>
</html>
