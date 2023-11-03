<%-- 
    Document   : Search
    Created on : Nov 2, 2023, 4:43:37 PM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, td, tr, th{
                border: 1px solid;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>${dao.status}</h1>
        <form action="search" method="post">
            Name: <input name="Nsearch" type="text" >
            <input type="submit" name="btnSearch" value="search">
        </form>
        <%--<c:if test="${btn.equals(search)}">--%>
        <table>
            <tr>
                <th>sid</th>
                <th>name</th>
                <th>gender</th>
                <th>dob</th>
            </tr>
            <c:forEach items="${dao.stList}" var="st">
                <tr>
                    <td>${st.sid}</td>
                    <td>${st.name}</td>
                    <td>${st.isGender()}</td>
                    <td>${st.dob}</td>
                </tr>
            </c:forEach>
        </table>
        <%--</c:if>--%>
    </body>
</html>
