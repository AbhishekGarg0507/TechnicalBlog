<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.dao.*"%>
<%@ page import="com.tech.blog.helper.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tech.blog.entities.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="Error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("Login.jsp");
}
int pId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(Conprovider.getConnection());
Post p = d.getPostByPostId(pId);
PostDao PD = new PostDao(Conprovider.getConnection());
ArrayList<Category> list1 = PD.getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title><%=p.getpTitle()%></title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="css/Loadpost.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="vendor/aos/aos.css" rel="stylesheet">
<!-- Template Main CSS Files -->
<link href="css/variables.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="index.jsp" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="assets/img/logo.png" alt=""> -->
				<h1>TechBlog</h1>
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="index.jsp">Blog</a></li>
					<li><a href="Show_blog.jsp">Single Post</a></li>
					<li class="dropdown"><a href="#"><span>Categories</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<%
							for (Category c : list1) {
							%>
							<li><a href="#"><%=c.getCname()%></a></li>
							<%
							}
							%>
						</ul></li>
					<li><a href="aboutus.jsp">About</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</nav>
			<!-- .navbar -->
			<div class="position-relative">
				<a href="#" class="mx-2"><span class="bi-facebook"></span></a> <a
					href="#" class="mx-2"><span class="bi-twitter"></span></a> <a
					href="#" class="mx-2"><span class="bi-instagram"></span></a> <a
					href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
				<i class="bi bi-list mobile-nav-toggle"></i>
				<!-- ======= Search Form ======= -->
								<div class="search-form-wrap js-search-form-wrap">
					<form action="search-result.html" class="search-form">
						<span class="icon bi-search"></span> <input type="text"
							placeholder="Search" class="form-control">
						<button class="btn js-search-close">
							<span class="bi-x"></span>
						</button>
					</form>
				</div>
				<!-- End Search Form -->
			</div>
		</div>
	</header>
	<!-- End Header -->
	<main id="main">
		<section class="single-post-content">
			<div class="container">
				<div class="row">
					<div class="col-md-9 post-content" data-aos="fade-up">
						<!-- ======= Single Post Content ======= -->
						<div class="single-post">
							<%
							Userdao ud = new Userdao(Conprovider.getConnection());
							LikeDao ld = new LikeDao(Conprovider.getConnection());
							%>
							<div class="post-meta">
								<span class="date"><%=ud.getUserByUserId(p.getUserId()).getUname()%></span>
								<span class="mx-1">&bullet;</span> <span><%=DateFormat.getDateInstance().format(p.getpDate())%></span>
							</div>
							<h1 class="mb-5"><%=p.getpTitle()%></h1>
							<p class="hide_cont"><%=p.getpContent()%></p>
							<figure class="my-4">
								<img src="Blogs_pics/<%=p.getpPic()%>" alt=""
									class="img-fluid img-bg d-flex">
								<figcaption>
									<span><a href="#"
										onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)"> <i
											class="mdi mdi-heart"></i><span class="like-count"><%=ld.countLikeOnPost(p.getpId())%></span></a></span>
									<p><%=ud.getUserByUserId(p.getUserId()).getUname()%>
										has posted this blog
									</p>
								</figcaption>
							</figure>
							<p>Code:</p>
							<p>
								<%=p.getpCode()%></p>
						</div>
						<!-- End Single Post Content -->
						<!-- ======= Comments ======= -->
						<div class="comments">
							<h5 class="comment-title py-4">2 Comments</h5>
							<div class="comment d-flex mb-4">
								<div class="flex-shrink-0">
									<div class="avatar avatar-sm rounded-circle">
										<img class="avatar-img" src="assets/img/person-5.jpg" alt=""
											class="img-fluid">
									</div>
								</div>
								<div class="flex-grow-1 ms-2 ms-sm-3">
									<div class="comment-meta d-flex align-items-baseline">
										<h6 class="me-2">Jordan Singer</h6>
										<span class="text-muted">2d</span>
									</div>
									<div class="comment-body">Lorem ipsum, dolor sit amet
										consectetur adipisicing elit. Non minima ipsum at amet
										doloremque qui magni, placeat deserunt pariatur itaque
										laudantium impedit aliquam eligendi repellendus excepturi
										quibusdam nobis esse accusantium.</div>
								</div>
							</div>
							<div class="comment d-flex">
								<div class="flex-shrink-0">
									<div class="avatar avatar-sm rounded-circle">
										<img class="avatar-img" src="assets/img/person-2.jpg" alt=""
											class="img-fluid">
									</div>
								</div>
								<div class="flex-shrink-1 ms-2 ms-sm-3">
									<div class="comment-meta d-flex">
										<h6 class="me-2">Santiago Roberts</h6>
										<span class="text-muted">4d</span>
									</div>
									<div class="comment-body">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Iusto laborum in corrupti
										dolorum, quas delectus nobis porro accusantium molestias
										sequi.</div>
								</div>
							</div>
						</div>
						<!-- End Comments -->
						<!-- ======= Comments Form ======= -->
						<div class="row justify-content-center mt-5">
							<div class="col-lg-12">
								<h5 class="comment-title">Leave a Comment</h5>
								<div class="row">
									<div class="col-lg-6 mb-3">
										<label for="comment-name">Name</label> <input type="text"
											class="form-control" id="comment-name"
											placeholder="Enter your name">
									</div>
									<div class="col-lg-6 mb-3">
										<label for="comment-email">Email</label> <input type="text"
											class="form-control" id="comment-email"
											placeholder="Enter your email">
									</div>
									<div class="col-12 mb-3">
										<label for="comment-message">Message</label>

										<textarea class="form-control" id="comment-message"
											placeholder="Enter your name" cols="30" rows="10"></textarea>
									</div>
									<div class="col-12">
										<input type="submit" class="btn btn-primary"
											value="Post comment">
									</div>
								</div>
							</div>
						</div>
						<!-- End Comments Form -->
					</div>
					<div class="col-md-3">
						<!-- ======= Sidebar ======= -->
						<div class="aside-block">
							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab"
								role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="pills-popular-tab"
										data-bs-toggle="pill" data-bs-target="#pills-popular"
										type="button" role="tab" aria-controls="pills-popular"
										aria-selected="true">Latest</button>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="pills-popular"
									role="tabpanel" aria-labelledby="pills-popular-tab">
									<!-- Latest -->
									<%
									PostDao pod = new PostDao(Conprovider.getConnection());
									List<Post> posts1 = pod.getAllPosts();
									int limit1 = 0;
									for (Post pos : posts1) {
										if (limit1 < 4) {
									%>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date"><%=pod.getCategoryByCatID(pos.getcatId()).getCname()%></span>
											<span class="mx-1">&bullet;</span> <span><%=DateFormat.getDateInstance().format(pos.getpDate())%></span>
										</div>
										<h2 class="mb-2">
											<a href="#"><%=pos.getpTitle()%></a>
										</h2>
										<span class="author mb-3 d-block"><%=ud.getUserByUserId(p.getUserId()).getUname()%></span>
									</div>
									<%
									}
									limit1++;
									}
									%>
								</div>
								<!-- End Latest -->
							</div>
						</div>
						<div class="aside-block">
							<h3 class="aside-title">Categories</h3>
							<ul class="aside-links list-unstyled">
								<%
								PostDao PD1 = new PostDao(Conprovider.getConnection());
								ArrayList<Category> list = PD1.getAllCategories();
								for (Category c : list) {
								%>
								<li><a href="category.html"><i
										class="bi bi-chevron-right"></i><%=c.getCname()%></a></li>
								<%
								}
								%>
							</ul>
						</div>
						<!-- End Categories -->
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="footer-content">
			<div class="container">
				<div class="row g-5">
					<div class="col-lg-4">
						<h3 class="footer-heading">About TecBlog</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Magnam ab, perspiciatis beatae autem deleniti voluptate nulla a
							dolores, exercitationem eveniet libero laudantium recusandae
							officiis qui aliquid blanditiis omnis quae. Explicabo?</p>
						<p>
							<a href="about.html" class="footer-link-more">Learn More</a>
						</p>
					</div>
					<div class="col-6 col-lg-2">
						<h3 class="footer-heading">Navigation</h3>
						<ul class="footer-links list-unstyled">
							<li><a href="index.jsp"><i class="bi bi-chevron-right"></i>
									Home</a></li>
							<li><a href="Show_blog.jsp"><i
									class="bi bi-chevron-right"></i> Blog</a></li>
							<li><a href="aboutus.jsp"><i class="bi bi-chevron-right"></i>
									About us</a></li>
							<li><a href="contact.jsp"><i class="bi bi-chevron-right"></i>
									Contact</a></li>
						</ul>
					</div>
					<div class="col-6 col-lg-2">
						<h3 class="footer-heading">Categories</h3>
						<ul class="footer-links list-unstyled">
							<%
							for (Category c : list1) {
							%>
							<li><a href="category.html"><i
									class="bi bi-chevron-right"></i> <%=c.getCname()%></a></li>
							<%
							}
							%>
						</ul>
					</div>
					<div class="col-lg-4">
						<h3 class="footer-heading">Recent Posts</h3>
						<ul class="footer-links footer-blog-entry list-unstyled">
							<%
							PostDao pd = new PostDao(Conprovider.getConnection());
							List<Post> posts = pd.getAllPosts();
							int limit = 0;
							for (Post pos : posts) {
								if (limit < 4) {
							%>
							<li><a href="single-post.html"
								class="d-flex align-items-center"> <img
									src="Blogs_pics/<%=pos.getpPic()%>" alt=""
									class="img-fluid me-3">
									<div>
										<div class="post-meta d-block">
											<span class="date"><%=pd.getCategoryByCatID(pos.getcatId()).getCname()%></span>
											<span class="mx-1">&bullet;</span> <span><%=DateFormat.getDateInstance().format(pos.getpDate())%></span>
										</div>
										<span><%=pos.getpTitle()%></span>
									</div>
							</a></li>
							<%
							}
							limit++;
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-legal">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						<div class="copyright">
							© Copyright <strong><span>TechBlog</span></strong>. All Rights
							Reserved
						</div>
					</div>
					<div class="col-md-6">
						<div class="social-links mb-3 mb-lg-0 text-center text-md-end">
							<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
								href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
								href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
								href="#" class="google-plus"><i class="bi bi-skype"></i></a> <a
								href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<!-- Vendor JS Files -->
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/swiper/swiper-bundle.min.js"></script>
	<script src="vendor/glightbox/js/glightbox.min.js"></script>
	<script src="vendor/aos/aos.js"></script>
	<script src="vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="js/main.js"></script>
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
</body>
</html>