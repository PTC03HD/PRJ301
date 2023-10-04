<%-- 
    Document   : loadDB
    Created on : Sep 26, 2023, 5:33:47 PM
    Author     : phamt
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="models.*"%>
<%@page import="DAL.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%DAO d = (DAO)request.getAttribute("dao");%>
        <%Students stUpdate=null;
        String idUpdate=request.getAttribute("update")+"";%>
        <table>
            <%for(Students st : d.getStd()){
                if(idUpdate.equals(st.getId()))
                    stUpdate=st;
            %>
            <tr>
                <td><%=st.getId()%></td>
                <td><%=st.getName()%></td>
                <td>
                    <input type="checkbox" name="gender" 
                           <%=(st.isGender()?"checked":"")%>>Male/Female</td>
                <td><%=(d.getDept().get(st.getDepartId()).getName())%></td>
                <td><%=st.getAge()%></td>
                <td><%=st.getGpa()%></td>
                <td><%=st.getAdd()%></td>
                <td><%=st.getDob()%></td>
                <td><a href="loadDB?type=0&id=<%=st.getId()%>">Update</a></td>
                <td><a href="loadDB?type=1&id=<%=st.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
        <hr>
        
        <form name="form" action="loadDB" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="Id" value=
                               '<%=(stUpdate==null?"":stUpdate.getId())%>'></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="Name" value=
                               '<%=(stUpdate==null?"":stUpdate.getName())%>'>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td> 
                        <input type="radio" name="Gender" value="M"
                               <%=stUpdate==null||stUpdate.isGender()?"checked":""%>>Male
                        <input type="radio" name="Gender" value="F"
                               <%=stUpdate==null||stUpdate.isGender()?"":"checked"%>>Female
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name='departId'>
                            <%for(Map.Entry<String, Departments> en : d.getDept().entrySet()){
                                String key = en.getKey();
                                Departments val = en.getValue();%>
                                <option value='<%=key%>' 
                                        <%=stUpdate!=null&&stUpdate.getDepartId().equals(key)?
                                        "selected":""%>
                                        ><%=val.getName()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td><input type="text" name="Age" value=
                               '<%=(stUpdate==null?"":stUpdate.getAge())%>'></td>
                </tr>
                <tr>
                    <td>Gpa</td>
                    <td><input type="text" name="Gpa" value=
                               '<%=(stUpdate==null?"":stUpdate.getGpa())%>'></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="Add"><%=(stUpdate==null?"":stUpdate.getAdd())%></textarea></td>
                </tr>
                <tr>
                    <td>Dob</td>
                    <td><input type="date" name="Dob" value=
                               '<%=(stUpdate==null?"2000-01-01":(stUpdate.getDob()==null?
                                       "2000-01-01":stUpdate.getDob()))%>'>
                    </td>
                </tr>
            </table>
            <input type='submit' name='btnInsert' value='Insert'>
            <input type='submit' name='btnUpdate' value='Update'>
        </form>
    </body>
</html>
