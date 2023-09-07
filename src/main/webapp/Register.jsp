<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.helper.*"%>
<%@ page import="com.tech.blog.servlets.*"%>
<%@ page import="com.tech.blog.entities.*"%>
<%@ page import="com.tech.blog.dao.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Fonts -->
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/style.css">
<link rel="icon" href="Favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<title>Register</title>
<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.2.1/css/all.css"
	crossorigin="anonymous">
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
					<li><a href="index.jsp">Home</a></li>
					<li><a href="Register.jsp">Register</a></li>
					<li><a href="aboutus.jsp">About Us</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</nav>
			<!--  End of Navbar -->
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
	<main class="login-form">
		<div class="cotainer" style="margin-top: 140px; margin-bottom: 50px">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header text-md-center">
							<h2>Register Here</h2>
						</div>
						<div class="card-body">
							<form id="RegisterForm" action="RegisterServlet" method="POST">
								<div class="form-group row">
									<label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
									<div class="col-md-6">
										<input type="text" id="name" class="form-control" name="Name"
											required autofocus>
									</div>
								</div>
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">E-Mail
										Address</label>
									<div class="col-md-6">
										<input type="text" id="email_address" class="form-control"
											name="email-address" required autofocus>
									</div>
								</div>
								<div class="form-group col-md-6 offset-md-4 row">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="Radio"
											id="inlineRadio1" value="male"> <label
											class="form-check-label" for="inlineRadio1">Male</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="Radio"
											id="inlineRadio2" value="female"> <label
											class="form-check-label" for="inlineRadio2">Female</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">Password</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">Confirm
										Password</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" name="agree">
												Terms and Conditions
											</label>
										</div>
									</div>
								</div>
								<div class="col-md-6 offset-md-4 text-center" id="loader"
									style="display: none;">
									<i class="fa fa-rotate-right fa-spin fa-3x "></i>
									<h4>Please wait...</h4>
								</div>
								<div class="col-md-6 offset-md-4">
									<button id="submit-btn" type="submit" class="btn btn-primary">
										Register</button>
								</div>
								<div class="col-md-6 offset-md-4">
									<span> Already have account </span> <a href=Login.jsp
										class="btn btn-link"> Login </a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
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
							<a href="aboutus.jsp" class="footer-link-more">Learn More</a>
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
							PostDao pod = new PostDao(Conprovider.getConnection());
							List<Category> categories = pod.getAllCategories();
							for (Category c : categories) {
							%>
							<li><a href="index.jsp"><i class="bi bi-chevron-right"></i>
									<%=c.getCname()%></a></li>
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
							<li><a href="Show_blog.jsp"
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
	<!-- JavaScript-->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<script>
 	 		$(document).ready(function(){
 			console.log("loaded......")
 					$('#RegisterForm').on('submit', function(event){
 				event.preventDefault();
 					let Form = new FormData(this);
 				$("#submit-btn").hide();
 				$("loader").show();
 								//send register servlet
 				$.ajax({
 					url:"RegisterServlet",
 					type: 'post',
 					data: Form,
 					success: function ( data, textStatus, jqXHR){
 						console.log(data)
 						 						$("#submit-btn").show();
 		 				$("loader").hide();
 		 				 		 				if(data.trim() === 'done' ){
 		 					swal("Regestration sccessful! Redirecting to the Login page....")
 		 					.then((value) => {
 		 							  	window.location.href = "Login.jsp"
 		 					});
 		 				}else{
 		 					swal(data);
 		 				} 
 					},
 					error: function(jqXHR, textStatus, errorThrown){
 						$("#submit-btn").show();
 		 				$("loader").hide();
 		 				swal("Something went wrong... Try again !!"); 
 		 				},
 					processData: false,
 					contentType: false
 				});
 			});
 		}); 
 		</script>
</body>
</html>