<%-- 
    Document   : search
    Created on : Oct 31, 2023, 7:52:53 PM
    Author     : 21H1 HNQA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>


td, th {
  border: 1px solid #dddddd;

}


</style>
    </head>
    <body>
       
        <form action="search" method='post'>
        Group:
        <select name='group'>
            <option value = "all" >All</option>
            <option value = "Account & Finance" >Account & Finance</option>
            <option value = "Development Team" >Development Team</option><!--  -->
            <option value = "R&D Team" >R&D Team</option><!--  -->
            <option value = "Management Team" >Management Team</option><!--  -->
        </select>
         <input type='submit' name='Search' value='Search'>
        </form>
     
          <table> 
              <c:if test='${search!=null}'>
            <tr>
                <td>cid</td>
                <td>cname</td>
                <td>gender</td>
                <td>dob</td>
                <td>gname</td>
                <td>created_by</td>
            </tr>
           </c:if>
            <c:forEach items="${listA}" var="o">
            <tr>
                <td>${o.cid}</td>
                <td>${o.cname}</td>
                <td>${o.gender}</td>
                <td>${o.dob}</td>
                <td>${o.gname}</td>
                <td>${o.cre}</td>
            </tr>
 </c:forEach>
           
        </table> 
    </body>
</html>
