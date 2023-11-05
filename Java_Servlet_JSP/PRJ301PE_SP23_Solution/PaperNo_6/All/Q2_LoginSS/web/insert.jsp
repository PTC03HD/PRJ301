<%-- 
    Document   : insert
    Created on : Nov 2, 2023, 10:22:34 PM
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
         
            <h1 style = "color:red">${mess}</h1>
            
        <c:if test="${sessionScope.acc!=null}">
          <h2>Session of: ${sessionScope.acc.displayname}</h2>
                <form action="insert" method='post'>
        
        <table>
            <tr>
                <td> Name:</td>
                <td><input type='text' name='name' value=''></td>
            </tr>
             <tr>
                <td>Gender: </td>
                <td><input type='radio' name='gender' value="1" > Male &nbsp;
                     <input type='radio' name='gender' value ="0" > Female &nbsp;
                                    
                </td>
            </tr>
            
        
             <tr>
                <td>Dob</td>
                <td><input type='date' name='dob' value=''></td>
            </tr>
                 <tr>
                <td>Group</td>
               
                <td><select name='group'>
                         <c:forEach items="${listA}" var="o">
                    <option value = "${o.qid}" >${o.qname}</option>
                     </c:forEach>
                    </select></td>
                   
            </tr>
        </table>
        <input type='submit' name='save' value='Save'>
            </form>
            
        </c:if>
    </body>
</html>
