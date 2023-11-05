<%-- 
    Document   : Login
    Created on : Nov 3, 2023, 8:37:59 PM
    Author     : ngngh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <h1>${mes}</h1>
        <c:if test ='${mes ==null || !mes.equals("Login success")}'>
        <form action="login" method="post">
            User: <input type="text" name ="u"> <br/>
            Password: <input type="password" name ="p"> <br/>
            <input type="submit" value="Login">
        </form>
        </c:if>
    </body>
</html>
