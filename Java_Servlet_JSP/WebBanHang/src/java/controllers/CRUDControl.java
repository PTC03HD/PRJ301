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

/**
 *
 * @author phamt
 */
public class CRUDControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CRUDControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        d.loadDB();
        String o1 = request.getParameter("type");
        Object pid = request.getParameter("pid");
        String i = request.getParameter("index");
        if (o1 != null) {
            request.setAttribute("op1", o1.equals("1"));
            request.setAttribute("op2", o1.equals("0"));
            if ((o1 + "").equals("0")) {
                //update
                if (pid != null) {
                    request.setAttribute("editId", pid + "");
                } else {
                    request.removeAttribute("editId");
                }
            } else if ((o1 + "").equals("1")) {
                if (pid!=null) {
                    request.setAttribute("deleteId", pid);
                } else {
                    request.removeAttribute("deleteId");
                }
            } else {
            }
        }
        String page = "paging?page=dashboard&index="+(i==null?"1":i);
        request.getRequestDispatcher(page).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String btn1 = request.getParameter("btnInsert");
        String btn2 = request.getParameter("btnEdit");
        request.setAttribute("btn2", btn2);
        String name = request.getParameter("proName");
        String id = request.getParameter("proId");
        String img = request.getParameter("proImage");
        String desc = request.getParameter("proDesc");
        String price = request.getParameter("proPrice");
        String quantity = request.getParameter("proQuantity");
        String discount = request.getParameter("proDis");
        String hot = request.getParameter("proHot");
        String cateId = request.getParameter("category");
        
        request.setAttribute("name", name);
        if(btn1 !=null){
            d.InsertProduct(cateId, name, price, desc, quantity, img, discount, hot, "1");
        }
        
        String deleteId = request.getParameter("delId");
        Object btnDelete = request.getParameter("btnDelete");
        if(btnDelete!=null&&deleteId!=null){
            d.deleteProduct(Integer.parseInt(deleteId));
        }
        
        if(btn2!=null){
            d.Update(id, cateId, name, price, desc, quantity, img, discount, hot, "1");
        }
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
