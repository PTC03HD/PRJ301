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
            <c:forEach items="${dao.std}" var="s">
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
                    <td><a href='loadDB?type=0&id=${s.id}'>Update</a></td>
                    <td><a href='loadDB?type=1&id=${s.id}'>Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <hr>
        
        <form action="loadDB" method='post'>   
        <table>
            <tr>
                <td>Id</td>
                <td><input type='text' name='id' value='${stU.id}'></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type='text' name='name' value='${stU.name}'></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input type='radio' name='gender' value='M' 
                           ${(stU==null||stU.gender)?"checked":""}>Male &nbsp;
                    <input type='radio' name='gender' value='F' 
                           ${(stU!=null&&stU.gender)?"":"checked"}>Female &nbsp;
                </td>
            </tr>
             <tr>
                <td>Department</td>
                <td><select name='departId'>
                        <c:forEach items="${dao.dept}" var="it">
                            <option value='${it.key}' ${it.key.equals(stU.departId)?
                                             "selected":""}>${it.value.name}</option>
                        </c:forEach>
                    </select></td>
            </tr>
             <tr>
                <td>Age</td>
                <td><input type='text' name='age' value='${stU.age}'></td>
            </tr>
              <tr>
                <td>GPA</td>
                <td><input type='text' name='gpa' value='${stU.gpa}'></td>
            </tr>
              <tr>
                <td>Address</td>
                <td><textarea name='add'>${stU.add}</textarea></td>
            </tr>
            <tr>
                <td>DOB</td>
                <td><input type='date' name='dob' value='${stU.dob}'></td>
            </tr>
        </table>
        <input type='submit' name='btnInsert' value='Insert'>
        <input type='submit' name='btnUpdate' value='Update'>
    </form>
    </body>
</html>
