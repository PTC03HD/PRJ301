<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.user==null}">
            <h1>Access denied!</h1>
        </c:if>            
        <c:if test="${sessionScope.user!=null}">
            <c:forEach items="${requestScope.dao.th}" var = "t">
                Thread: ${t.tcontent} <br/>
                <c:forEach items="${requestScope.dao.com}" var ="co">
                    <c:if test="${co.tid ==t.id}" >
                        ${requestScope.dao.getAccName(co.uid)}: ${co.ctitle} <br/>
                    </c:if>
                </c:forEach>
                        <form action ="discuss" method="post">
                            <input type="text" name="com" >
                            <input type="text"  name ='user' 
                                   value ="${sessionScope.user.uid}" hidden>
                            <input type="submit" name = "${t.id}" value="Save"> <br/>
                        </form>
            </c:forEach>
        </c:if>    
    </body>
                        
</html>
