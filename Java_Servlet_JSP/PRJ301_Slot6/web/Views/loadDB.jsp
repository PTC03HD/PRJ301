<%-- 
    Document   : loadDB
    Created on : Sep 20, 2023, 11:39:29 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.*" %>
<%@page import="java.util.*" %>
<%@page import="models.*" %>
<!DOCTYPE html>
<html>
    <%  
        response.setHeader("Cache-Control","no-store");   
        response.setHeader("Pragma","no-cache");   
        response.setHeader ("Expires", "0");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%DAO d = (DAO)request.getAttribute("dao");%>
        <%String idUpdate = request.getAttribute("update")+"";
        Student stUpdate = null;%>
        <table> 
            <% for(Student st:d.getStd()) {
            if(st.getId().equals(idUpdate))
                stUpdate = st;
            %>
            <tr>
                <td><%=st.getId()%></td>
                <td><%=st.getName()%></td>
                <td><input type="checkbox" name='gender'<%=st.isGender()?"checked":""%>></td>
                <td><%=d.getDept().get(st.getDepartId()).getName()%></td>
                <td><%=st.getAge()%></td>
                <td><%=st.getGpa()%></td>
                <td><%=st.getAdd()%></td>
                <td><%=st.getDob()%></td>
                <td><a href='loadDB?type=0&id=<%=st.getId()%>'>Update</a></td>
                <td><a href='loadDB?type=1&id=<%=st.getId()%>'>Delete</a></td>
            </tr>
            <%}%>
        </table>             
        <hr/>
        
    <form action="loadDB" method='post'>

        <table>
             <tr>
                <td>Id</td>
                <td><input type='text' name='id' value='<%=stUpdate==null?"":stUpdate.getId()%>'></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type='text' name='name' value='<%=stUpdate==null?"":stUpdate.getName()%>'></td>
            </tr>
             <tr>
                <td>Gender</td>
                <td>
                    <input type='checkbox' name='gender' value='M' 
                           <%=(stUpdate==null||stUpdate.isGender())?"checked":""%>
                           > Male/Female
                </td>
            </tr>
             <tr>
                <td>Department</td>
                <td><select name='departId'><%
                    for(Map.Entry<String,Department> en : d.getDept().entrySet()) {
                    String key = en.getKey();
                    Department val = en.getValue();%>
                    <option value='<%=key%>'
                            <%=stUpdate!=null && stUpdate.getDepartId().equals(key)?"selected":""%>
                            ><%=val.getName()%>
                    </option>
                          <%  }
                   %></select></td>
            </tr>
             <tr>
                <td>Age</td>
                <td><input type='text' name='age' value='<%=stUpdate==null?"":stUpdate.getAge()%>'></td>
            </tr>
              <tr>
                <td>Gpa</td>
                <td><input type='text' name='gpa' value='<%=stUpdate==null?"":stUpdate.getGpa()%>
                           '></td>
            </tr>
              <tr>
                <td>Address</td>
                <td><textarea name='add'> <%=stUpdate==null?"":stUpdate.getAdd()%> </textarea></td>
            </tr>
             <tr>
                <td>DOB</td>
                <td><input type='date' name='dob' value='<%=stUpdate==null?"2000-01-01":(stUpdate.getDob()==null?"2000-01-01":stUpdate.getDob())%>'></td>
            </tr>
        </table>
            <input type='submit' name='btnInsert' value='Insert'>
            <input type='submit' name='btnUpdate' value='Update'>
    </form>
            
            
            
    </body>
</html>
