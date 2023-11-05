<%-- 
    Document   : UpdateStudent
    Created on : Nov 4, 2023, 3:04:36 PM
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
        <table border="1">
            <tbody>
                <tr>
                    <td>Code</td>
                    <td>Name</td>
                    <td>Date of birth</td>
                    <td>Gender</td>
                    <td>select</td>
                </tr>
                <c:forEach items="${dao.s}" var="stu">
                    <tr>
                        <td>${stu.sid}</td>
                        <td>${stu.name}</td>
                        <td>${stu.dob}</td>
                        <td>${stu.gender?"Male":"Female"}</td>
                        <td><a href="update?sid=${stu.sid}">select</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <form method="post" action="update">
            Detail information<br>
            Code: <input type="text" name="code" value="${uStu.sid}"> 
            Name: <input type="text" name="name" value="${uStu.name}"><br>
            Date of birth: <input type="text" name="dob" value="${uStu.dob}"> 
            Gender: <input type="radio" name="gender" ${uStu.gender?"checked":""}> Male 
            <input type="radio" name="gender" ${uStu.gender?"":"checked"}> Female<br>
            Class: <select name="class">
                <c:forEach items="${dao.c}" var="c">
                    <option value="${c.cid}" ${uStu.classID==c.cid?"selected":""}>${c.cname}</option>
                </c:forEach>
            </select>
            <input type="submit" name="btnUpdate" value="update">
        </form>

            
    </body>
</html>
