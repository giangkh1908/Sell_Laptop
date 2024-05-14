/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Admin;
import model.Category;
import model.Product;

/**
 *
 * @author KimHo
 */
@WebServlet(name="ProductServlet", urlPatterns={"/products"})
public class ProductServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath () + "</h1>");
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
    DAO d = new DAO();
    List<Product> list1 = d.getProducts();
    List<Category> list2 = d.getAll();
    
    // Kiểm tra tài khoản trong session và đánh dấu là admin nếu thỏa điều kiện
    HttpSession session = request.getSession();
    Admin loggedInAdmin = (Admin) session.getAttribute("account");
    boolean isAdmin = false;
    if (loggedInAdmin != null && loggedInAdmin.getUsername().equals("admin") && loggedInAdmin.getPassword().equals("123")) {
        isAdmin = true;
    }
    
    // Chỉ chuyển hướng đến trang products nếu người dùng đăng nhập là admin và có mật khẩu đúng
    if (isAdmin) {
        request.setAttribute("data1", list1);
        request.setAttribute("data2", list2);
        request.setAttribute("isAdmin", isAdmin); // Truyền giá trị isAdmin vào request scope
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } else {
        // Nếu không phải admin, bạn có thể chuyển hướng đến một trang thông báo lỗi hoặc trang chính thức khác
        response.sendRedirect("home"); // Chuyển hướng đến trang chính thức
    }
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
