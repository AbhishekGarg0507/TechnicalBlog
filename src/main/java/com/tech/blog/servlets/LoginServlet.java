package com.tech.blog.servlets;

import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.*;
@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //	login 
            //  fetch Username and password from request
                        String email = request.getParameter("email-address");
            String userpassword = request.getParameter("password");
            Userdao dao = new Userdao(Conprovider.getConnection());
            User u = dao.getUserEmailAndPassword(email, userpassword);
            if (u == null) {
                //	login.................
            	//  error ///
//            	  out.println("Invalid Details..try again");
               Message msg = new Message("Invalid Details!!", "error", "alert-danger");
               HttpSession s = request.getSession();
               s.setAttribute("msg", msg);
               response.sendRedirect("Login.jsp");
            } else {
                // ......
            	// login success
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                response.sendRedirect("profile.jsp");
            }
                        out.println("</body>");
            out.println("</html>");
        }
    }
  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}