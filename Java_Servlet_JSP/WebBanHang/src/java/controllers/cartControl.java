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
import jakarta.servlet.http.HttpSession;
import models.Bill;
import models.BillDetail;
import models.Users;

/**
 *
 * @author phamt
 */
public class cartControl extends HttpServlet {

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
            out.println("<title>Servlet cartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartControl at " + request.getContextPath() + "</h1>");
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
        d.loadDB();
        request.setAttribute("dao", d);
        HttpSession ses = request.getSession();
        Users u = (Users) ses.getAttribute("acc");
        Bill fbill = null;
        try {
            for (Bill b : d.getBill()) {
                if (b.getUser().getUid() == u.getUid() && b.getCondition() < 0) {
                    fbill = b;
                }
            }
            request.setAttribute("fbill_id", fbill.getBill_id());
        } catch (Exception e) {
        }
        try {
            String action = request.getParameter("action");
            String pid = request.getParameter("pid");
            if (pid != null&&action==null) {
                BillDetail bd = d.findProductInCart(pid, fbill.getBill_id());
                if (bd != null) {
                    d.UpdateBillDetail(bd.getDetail_id(), bd.getQuantity() + 1 + "");
                } else {
                    d.InsertBillDetail(fbill.getBill_id(), pid, "1", d.findProduct(pid).getPrice() + "");
                }
            }
            else if(pid!=null&&action!=null){
                BillDetail bd = d.findProductInCart(pid, fbill.getBill_id());
                d.DeleteBillDetail(bd.getDetail_id());
            }
        } catch (Exception e) {
        }
        d.loadDB();
        request.getRequestDispatcher("Views/cart.jsp").forward(request, response);
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
