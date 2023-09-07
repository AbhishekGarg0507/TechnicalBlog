package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.*;
public class Userdao {
	private Connection con;
	public Userdao(Connection con) {
		this.con = con;
	}
	// function to insert user to database
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			// user --> database
			String query = "insert into user(uname,email,gender,userpassword) values(?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getUname());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getUserpassword());
			pstmt.executeUpdate();
			f = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	// get user by useremail and password
	public User getUserEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query= "select * from user where email=? and userpassword=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				user = new User();
				String name = set.getString("uname"); 
				user.setUname(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getNString("email"));
				user.setUserpassword(set.getString("userpassword"));
				user.setGender(set.getString("gender"));
				user.setRdate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean updateUser(User user) {
		boolean f = false;
			try {
				String query = "update user set uname=?,email=?,gender=?,userpassword=?,profile=? where id=?";
				PreparedStatement p = con.prepareStatement(query);
				p.setString(1, user.getUname());
				p.setString(2, user.getEmail());
				p.setString(3, user.getGender());
				p.setString(4, user.getUserpassword());
				p.setString(5, user.getProfile());
				p.setInt(6, user.getId());
				p.executeUpdate();
				f=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
	}
	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String q = "Select * from user where id=?";
			PreparedStatement ps;
			ps = this.con.prepareStatement(q);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				String name = rs.getString("uname"); 
				user.setUname(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getNString("email"));
				user.setUserpassword(rs.getString("userpassword"));
				user.setGender(rs.getString("gender"));
				user.setRdate(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
