package com.tech.blog.servlets;

import com.tech.blog.dao.*;
import com.tech.blog.entities.User;
import com.tech.blog.helper.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	//fetch all form data
        	String check = request.getParameter("agree");
            if (check == null) {
                out.println("Term and Conditions not checked!!!");
            } else {
                //baki ka data yaha nikalna..
                String uname = request.getParameter("Name");
                String email = request.getParameter("email-address");
                String gender = request.getParameter("Radio");
                String userpassword = request.getParameter("password");
                //create user object and set all data to that object..
                User user = new User(uname, email, gender, userpassword);
                //create a user daao object..
                Userdao dao = new Userdao(Conprovider.getConnection());
                if (dao.saveUser(user)) {
                	// save..
                    out.println("done");
                } else {
                    out.println("Something went Wrong !!");
                }
            }
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
