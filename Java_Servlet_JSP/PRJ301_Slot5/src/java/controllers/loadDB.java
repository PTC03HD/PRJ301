/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import models.Department;
import models.Paging;
import models.Student;

/**
 *
 * @author phamt
 */
public class loadDB extends HttpServlet {
    DAO d;

    public void init() { //triển khai
        d = new DAO();
    }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //crod
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadDB</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadDB at " + request.getContextPath() + "</h1>");  
            d.loadDB();
            
            Object obj = request.getAttribute("update");
            Student stUpdate = null;
            String idUpdate = "";
            if(obj != null){
                idUpdate = obj+"";
            }
            String s = "<table>";
            for (Student std : d.getStd()) {
                if(std.getId().equals(idUpdate)){
                    stUpdate = std;
                } //tìm đối tượng cần update
                s += "<tr>";
                s += "<td>" + std.getId() + "</td>";
                s += "<td>" + std.getName() + "</td>";
                s += "<td>" + (std.isGender() ? "Male" : "Female") + "</td>";
                s += "<td> <input type ='checkbox' " + (std.isGender()?"checked":"")
                        +">" + "Male/Female" + "</td>";
                s += "<td> <input type ='radio' name='rdb"+std.getId()+"'" + (std.isGender()?"checked":"")+" >Male " + 
                        "<input type ='radio' name='rdb"+std.getId()+"'" + (std.isGender()?"":"checked")+">Female " + "</td>";
                s += "<td>" + d.getDept().get(std.getDepartId()).getName() + "</td>";
                s += "<td>" + std.getAge() + "</td>";
                s += "<td>" + std.getGpa() + "</td>";
                s += "<td>" + std.getAdd() + "</td>";
                s += "<td>" + std.getDob() + "</td>";

                s += "<td><a href='loadDB?type=0&id="+std.getId()+"'>Update </td>";
                s += "<td><a href='loadDB?type=1&id="+std.getId()+"'>Delete </td>";
                s += "</tr>";
            }
            s += "</table>";
            out.println(s);

            String form = "<hr/>\n" +
"    <form action='loadDB' method='POST'>\n" +
"        <table>\n" +
"            <tr>\n" +
"                <td>Id</td>\n" +
"                <td><input type='text' name='id' value='"+
                    (stUpdate==null?"":stUpdate.getId())+
                    "'></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Name</td>\n" +
"                <td><input type='text' name='name' value='"+
                    (stUpdate==null?"":stUpdate.getName())+
                    "'></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Gender</td>\n" +
"                <td>\n" +
"                    <input type='radio' name='gender' value='M' "+
                    ((stUpdate==null||stUpdate.isGender())?"checked":"")
                    +"> Male &nbsp;\n" +
"                    <input type='radio' name='gender' value='F' "+
                    ((stUpdate!=null&&stUpdate.isGender())?"":"checked")
                    +"> Female &nbsp;\n" +
"                </td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Department</td>\n" +
"                <td><select name='departId' >";
            for (Map.Entry<String, Department> en : d.getDept().entrySet()) {
                String key = en.getKey();
                Department val = en.getValue();
                form += "<option value = '" + (key) + "' "+
                        (stUpdate==null?"":(stUpdate.getDepartId().equals(key)?"selected":""))
                    +">"; //check và chọn xem department cần update
                form += val.getName();
                form += "</option>";
            }
                    form += "</select></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Age</td>\n" +
"                <td><input type='text' name='age' value='"+
                            (stUpdate==null?"":stUpdate.getAge())
                            +"'></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Gpa</td>\n" +
"                <td><input type='text' name='gpa' value='"+
                            (stUpdate==null?"":stUpdate.getGpa())+
                            "'></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>Add</td>\n" +
"                <td><textarea name='add'>"+
                            (stUpdate==null?"":stUpdate.getAdd())+
                            "</textarea></td>\n" +
"            </tr>\n" +
"            <tr>\n" +
"                <td>DOB</td>\n" +
"                <td><input type='date' name='dob' value='"+
                            (stUpdate==null?"2000-01-01":stUpdate.getDob())
                            +"'></td>\n" +
"            </tr>\n" +
"        </table>\n" +
"        <input type='submit' name='btnInsert' value='Insert'>\n" +
"        <input type='submit' name='btnUpdate' value='Update'>\n" +
"    </form>";
            out.println(form);
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    int nrppArr[] = {1,2,3,4,5,6,7,8,9,10,20,30,40,50,500,1000,2000};
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        Object o1 = request.getParameter("type");
//        if(o1!= null){  //tham số type đã được gửi trong yêu cầu HTTP
//            if((o1+"").equals("0")){
//                //update
//                Object o2 = request.getParameter("id");
//                if(o2 != null){
//                    request.setAttribute("update", o2+"");
//                }else{
//                    request.removeAttribute("update");
//                }
//            }else if((o1+"").equals("1")){
//                Object o3 = request.getParameter("id");
//                if(o3!= null){
//                    d.Delete(o3+"");
//                }
//            }else{}
//        }
        d.loadDB();
        int nrpp = 5; //tính lại sau
        try {
            nrpp = (int)request.getAttribute("nrpp");
        } catch (Exception e) {
        }
        int index = -1;
        try {
            index = Integer.parseInt(request.getAttribute("index")+"");
        } catch (Exception e) {
        }
        Paging p = new Paging(nrpp, index, d.getStd().size());
        p.calc();
        request.setAttribute("nrppArr", nrppArr);
        request.setAttribute("page", p);
        request.setAttribute("dao", d);
//        request.getRequestDispatcher("Views/loadDB.jsp").forward(request, response);
        request.getRequestDispatcher("Views/loadDB02.jsp").forward(request, response);
//        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Object o1 = request.getParameter("btnUpdate");
        Object o2 = request.getParameter("btnInsert");
        Object o3 = request.getParameter("btnCheckbox");
        Object o4 = request.getParameter("btnRadio");
        Object o5 = request.getParameter("btnCombobox");
        Object o6 = request.getParameter("btnSearch");
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Object obj = request.getParameter("gender");
        boolean gender = obj!=null && ((obj+"").equals("M"));
        String departId = request.getParameter("departId");
        int age = o3!=null||o4!=null||o5!=null||o6!=null||o1==null?0:Integer.parseInt(request.getParameter("age"));
        float gpa = o3!=null||o4!=null||o5!=null||o6!=null||o1==null?0:Float.parseFloat(request.getParameter("gpa"));
        String add = request.getParameter("add");
        String dob = request.getParameter("dob");
        boolean checkUpdate = false;
        for(Student st : d.getStd()){
            if(st.getId().equals(id)) {
                checkUpdate = true;
                break;
            }
        }
        
        //filter
//        String[] deptf1 = request.getParameterValues("deptFI");
//        String[] genderf1 = request.getParameterValues("genderFI");
//        List<String> deptf2 = new ArrayList<>();
//        List<String> genderf2 = new ArrayList<>();
//        String[] deptf3 = request.getParameterValues("deptFII");
//        String[] genderf3 = request.getParameterValues("genderFII");
//        for(Map.Entry<String, Department> m : d.getDept().entrySet()){
//            if(request.getParameter("deptF"+m.getKey())!=null){
//                deptf2.add(request.getParameter("deptF"+m.getKey()));
//            }
//        }
//        for(int j=0; j<2; j++){
//            if(request.getParameter("genderF"+j)!=null){
//                genderf2.add(request.getParameter("genderF"+j));
//            }
//        }
//        //search
//       d.loadField();
//       
//        Vector <String> ListCheck=new Vector<String>();
//        for (Map.Entry<String,String> entry : d.getField().entrySet()) {
//            String key= entry.getKey();
//            if(request.getParameter("chk"+key)!=null) ListCheck.add(key);
//        }
//        String s1="";
//        String txt =request.getParameter("txtSearch");
//        String mess="";
//        if(ListCheck.isEmpty()){
//            s1="select nothing";
//        }else{
//            for (String lc : ListCheck) {
//                s1+="["+lc+"]"+" LIKE '%"+txt+"%' or ";
//            }
//            
//            s1=s1.substring(0, s1.length()-3);
//            s1="select * from Student where " +s1;
//            mess=s1;
//        }
//        if(o6!=null){
//            d.Search(mess);
//        }
//        request.setAttribute("mess", mess);
        if(o1 != null && checkUpdate){
            d.Update(id, name, gender, departId , age, gpa, add, dob);
        }
        if(o2 != null && !checkUpdate){
            d.Insert(id, name, gender, departId, age, gpa, add, dob);
        }
        
//        if(o3 != null) d.filter(deptf1, genderf1);
//        else if(o4 != null) d.filter(deptf2.toArray(new String[0]), genderf2.toArray(new String[0]));
//        else if(o5!=null) d.filter(deptf3, genderf3);
//        else d.setfStd(d.getStd());
        
        d.Insert(id, name, gender, departId, age, gpa, add, dob);
        d.Update(id, name, gender, departId, age, gpa, add, dob);
        
        int index = Integer.parseInt(request.getParameter("index"));
        int totalPage = Integer.parseInt(request.getParameter("totalPage"));
        if(request.getParameter("btnHome")!=null) index = 0;
        if(request.getParameter("btnPre")!=null)index -=1;
        if(request.getParameter("btnNext")!=null)index +=1;
        if(request.getParameter("btnEnd")!=null)index = totalPage;
        for (int i=0; i<totalPage; i++) {
            if(request.getParameter("btn"+i)!=null) index = i;
        }
        int nrpp = Integer.parseInt(request.getParameter("nrpp"));
        request.setAttribute("nrpp", nrpp);
        request.setAttribute("index", index);
        doGet(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
