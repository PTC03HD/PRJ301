<%-- 
    Document   : Search
    Created on : Oct 2, 2023, 8:30:54 AM
    Author     : phamt
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
        <h1>Hello World!</h1>
        ${sql}
        <form action="loadDB" method="post">
            <input type="text" sname="txtSearch"><hr>
            <c:forEach items="${dao.dept}" var="de">
            <input type="checkbox" 
                   name="chk${de.key}" value=${de.key}"">${de.value.name}<br>
            </c:forEach>
            <input type="submit" name="Search" value="Search">
        </form>
    </body>
</html>
