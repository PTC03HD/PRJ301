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
import java.util.List;
import models.Product;

/**
 *
 * @author phamt
 */
public class PagingControl extends HttpServlet {

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
            out.println("<title>Servlet PagingControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PagingControl at " + request.getContextPath() + "</h1>");
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
        int count = d.getTotalProduct();
        int endPage = count % 6 == 0 ? count / 6 : (count / 6) + 1;
        String index = request.getParameter("index");
        request.setAttribute("index", index);
        //price value
        String minValue = request.getParameter("minValue");
        String maxValue = request.getParameter("maxValue");
        minValue = minValue==null?d.getMinPrice():minValue.substring(0, minValue.length()-1);
        maxValue = maxValue==null?d.getMaxPrice():maxValue.substring(0, maxValue.length()-1);
        request.setAttribute("minPrice", d.getMinPrice()); 
        request.setAttribute("maxPrice", d.getMaxPrice()); 
        request.setAttribute("min", minValue==null?d.getMinPrice():minValue);
        request.setAttribute("max", maxValue==null?d.getMaxPrice():maxValue);
        //search value
        String txtSearch = request.getParameter("txt");
        txtSearch = txtSearch == null ? "" : txtSearch;
        request.setAttribute("txt", txtSearch);
        //category value
        String cate[] = request.getParameterValues("cateF");
        request.setAttribute("cateFilter", cate);
        String cateUrl="";
        if(cate!=null){
            for (String id : cate) {
                cateUrl+="&cateF="+id;
            }
            request.setAttribute("cateUrl", cateUrl);
        }
        try {
            if (index != null) {
                d.pagingProduct(Integer.parseInt(request.getParameter("index")), 6, txtSearch
                        , cate, minValue, maxValue);
            } else {
                d.pagingProduct(1, 6, txtSearch, cate, minValue, maxValue);
            }
        } catch (Exception e) {
        }
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("Views/" + page + ".jsp").forward(request, response);
//        processRequest(request, response);
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
