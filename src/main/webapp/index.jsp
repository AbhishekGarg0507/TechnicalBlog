<%@page import="com.tech.blog.helper.*"%>
<%@ page import="com.tech.blog.entities.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tech.blog.dao.*" %>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">


  <title>TechBlog</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="css/Loadpost.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
 

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

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
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1> TechBlog </h1>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li class="dropdown"><a href="Show_blog.jsp"><span>Categories</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
               <%
					PostDao PD1 = new PostDao(Conprovider.getConnection());
					ArrayList<Category> list= PD1.getAllCategories();
	
					for(Category c:list){
						
					
				%>
				
				<li> <%=c.getCname() %></li>
				<%
					}
				%>
            </ul>
          </li>
          <li><a href="Login.jsp">Log In</a></li>
          <li><a href="Register.jsp">Register</a></li>
          <li><a href="aboutus.jsp">About Us</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
          
          
        </ul>
      </nav>
      <!--  End of Navbar -->

      <div class="position-relative">
        <a href="#" class="mx-2"><span class="bi-facebook"></span></a>
        <a href="#" class="mx-2"><span class="bi-twitter"></span></a>
        <a href="#" class="mx-2"><span class="bi-instagram"></span></a>

        <a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
        <i class="bi bi-list mobile-nav-toggle"></i>


        <!-- ======= Search Form ======= -->
        <div class="search-form-wrap js-search-form-wrap">
          <form action="search-result.html" class="search-form">
            <span class="icon bi-search"></span>
            <input type="text" placeholder="Search" class="form-control">
            <button class="btn js-search-close"><span class="bi-x"></span></button>
          </form>
        </div>
        <!-- End Search Form -->

      </div>

    </div>

  </header>
  <!-- End Header -->

  <main id="main">

    <!-- ======= Hero Slider Section ======= -->
    <section id="hero-slider" class="hero-slider">
      <div class="container-md" data-aos="fade-in">
        <div class="row">
          <div class="col-12">
            <div class="swiper sliderFeaturedPosts">
              <div class="swiper-wrapper">
                
                
                <%	
                	PostDao d = new PostDao(Conprovider.getConnection());
                	List<Post> posts = d.getAllPosts();
                		
                	for(Post p:posts){
                
                   %>
                <div class="swiper-slide">
                  <a href="#" class="img-bg d-flex align-items-end" style="background-image: url('Blogs_pics/<%= p.getpPic() %>');">
                    <div class="img-bg-inner">
                      	<h2><%= p.getpTitle()%></h2>
                      	<p> <%= p.getpContent()%></p>
                    </div>
                  </a>
                </div>
                	<%
                	 	}
                	%>
                	
                	

               
              </div>
              <div class="custom-swiper-button-next">
                <span class="bi-chevron-right"></span>
              </div>
              <div class="custom-swiper-button-prev">
                <span class="bi-chevron-left"></span>
              </div>

              <div class="swiper-pagination"></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End Hero Slider Section -->

    <!-- ======= Post Grid Section ======= -->
    
    <%
    
    LikeDao ld = new LikeDao(Conprovider.getConnection());
    Userdao ud = new Userdao(Conprovider.getConnection());
	PostDao pod = new PostDao(Conprovider.getConnection());
	List<Post> posts1 = pod.getAllPosts();
    %>
    <section id="posts" class="posts">
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-lg-4">
          <%
           int limit6 = 0;
           for(Post pt:posts1){ 
           if (limit6 < 1){
           %>
            <div class="post-entry-1 lg">
              <a href="Show_blog.jsp"><img src="Blogs_pics/<%= pt.getpPic() %>" alt="" class="img-fluid"></a>
              <div class="post-meta"><span class="date"><%= pod.getCategoryByCatID(pt.getcatId()).getCname() %></span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div>
              <h2><a href="Show_blog.jsp"><%= pt.getpTitle() %></a></h2>
              <p class="mb-4 d-block"><%= pt.getpContent() %></p>

              <div class="d-flex align-items-center author">
              	
                		<span><a href="#" onclick="doLike(<%=pt.getpId() %>,<%= pt.getUserId() %>)" > <i class="mdi mdi-heart"></i><span class="like-count"><%= ld.countLikeOnPost(pt.getpId())%></span></a></span>
                		
                <div class="photo"><img src="Blogs_pics/<%= ud.getUserByUserId(pt.getUserId()).getProfile() %>" alt="" class="img-fluid"></div>
                <div class="name">
                  <h3 class="m-0 p-0"><%= ud.getUserByUserId(pt.getUserId()).getUname() %></h3>
                </div>
              </div>
            </div>
            <% 
          		}
           limit6++;
           }
            %>

          </div>

          <div class="col-lg-8">
            <div class="row g-5">
              <div class="col-lg-4 border-start custom-border">
              	<%

				int limit5 = 1;
				for(Post pos : posts1){
				if(limit5 < 4){
				
              	
              	%>
                <div class="post-entry-1">
                  <a href="Show_blog.jsp"><img src="Blogs_pics/<%= pos.getpPic() %>" alt="" class="img-fluid"></a>
                  <div class="post-meta">
                  
                	<span><a href="#" onclick="doLike(<%=pos.getpId() %>,<%= pos.getUserId() %>)" > <i class="mdi mdi-heart"></i><span class="like-count"><%= ld.countLikeOnPost(pos.getpId())%></span></a></span><span class="mx-1">&bullet;</span>
                		
                  <span class="date"><%= ud.getUserByUserId(pos.getUserId()).getUname()%></span> <span class="mx-1">&bullet;</span> <span><%= DateFormat.getDateInstance().format(pos.getpDate()) %></span></div>
                  <h2><a href="Show_blog.jsp"><%= pos.getpTitle() %></a></h2>
                </div>
                <%
				}
	    		limit5++;
	    		}
                
                
                %>
                
              </div>
              
              
              
              <div class="col-lg-4 border-start custom-border">
              <%

				int limit4 = 1;
				for(Post pos : posts1){
				if(limit4 < 4){
				
              
              
              %>
                <div class="post-entry-1">
                  <a href="Show_blog.jsp"><img src="Blogs_pics/<%= pos.getpPic() %>" alt="" class="img-fluid"></a> 
                  <div class="post-meta">
                  
                	<span><a href="#" onclick="doLike(<%=pos.getpId() %>,<%= pos.getUserId() %>)" > <i class="mdi mdi-heart"></i><span class="like-count"><%= ld.countLikeOnPost(pos.getpId())%></span></a></span><span class="mx-1">&bullet;</span>
                	
                  <span class="date"><%= ud.getUserByUserId(pos.getUserId()).getUname()%></span> <span class="mx-1">&bullet;</span> <span><%= DateFormat.getDateInstance().format(pos.getpDate()) %></span></div>
                  <h2><a href="Show_blog.jsp"><%= pos.getpTitle() %></a></h2>
                </div>
                <%
				}
	    		limit4++;
	    		}
                
                %>
              </div>

              <!-- Trending Section -->
              <div class="col-lg-4">

                <div class="trending">
                  <h3>Trending</h3>
                  <ul class="trending-post">
                 <%
                 		
        		
        				int limit1 = 1;
        				for(Post pos : posts1){
        				if(limit1 < 6){
						
					
				%>
                    <li>
                      <a href="single-post.html">
                        <span class="number"><%=limit1 %></span>
                        <h3><%= pos.getpTitle() %></h3>
                        <span class="author"><%=  ud.getUserByUserId(pos.getUserId()).getUname() %></span>
                      </a>
                    </li>
                     <%
    			}
    		limit1++;
    		}
                  %>
                  <!--   <li>
                      <a href="single-post.html">
                        <span class="number">2</span>
                        <h3>17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</h3>
                        <span class="author">Wade Warren</span>
                      </a>
                    </li>
                    <li>
                      <a href="single-post.html">
                        <span class="number">3</span>
                        <h3>13 Amazing Poems from Shel Silverstein with Valuable Life Lessons</h3>
                        <span class="author">Esther Howard</span>
                      </a>
                    </li>
                    <li>
                      <a href="single-post.html">
                        <span class="number">4</span>
                        <h3>9 Half-up/half-down Hairstyles for Long and Medium Hair</h3>
                        <span class="author">Cameron Williamson</span>
                      </a>
                    </li>
                    <li>
                      <a href="single-post.html">
                        <span class="number">5</span>
                        <h3>Life Insurance And Pregnancy: A Working Mom’s Guide</h3>
                        <span class="author">Jenny Wilson</span>
                      </a>
                    </li>--> 
                  </ul>
                </div>

              </div> <!-- End Trending Section -->
            </div>
          </div>

        </div> <!-- End .row -->
      </div>
    </section> <!-- End Post Grid Section -->

    
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="footer-content">
      <div class="container">

        <div class="row g-5">
          <div class="col-lg-4">
            <h3 class="footer-heading">About TechBlog</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam ab, perspiciatis beatae autem deleniti voluptate nulla a dolores, exercitationem eveniet libero laudantium recusandae officiis qui aliquid blanditiis omnis quae. Explicabo?</p>
            <p><a href="aboutus.jsp" class="footer-link-more">Learn More</a></p>
          </div>
          <div class="col-6 col-lg-2">
            <h3 class="footer-heading">Navigation</h3>
            <ul class="footer-links list-unstyled">
              <li><a href="index.jsp"><i class="bi bi-chevron-right"></i> Home</a></li>
              <li><a href="Show_blog.jsp"><i class="bi bi-chevron-right"></i> Categories</a></li>
              <li><a href="Register.jsp"><i class="bi bi-chevron-right"></i> Register</a></li>
              <li><a href="aboutus.jsp"><i class="bi bi-chevron-right"></i> About us</a></li>
              <li><a href="contact.jsp"><i class="bi bi-chevron-right"></i> Contact</a></li>
            </ul>
          </div>
          <div class="col-6 col-lg-2">
            <h3 class="footer-heading">Categories</h3>
            <ul class="footer-links list-unstyled">
               <%
					for(Category c: list){
						
					
				%>
              <li><a href="#"><i class="bi bi-chevron-right"></i> <%= c.getCname() %></a></li>
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
            		List<Post> post = pd.getAllPosts();
            		
            		int limit = 0;
            		for(Post pos : post){
            		if(limit < 4){
            		
            	%>
              <li>
                <a href="single-post.html" class="d-flex align-items-center">
                  <img src="Blogs_pics/<%=pos.getpPic() %>" alt="" class="img-fluid me-3">
                  <div>
                    <div class="post-meta d-block"><span class="date"><%= pd.getCategoryByCatID(pos.getcatId()).getCname() %></span> <span class="mx-1">&bullet;</span> <span><%= DateFormat.getDateInstance().format(pos.getpDate()) %></span></div>
                    <span><%= pos.getpTitle() %></span>
                  </div>
                </a>
              </li>
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
              © Copyright <strong><span>TechBlog</span></strong>. All Rights Reserved
            </div>

            

          </div>

          <div class="col-md-6">
            <div class="social-links mb-3 mb-lg-0 text-center text-md-end">
              <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
              <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>

          </div>

        </div>

      </div>
    </div>

  </footer>

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/glightbox/js/glightbox.min.js"></script>
  <script src="vendor/aos/aos.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>


        
        <!-- JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
