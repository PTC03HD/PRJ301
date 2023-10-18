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
        <h2>${dao.sqlf}</h2>
        <table>
            <c:forEach items="${dao.fStd}" var="s">
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
<!--        
        <c:if test="${page.start!=0}">
            <span><a href="loadDB?index=0">Home</a></span>
            <span><a href="loadDB?index=${page.start-1}">Previous</a></span>
        </c:if>
        <c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
            <span class="button"><a href="loadDB?index=${i}">${i+1}</a></span>
        </c:forEach>
        <c:if test="${page.start!=0}">
            <span><a href="loadDB?index=${page.start+1}">Next</a></span>
            <span><a href="loadDB?index=${page.end}">End</a></span>
        </c:if>
            -->
        <hr>
        
        <!-------------------------------Bài 1----------------------------------------->
        <h2>Filter with checkbox</h2>
        <form action="loadDB" method="post">
            <table>
                <tr><td>Department<td></tr>
                <c:forEach items="${dao.dept}" var="it">
                    <tr><td><input type="checkbox" name="deptFI" id="chk${it.key}" value="${it.key}">
                            <label for="chk${it.key}">${it.value.name}</label></td></tr>
                </c:forEach>
                    <tr><td>Gender</td></tr>
                    <tr><td><input type="checkbox" name="genderFI" value="1">Male</td></tr>
                    <tr><td><input type="checkbox" name="genderFI" value="0">Female</td></tr>
            </table>
            <input type='submit' name='btnCheckbox' value='Filter1'>
        </form>
        <hr>
        <!-------------------------------------------------------------------------->
        
        <!-------------------------------Bài 2----------------------------------------->
        <h2>Filter with radiobox</h2>
        <form action="loadDB" method="post">
            <table>
                <tr><td>Department<td></tr>
                <c:forEach items="${dao.dept}" var="it">
                    <tr><td><input type="radio" name="deptF${it.key}" id="rd${it.key}" value="${it.key}">
                        <label for="rd${it.key}">${it.value.name}</label></td></tr>
                </c:forEach>
                <tr><td>Gender</td></tr>
                <tr><td><input type="radio" name="genderF1" value="1">Male</td></tr>
                <tr><td><input type="radio" name="genderF0" value="0">Female</td></tr>
            </table>
            <input type='submit' name='btnRadio' value='Filter2'>
        </form>
        <hr>
        <!-------------------------------------------------------------------------->

        <!-------------------------------Bài 3----------------------------------------->
        <h2>Filter with combobox</h2>
        <form action="loadDB" method="post">
            Department<br>
            <select name="deptFII">
                <c:forEach items="${dao.dept}" var="it">
                    <option value="${it.key}">${it.value.name}</option> 
                </c:forEach>
            </select>
            <br>Gender<br>
            <select name="genderFII">
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select><br>
            <input type='submit' name='btnCombobox' value='Filter3'>
        </form>
        <hr>
        <!-------------------------------------------------------------------------->
        <!-------------------------------Bài 4----------------------------------------->
        
        <h2>Filter with search</h2>
        <form action='loadDB' method='post'>
            <input type='text' name='txtSearch'><br>
            <c:forEach items='${dao.field}' var='it'>
                <input type='checkbox' name='chk${it.key}'
                       value='${it.key}'>${it.value}<br>
            </c:forEach>
                <input type="submit" name="btnSearch" value="Search">
        </form> 
           <table>
            <c:forEach items ="${dao.sStd}" var="s">
               
                <tr>
                    <td> ${s.id}</td>
                    <td> ${s.name}</td>
                    <td> ${s.gender?"Male":"Female"}</td>
                    <td> ${dao.dept[s.departId].name}</td>
                    <td> ${s.age}</td>
                    <td> ${s.gpa}</td>
                    <td> ${s.add}</td>
                    <td> ${s.dob}</td>
                </tr>
                
            </c:forEach>
        </table>
        <hr>
        <!-------------------------------------------------------------------------->
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
<!--            <tr>
                <td>Gender</td>
                <td>
                    <input type='radio' name='gender' value='M' 
                           <%--${(stU==null||stU.gender)?"checked":""}--%>>Male &nbsp;
                    <input type='radio' name='gender' value='F' 
                           <%--${(stU!=null&&stU.gender)?"":"checked"}--%>>Female &nbsp;
                </td>
            </tr>-->
                <tr>
                    <td>Gender</td>
                    <td>
                        <select name="gender">
                            <option value='M' ${stU!=null&&stU.gender?"selected":""}>Male</option>
                            <option value='F' ${stU!=null&&stU.gender?"":"selected"}>Female</option>
                        </select>
                    </td>
                </tr>
             <tr>
                <td>Department</td>
                <td><select name='departId' multiple="multiple">
                        <c:forEach items="${dao.dept}" var="it">
                            <option value='${it.key}' ${it.key.equals(stU.departId)?
                                             "selected":""}>${it.value.name}</option>
                        </c:forEach>
                    </select>
                </td>

<!--                <td>
                    <fieldset>
                        <legend>Department</legend>
                        <c:forEach items="${dao.dept}" var="it">
                            <input type="radio" name='departId1' id='rd${it.value.id}' value='${it.key}'
                                   ${it.key.equals(stU.departId)?"checked":""}>
                            <label for="rd${it.value}">${it.value.name}</label>
                            <br>
                        </c:forEach>
                    </fieldset>
                </td>-->
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
