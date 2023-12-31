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
import jakarta.websocket.Session;
import models.*;

/**
 *
 * @author phamt
 */
public class loadDB extends HttpServlet {

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

    public void init() { //triển khai
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
            out.println("<title>Servlet loadDB</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadDB at " + request.getContextPath() + "</h1>");
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
        String page = request.getParameter("page");
        String pid = request.getParameter("pid");
        String action = request.getParameter("action");
        request.setAttribute("pid", pid);
        request.setAttribute("page", page);
        HttpSession session = request.getSession();
        Users acc = (Users) session.getAttribute("acc");
        try {
            if (pid != null) {
                for (Product pro : d.getP()) {
                    if (pro.getId().equals(pid)) {
                        request.setAttribute("product", pro);
                    }
                }
            }
            if (acc != null) {
                request.setAttribute("acc", acc);
            }
            if (page != null) {
                if (page.equals("shop") || page.equals("dashboard")) {
                    request.getRequestDispatcher("paging").forward(request, response);
                }
                request.getRequestDispatcher("Views/" + page + ".jsp").forward(request, response);
            }
            if (action != null && action.equals("logout")) {
                request.getRequestDispatcher("LogoutControl.java").forward(request, response);
            }
            request.getRequestDispatcher("Views/index.jsp").forward(request, response);
        } catch (Exception e) {
        }
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
