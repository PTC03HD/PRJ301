<%-- 
    Document   : loadDB01
    Created on : Sep 27, 2023, 10:52:02 AM
    Author     : phamt
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!--JSDL core-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
            <c:forEach items="${dao.std}" var="s" begin="${page.begin}" end="${page.end-1}">
                <c:if test='${s.id.equals(update)}'>
                    <c:set var="stU" value='${s}'/>
                </c:if>
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.gender?"Male":"Female"}</td>
                    <td>${s.departId}</td>
                    <td>${dao.dept[s.departId].name}</td>
                    <td>${s.age}</td>
                    <td>${s.gpa}</td>
                    <td>${s.add}</td>
                    <td>${s.dob}</td>
                    <td><a href='loadDB?type=0&id=${s.id}&index=${page.start}'>Update</a></td>
                    <td><a href='loadDB?type=1&id=${s.id}&index=${page.start}'>Delete</a></td>
                </tr>
            </c:forEach>
        </table>
            <form action="loadDB" method="post">
            <select name="nrpp">
                <c:forEach items="${nrppArr}" var="nr">
                    <option value="${nr}" ${nr==page.nrpp?"selected":""}
                            >${nr}</option>
                </c:forEach>
            </select>
            <input type="submit" name="btnSel" value="Sel">
            <input type="text" name="index" value="${page.start}" hidden>
            <input type="text" name="totalPage" value="${page.totalPage}" hidden>
            <c:if test="${page.start!=0}">
                <input type="submit" name="btnHome" value="Home">
                <input type="submit" name="btnPre" value="Pre">
            </c:if>
            <c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
                <input type="submit" name="btn${i}" value="${i+1}">
            </c:forEach>
            <c:if test="${page.start<page.totalPage-1}">
                <input type="submit" name="btnNext" value="Next">
                <input type="submit" name="btnEnd" value="End">
            </c:if>
        </form>
    </body>
</html>
