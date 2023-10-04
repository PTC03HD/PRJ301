<%-- 
    Document   : HelloJsp
    Created on : Sep 20, 2023, 11:10:44 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1>1+1=<%=(1+1)%></h1>
        <h1><%int
                x=11, y=20, z=x+y;
//                out.println("<h2>x + y = "+z+"</h2>");
        %></h1>
        <h3><%String s ="";
            if(check(z)) s="so chan";
            else s="so le";%>
        </h3>
        <h3><%=s%></h3>
        <h2>x + y = <%=z%></h2>
        <%! private boolean check(int x){
            return x%2==0;
        }%>
    </body>
</html>
