<%-- 
    Document   : Login
    Created on : Oct 4, 2023, 11:34:15 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${loi}
        <h1>Hello World!</h1>\
        <form action="Login" method="post">
            User: <input type="text" name="user"/><br/>
            Pass: <input type="password" name="pass" value="123"/><br/>
            Roll: <input type="number" value="0" min="0" max="10" name="roll"><br/>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
