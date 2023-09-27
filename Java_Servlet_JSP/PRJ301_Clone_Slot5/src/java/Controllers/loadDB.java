/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Students;

/**
 *
 * @author phamt
 */
public class loadDB extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAO d;
    public void init(){
        d = new DAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loadDB</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadDB at " + request.getContextPath () + "</h1>");
            
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        Object o1 =  request.getParameter("type");
        if(o1 != null){
            if((o1 + "").equals("0")){
                Object o2 = request.getParameter("id");
                if(o2 != null){
                    request.setAttribute("update", o2+"");
                }else{
                    request.removeAttribute("update");
                }
                //update
            }else if((o1 + "").equals("1")){
                Object o3 = request.getParameter("id");
                if(o3 != null){
                    d.Delete(o3+"");
                }
                //delete
            }
            else {}
        }
        d.loadDb();
        request.setAttribute("dao", d); //chuyen selvet sang jsp
        request.getRequestDispatcher("Views/loadDB.jsp").forward(request, response);
        //chuyen huong sang loadDB.jsp
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
//        processRequest(request, response);
        Object o1 = request.getParameter("btnUpdate");
        Object o2 = request.getParameter("btnInsert");

        String id = request.getParameter("Id");
        String name = request.getParameter("Name");
        Object obj = request.getParameter("Gender");
        boolean gender = obj!=null && ((obj+"").equals("M"));
        String departId = request.getParameter("departId");
        int age = Integer.parseInt(request.getParameter("Age"));
        float gpa = Float.parseFloat(request.getParameter("Gpa"));
        String add = request.getParameter("Add");
        String dob = request.getParameter("Dob");
        
        boolean checkUpdate = false;
        for(Students st : d.getStd()){
            if(st.getId().equals(id)) {
                checkUpdate = true;
                break;
            }
        }
        
        if(o1 != null && checkUpdate){
            d.Update(id, name, gender, departId, age, gpa, add, dob);
        }
        if(o2 != null && !checkUpdate){
            d.Insert(id, name, gender, departId, age, gpa, add, dob);
        }
//        d.Insert(id, name, gender, departId, age, gpa, add, dob);
//        d.Update(id, name, gender, departId, age, gpa, add, dob);
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
