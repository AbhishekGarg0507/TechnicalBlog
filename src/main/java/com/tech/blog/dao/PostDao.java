package com.tech.blog.dao;
import java.sql.*;
import java.util.*;
import com.tech.blog.entities.*;
public class PostDao {
	Connection con;
	public PostDao(Connection con) {
		this.con = con;
	}
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		try {
			String q = "select * from categories";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()) {
				int cid = rs.getInt("cid");
				String cname = rs.getString("cname");
				String description = rs.getString("description");
				
				Category c = new Category(cid,cname,description);
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//saving all the posts here
	public boolean savePost(Post p) {
		boolean f = false;
		try {
			String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstm = con.prepareStatement(q);
			pstm.setString(1, p.getpTitle());
			pstm.setString(2, p.getpContent());
			pstm.setString(3, p.getpCode());
			pstm.setString(4, p.getpPic());
			pstm.setInt(5, p.getcatId());
			pstm.setInt(6, p.getUserId());
			pstm.executeUpdate();
			f = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//getting all the post here...
	public List<Post> getAllPosts(){
		List<Post> list = new ArrayList<>();
		// fetching all the posts here
		try {
			PreparedStatement ps = con.prepareStatement("select * from posts order by pDate desc");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent =rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				Post p = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
				list.add(p);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// getting all the post by their id here....
	public List<Post> getPostByCatid(int catId){
		List<Post> list = new ArrayList<>();
		//fetching all post by id 
		try {
			PreparedStatement ps = con.prepareStatement("select * from posts where catId = ?");
			ps.setInt(1,catId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent =rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int userId = rs.getInt("userId");
				Post p = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
				list.add(p);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//getting the information of post by post id
	 public Post getPostByPostId(int pId) {
	        Post post = null;
	        String q = "select * from posts where pId=?";
	        try {
	            PreparedStatement p = this.con.prepareStatement(q);
	            p.setInt(1, pId);
	            ResultSet rs = p.executeQuery();
	            if (rs.next()) {
	            	int pid = rs.getInt("pId");
					String pTitle = rs.getString("pTitle");
					String pContent =rs.getString("pContent");
					String pCode = rs.getString("pCode");
					String pPic = rs.getString("pPic");
					Timestamp pDate = rs.getTimestamp("pDate");
					int catId = rs.getInt("catId");
					int userId = rs.getInt("userId");
	                post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return post;
	 }
	 public Category getCategoryByCatID(int cid){
		Category category = null;
		 try {
			 String q = "Select * from categories where cid=?";
			 PreparedStatement pst = this.con.prepareStatement(q);
			 pst.setInt(1, cid);
			 ResultSet rs = pst.executeQuery();
			 while(rs.next()) {
				 	category = new Category();
				    category.setCid(rs.getInt("cid"));
					category.setCname(rs.getString("cname"));
					category.setCdescription(rs.getString("description"));
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return category;
	 }
}
