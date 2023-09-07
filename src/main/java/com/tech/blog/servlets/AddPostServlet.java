package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	int catId = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pPic");
            //  getting current user id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, catId, user.getId());
            PostDao dao = new PostDao(Conprovider.getConnection());
            if (dao.savePost(p)) {
            @SuppressWarnings("deprecation")
			 String path = request.getRealPath("/") + "Blogs_pics" + "/" + part.getSubmittedFileName();
             Helper.saveFile(part.getInputStream(), path);
              out.println("done");
            } else {
                out.println("error");
            }  }
     }
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
}
