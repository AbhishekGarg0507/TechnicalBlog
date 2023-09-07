<%@ page import="com.tech.blog.dao.*" %>
<%@ page import="com.tech.blog.helper.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tech.blog.entities.*" %>
<%@page import="java.text.DateFormat"%>
<head>
<link href="css/Loadpost.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
 <script src="js/muJs.js"></script> 
</head>
<div class="row">
<%
	User user=(User)session.getAttribute("currentUser");
		Userdao ud = new Userdao(Conprovider.getConnection());
	PostDao d = new PostDao (Conprovider.getConnection());
	//List<Post> posts = d.getAllPosts();
	int catId = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(catId == 0){
		posts = d.getAllPosts();
		
	}else{
		posts = d.getPostByCatid(catId);
	}
	if(posts.size() == 0){
		out.println("<h3 class='display-3 text-center'> NO Posts in this category !! </h3>");
		return;
	}
	for(Post p:posts){
		%>
		<div class="col-lg-4 col-md-6 mt-4 pt-3">
            <div class="blog-post rounded border">
                <div class="blog-img d-block overflow-hidden position-relative">
                    <img src="Blogs_pics/<%=p.getpPic() %>" class="img-fluid rounded-top" alt="">
                    <div class="overlay rounded-top bg-dark"></div>
                    <div class="post-meta">
                    	<% 
                    		LikeDao ld = new LikeDao(Conprovider.getConnection());
                		%>
                        <a href="#" onclick="doLike(<%=p.getpId() %>,<%= user.getId() %>)" class="text-light d-block text-right like"><i class="mdi mdi-heart"></i> <span class="like-count"><%= ld.countLikeOnPost(p.getpId())%></span></a>
                        <a href="#" class="text-light d-block text-right comment"> <i class="mdi mdi-comment"></i> <span>15</span> </a>
                        <a href="Show_blog.jsp?post_id=<%= p.getpId() %>" class="text-light read-more">Read More <i class="mdi mdi-chevron-right"></i></a>
                                            </div>
                </div>
                <div class="content p-3">
                    <small class="text-muted p float-right"><%= DateFormat.getDateInstance().format(p.getpDate()) %></small>
                   <small><a href="javascript:void(0)" class="text-primary"><%= d.getCategoryByCatID(p.getcatId()).getCname() %></a></small>
                    <h4 class="mt-2"><a href="Show_blog.jsp?post_id=<%= p.getpId() %>" class="text-dark title"><%= p.getpTitle() %></a></h4>
                     <div class="pt-3 mt-3 border-top d-flex">
                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="img-fluid avatar avatar-ex-sm rounded-pill mr-3 shadow" alt="">
                        <div class="author mt-2">
                            <h6 class="mb-0"><a href="Profilepics/<%= ud.getUserByUserId(p.getUserId()).getProfile() %>" class="text-dark name"><%=  ud.getUserByUserId(p.getUserId()).getUname() %></a></h6>
                        </div>
                    </div>
                </div>
         </div>
		</div>
		<% 
		}
	%>
	</div>
<script type="text/javascript">
  function doLike(pid, uid)
  {
      console.log(pid + "," + uid)
      var d = {
          uid: uid,
          pid: pid,
          operation: 'like'
      }
  $.ajax({
          url: "LikeServlet",
          data: d,
          success: function (data, textStatus, jqXHR) {
              console.log(data);
              if (data.trim() == 'true')
              {
                  let c = $(".like-counter").html();
                  c++;
                  $('.like-counter').html(c);
              }
          },
          error: function(jqXHR,textStatus,errorThrown){
              console.log(data)
          }
      })
  }
  </script>

