<%-- 
    Document   : login
    Created on : Nov 2, 2023, 9:09:02 PM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.user==null&&btn!=null}">
            <h3>Wrong Username or Password!</h3>
        </c:if>
        <form method="post" action="login">
            Username: <input type="text" name="username"><br>
            Password: <input type="text" name="password"><br>
            <input type="submit" name="btnLogin" value="login">
        </form>
    </body>
</html>
