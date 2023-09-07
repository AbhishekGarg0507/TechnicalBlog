package com.tech.blog.entities;
import java.sql.*;

public class User {
		private int id;
		private String uname;
		private String email;
		private String gender;
		private String userpassword;
		private Timestamp rdate;
		private String profile;
		
		public User(int id, String uname,String email,String gender,String userpassword,Timestamp rdate) {
			this.id= id;
			this.uname= uname;
			this.email= email;
			this.gender= gender;
			this.userpassword= userpassword;
			this.rdate=rdate;
		}
		
		public User() { }
		
		public User(String uname,String email,String gender,String userpassword) 
		{
			this.uname= uname;
			this.email= email;
			this.gender= gender;
			this.userpassword= userpassword;
//			this.rdate = rdate;
			
		}
		
		// getters and setters
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getUname() {
			return uname;
		}

		public void setUname(String uname) {
			this.uname = uname;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getUserpassword() {
			return userpassword;
		}

		public void setUserpassword(String userpassword) {
			this.userpassword = userpassword;
		}

		public Timestamp getRdate() {
			return rdate;
		}

		public void setRdate(Timestamp rdate) {
			this.rdate = rdate;
		}

		public String getProfile() {
			return profile;
		}

		public void setProfile(String profile) {
			this.profile = profile;
		}
		
		
}
