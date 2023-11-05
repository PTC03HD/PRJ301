<%-- 
    Document   : login
    Created on : Nov 2, 2023, 9:57:39 PM
    Author     : 21H1 HNQA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 

    <body>
        
   <form action='login' method='post'>
       Username:<input type='text' name='name'><br>
       Password:<input type='password' name='pass'><br>
            <input type='submit' name='login' value='Login'>
        </form>
 
        ${mess}
    </body>
</html>
