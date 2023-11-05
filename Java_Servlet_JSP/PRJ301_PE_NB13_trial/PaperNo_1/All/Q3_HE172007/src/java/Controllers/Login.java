/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import Models.Account;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ngngh
 */
@WebServlet(name="Login", urlPatterns={"/login"})
public class Login extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO.INSTANCE.loadAll();
        req.getRequestDispatcher("Views/Login.jsp").forward(req, resp);
    }
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("u");
        String p = req.getParameter("p");
        String mes = "Login failed";
        for (Account ac : DAO.INSTANCE.getAcc()) {
            if (ac.getUid().equals(u) && ac.getPass().equals(p)) {
                HttpSession ses = req.getSession();
                ses.setAttribute("user", ac);
                mes = "Login success";
            }
        }
        req.setAttribute("mes", mes);
        doGet(req, resp);
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
