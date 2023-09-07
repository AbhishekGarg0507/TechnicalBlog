<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.*"%>
<%@ page import="com.tech.blog.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tech.blog.helper.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page errorPage="Error_page.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>




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
<title><%=user.getUname()%></title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="icon" href="Favicon.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.2.1/css/all.css"
	crossorigin="anonymous">
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
					<li><a href="index.jsp">MyBlog</a></li>
					<li class="dropdown"><a href="#" onclick="getPosts(0,this)"
						class="list-group-item list-group-item-action c-link"><span>Categories</span>
							<i class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<%
							PostDao PD = new PostDao(Conprovider.getConnection());
							ArrayList<Category> list1 = PD.getAllCategories();
							for (Category c : list1) {
							%>
							<li><a href="#" onclick="getPosts(<%=c.getCid()%>, this)"
								class=" c-link list-group-item list-group-item-action"><%=c.getCname()%></a>
							</li>
							<%
							}
							%>
						</ul></li>
					<li><a href="#" data-toggle="modal"
						data-target="#Upload-post-modal">Upload</a></li>
					<li><a href="aboutus.jsp">About</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</nav>
			<!--  End of Navbar -->
			<div class="position-relative ">
				<div class="position-relative">
					<a href="#" data-toggle="modal" data-target="#logout-btn-modal">
						<%=user.getUname()%></a> <a href="LogoutServlet" class="mx-2">Logout</a>
					<a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
					<i class="bi bi-list mobile-nav-toggle"></i>
				</div>
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
	<!-- profile modal -->
	<div style="margin-top: 100px;">
				<!-- Profile Modal -->
		<div class="modal fade" id="logout-btn-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title " id="exampleModalLongTitle">Techblog</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!--  profile details shown -->
					<div class="modal-body">
						<div class="container text-center">
							<img src="Profilepics/<%=user.getProfile()%>" class="img-fluid"
								style="border-radius: 50%; max-width: 100px;">
							<h2 class="modal-title " id="exampleModalLongTitle">
								<%=user.getUname()%></h2>
							<hr>
							<div id="profile-details">
								<table
									class="container details glyphicon glyphicon-user one text-left">
									<tr>
										<th>ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th>Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
								</table>
								<hr>
								<div class="container glyphicon glyphicon-user one">
									Registered On:
									<%=user.getRdate()%></div>
							</div>
						</div>
					</div>
					<!-- Edit Profile details  -->
					<div id="profile-details-edit" style="display: none;">
						<h4 class="text-center" style="margin-top: -25px; color: #ff8741;">
							Please Edit carefully!</h4>
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">
							<table class="container"
								style="margin-left: 20px; margin-right: 20px; max-width: 450px;">
								<tr>
									<th>ID:</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th>Gender:</th>
									<td><%=user.getGender().toUpperCase()%></td>
								</tr>
								<tr>
									<th>Name:</th>
									<td><input type="text" class="form-control"
										name="user_name" value="<%=user.getUname()%>"></td>
								</tr>
								<tr>
									<th>Email:</th>
									<td><input type="email" class="form-control"
										name="user_email" value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th>Password:</th>
									<td><input type="password" class="form-control"
										name="user_password" value="<%=user.getUserpassword()%>"></td>
								</tr>
								<tr>
									<th>New Profile Pic:</th>
									<td><input type="file" class="form-control"
										name="user_profilepic"></td>
								</tr>
							</table>
							<div class="text-center"
								style="margin-top: 10px; margin-bottom: 10px;">
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary text-center"
							id="edit-profile-button">Edit profile</button>
					</div>
					<!-- end of edit profile modal -->
				</div>
			</div>
		</div>
		<!-- End of Profile modal -->
		<!-- upload post modal -->
		<div class="modal fade" id="Upload-post-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">Upload
							Post</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="AddPostServlet" id="add-post-form" method="POST">
							<div class="form-group">
								<select class="form-control" name="cid">
									<option selected disabled>-- Select category --</option>
									<%
									PostDao postd = new PostDao(Conprovider.getConnection());
									ArrayList<Category> list = postd.getAllCategories();
									for (Category c : list) {
									%>
									<option value="<%=c.getCid()%>">
										<%=c.getCname()%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="form-group">
								<input name="pTitle" class="form-control" type="text"
									placeholder="Enter post Title" />
							</div>
							<div class="form-group">
								<textarea name="pContent" class="form-control"
									placeholder="Enter your content"></textarea>
							</div>
							<div class="form-group">
								<textarea name="pCode" class="form-control"
									placeholder="Enter your code(IF ANY)"> </textarea>
							</div>
							<div class="form-group">
								<label for="pPic">Select your Pics:</label> <br> <input
									type="file" name="pPic">
								<!--<input type="file" name="cpic" > -->
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Post</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- END of upload post modal -->
	</div>
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<!--  Start of the main body of the page -->
	<main>
		<div class="container">
			<div class="row">
				<!-- first column -->
				<div class="col-md-2">
					<!-- this column has all the categories -->
					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)"
							class="list-group-item list-group-item-action c-link active"
							aria-current="true"> All Posts </a>
						<%
						PostDao d = new PostDao(Conprovider.getConnection());
						ArrayList<Category> List2 = d.getAllCategories();
						for (Category c : List2) {
						%>
						<a href="#" onclick="getPosts(<%=c.getCid()%>, this)"
							class=" c-link list-group-item list-group-item-action"><%=c.getCname()%></a>
						<%
						}
						%>
					</div>
				</div>
				<!-- SECOND column -->
				<div class="col-md-8">
					<!-- posts-->
					<div class="container text-center" id="loader">
						<i class="fa fa-rotate-right fa-spin fa-2x "></i>
						<h3 class="mt-2">Loading....</h3>
					</div>
					<div class="container-fluid" id="post-container"></div>
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
							PostDao psdo = new PostDao(Conprovider.getConnection());
							ArrayList<Category> cat = psdo.getAllCategories();
							for (Category c : cat) {
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
	<script src="js/myJs.js"></script>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- edit profile js -->
	<script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function ()
                                    {
                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-details-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-details-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit profile")
                                        }
                                    })
                                });
        </script>
	<!--  add post js -->
	<script>
			$(document).ready(function(e){
				$("#add-post-form").on("submit",function(event){
					// this code gets called when form is submitted.
					event.preventDefault();
					console.log("you just clicked submit"); 
					let form = new FormData(this);
					// now requesting to server
					$.ajax({
						url:"AddPostServlet",
						type:'POST',
						data:form,
						success: function (data, textStatus, jqXHR) {
						// succefully post the data
						console.log(data);
						 if(data.trim() == 'done'){
								swal("Good job!", "saved successfully!", "success");
							}else{
								swal("ERROR!", "Something went wrong! try again..", "error");
							} 
						},
						error: function(jqXHR,textStatus,errorThrown){
						 swal("ERROR!", "Something went wrong! try again..", "error"); 
						},
						processData:false,
						contentType:false
					})
				})	
			})
		</script>
	<!-- loading posts  -->
	<script>
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()
                $(".c-link").removeClass('active')
                $.ajax({
                    url: "Load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            } 
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)
               
            })
        </script>
</body>
</html>