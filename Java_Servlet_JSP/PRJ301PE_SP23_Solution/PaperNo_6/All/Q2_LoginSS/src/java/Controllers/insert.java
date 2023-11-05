/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;



import DAO.DAO;
import Models.Account;
import Models.Group;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author 21H1 HNQA
 */
public class insert extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     DAO dao = new DAO();
      HttpSession session = request.getSession();
     List<Group> listA = dao.getAllGroup();
     request.setAttribute("listA", listA);
           String name = request.getParameter("name");
           int gender = 0;
           try {
            gender=Integer.parseInt(request.getParameter("gender"));
        } catch (Exception e) {
        }
           String dob=request.getParameter("dob");
           int group = 0;
             try {
            group=Integer.parseInt(request.getParameter("group"));
        } catch (Exception e) {
        }
             String save = request.getParameter("save");
             
        Account a =(Account) session.getAttribute("acc");
              if(save!=null) dao.insert(name, gender, dob, group, a.getUsername());
              if(a==null) {
     request.setAttribute("mess", "Access denied");
     request.getRequestDispatcher("insert.jsp").forward(request, response);
     }
        request.getRequestDispatcher("insert.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
