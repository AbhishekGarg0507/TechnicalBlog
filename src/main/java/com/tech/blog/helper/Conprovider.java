
package com.tech.blog.helper;

import java.sql.*;
public class Conprovider {
    private static Connection con;
	public static Connection getConnection() {
		try {
			String Driver = "com.mysql.cj.jdbc.Driver";
			if(con == null) {
			//driver class loader
			Class.forName(Driver);
			//connection
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/techblog","root","admin");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	return con;
	}
}


