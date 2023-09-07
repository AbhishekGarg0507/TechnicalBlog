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
import java.sql.*;


@MultipartConfig
@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {

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
            //  fetch email and checking the email enterd is correct
            
            String email = request.getParameter("email-address");
        	String Newpass=request.getParameter("newpassword");
        	String conpass=request.getParameter("confirmpassword");
           
        	String pass="";
        	int id=0;
        	try{
        	Connection con = Conprovider.getConnection();
        	Statement stm = con.createStatement();
        	String query = "Select * from user wher email= '"+email+"'  ";
        	
        	
        	ResultSet rs=stm.executeQuery(query);
        	
        	if(rs.next()){
        		id = rs.getInt("id");
        		pass=rs.getString("3");
        	}
        	
        	System.out.println(id+ " "+pass);
        	
        	if(pass.equals(email)){
        		
        		Statement st = con.createStatement();
        		String query1 = "update user set userpassword = '"+Newpass+"' "
        							+ "where id='"+id+"' and email='"+email+"'";
        	
        		int i = st.executeUpdate(query1);
        	
        		out.println("Password changed successfully");
        		st.close();
        	
        	}
        	else{
        		
        		out.println("Invalid Current Password");
        	}
        	}catch(Exception e){
        		e.printStackTrace();
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
    	
    }

    	
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}