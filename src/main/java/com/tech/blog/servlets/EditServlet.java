package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Conprovider;
import com.tech.blog.helper.Helper;
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EditServlet() {
        super();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //fetch all data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            Part part = request.getPart("user_profilepic");
            String imageName = part.getSubmittedFileName();
            //get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setUname(userName);
            user.setEmail(userEmail);
            user.setUserpassword(userPassword);
            String oldFile = user.getProfile();
            user.setProfile(imageName);
            //update database....
            Userdao userDao = new Userdao(Conprovider.getConnection());
            boolean ans = userDao.updateUser(user);
            if (ans) {
            @SuppressWarnings("deprecation")
			String path = request.getRealPath("/")+"Profilepics"+ File.separator +user.getProfile();
                //start of photo work
                //delete code
                @SuppressWarnings("deprecation")
				String pathOldFile = request.getRealPath("/") + "Profilepics" + File.separator + oldFile;
                if(!oldFile.equals("default.png"))  {
                	Helper.deleteFile(pathOldFile);
                                    	if (Helper.saveFile(part.getInputStream(), path)) {
                        out.println("Profile updated...");
                        Message msg = new Message("Profile details updated...", "success", "alert-success");
                        s.setAttribute("msg", msg);
}else {
                                            Message msg = new Message("Something went wrong..", "error", "alert-danger");
                        s.setAttribute("msg", msg);
                }
                // end of photos work
                } else {
                out.println("not updated..");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);
                }
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
        }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}
