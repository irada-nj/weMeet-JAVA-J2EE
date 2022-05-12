<%-- 
    Document   : profile
    Created on : 23 mars 2022, 13:58:48
    Author     : IRADA
--%>

<%@page import="pk.ma.amitie.models.Amis"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="pk.ma.amitie.dao.MyHibernateUtil"%>
<%@page import="pk.ma.amitie.models.Posts"%>
<%@page import="pk.ma.amitie.models.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
    <% 
        
     Session s=MyHibernateUtil.getSession();
    Utilisateur ucon=null;
    Utilisateur u=null;
    boolean isAmis =false;
    boolean isMe =false;
    if(session.getAttribute("user")==null){
        request.setAttribute("msg", "il faut se connecter tout d'abord!");
        request.getRequestDispatcher("/").forward(request, response);
    }else{
    ucon=(Utilisateur)session.getAttribute("user");
    }
    if(request.getParameter("idu")!=null){ 
    
     int idu=Integer.parseInt(request.getParameter("idu"));
     u=(Utilisateur)s.get(Utilisateur.class,idu);
     for(Amis a:ucon.getAmisesForIdu()){
         if(a.getUtilisateurByIduAmis().getIdu()==u.getIdu()){
          isAmis=true;
          break;
     
     }
     }
     
    }else{
     u=ucon; 
      isMe=true;
    }
    
    %>
    <jsp:include page="header.jsp"></jsp:include>


		<section class="cover-sec">
			<img src="/weMeet/images/<%=u.getBanniereimg()%>" alt="" height="200px">
		</section>


		<main>
			<div class="main-section">
				<div class="container">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-3">
								<div class="main-left-sidebar">
									<div class="user_profile">
										<div class="user-pro-img">
											<img src="/weMeet/images/<%=u.getProfilimg()%>" alt="">
										</div><!--user-pro-img end-->
										<div class="user_pro_status">
											<ul class="flw-hr">
												<%if(!isMe && !isAmis){%>
												<li><a href="#" title="" class="flww"><i class="la la-plus"></i>Send an invitation</a></li>
												<%}%>
												
											</ul>
											<ul class="flw-status">
												<li>
													<span>Friends</span>
													<b><%=u.getAmisesForIdu().size()%></b>
												</li>
												
											</ul>
										</div><!--user_pro_status end-->
										
									</div><!--user_profile end-->
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3>Friends</h3>
											<i class="la la-ellipsis-v"></i>
										</div><!--sd-title end-->
										<div class="suggestions-list">
                                                                                    <% 
                                                                                    for(int i=0;i<10;i++){
                                                                                      try{  
                                                                                      Utilisateur amis=u.getAmisesForIdu().get(i).getUtilisateurByIduAmis();
                                                                                    
                                                                                    %>
											<div class="suggestion-usd">
												<img src="/weMeet/images/<%=amis.getProfilimg()%>"  alt="" width="30px" height="30px">
												<div class="sgt-text">
													<h4><%=amis.getNom()+" "+amis.getPrenom()%></h4>
													<span><%=amis.getVille().getNomv()%></span>
												</div>
                                                                                                        <a href="/weMeet/views/profile.jsp?idu=<%=amis.getIdu()%>"<span><i class="la la-plus"></i></span></a>
											</div>
											
										<% }catch(Exception e){
                                                                                                                                    
                                                                                                                    }}%>	
											
											
											<div class="view-more">
												<a href="#" title="">View More</a>
											</div>
										</div><!--suggestions-list end-->
									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-6">
								<div class="main-ws-sec">
									<div class="user-tab-sec">
										<h3><%=u.getNom()+" "+u.getPrenom()%></h3>
										<div class="star-descp">
											<span><%=u.getVille().getNomv()%></span>
											<ul>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star-half-o"></i></li>
											</ul>
										</div><!--star-descp end-->
										<div class="tab-feed">
											<ul>
												<li data-tab="feed-dd" class="active">
													<a href="#" title="">
														<img src="images/ic1.png" alt="">
														<span>Feed</span>
													</a>
												</li>
												<li data-tab="info-dd">
													<a href="#" title="">
														<img src="images/ic2.png" alt="">
														<span>Info</span>
													</a>
												</li>
												<li data-tab="portfolio-dd">
													<a href="#" title="">
														<img src="images/ic3.png" alt="">
														<span>Portfolio</span>
													</a>
												</li>
											</ul>
										</div><!-- tab-feed end-->
									</div><!--user-tab-sec end-->
									<div class="product-feed-tab current" id="feed-dd">
										<div class="posts-section">
                                                                                    
                                                                                    
                                                                                        
            
                                                                                    
                                                                                    <%  
                                                                                        String mot=request.getParameter("search");
                                                                                        Query q=s.createQuery("Select u from Utilisateur u where lower(u.nom) like '%"+mot.toLowerCase()+"%' or lower(u.prenom)like'%"+mot.toLowerCase()+"%'");
                                                                                       
                                                                                        List<Utilisateur> ps=q.list();
                                                                                        for(Utilisateur us:ps){
                                                                                    
                                                                                    %>
                                                                                    
											<div class="post-bar">
												<div class="post_topbar">
													<div class="usy-dt">
														<img src="/weMeet/images/<%=us.getProfilimg()%>" alt="" width="35px" height="35px">
														<div class="usy-name">
															<h3><%=us.getNom()+" "+us.getPrenom()%></h3>
															<span><%=us.getVille().getNomv()%></span>
														</div>
													</div>
													<div class="ed-opts">
														
													</div>
												</div>
												
												
												<div class="job-status-bar">
                                                                                                    <a href="/weMeet/views/profile.jsp?idu=<%=us.getIdu()%>"><button class="btn btn-info">See profile</button></a>  
                                                                                                    
                                                                                                                         <button class="btn btn-success">Send an invitation</button>
													
												</div>
											</div><!--post-bar end-->
                                                                                        
											<%
                                                                                        }
                                                                                        %>
											
												
											<div class="process-comm">
												<div class="spinner">
													<div class="bounce1"></div>
													<div class="bounce2"></div>
													<div class="bounce3"></div>
												</div>
											</div><!--process-comm end-->
										</div><!--posts-section end-->
									</div><!--product-feed-tab end-->
									<div class="product-feed-tab" id="info-dd">
										<div class="user-profile-ov">
											<h3>Overview</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor aliquam felis, nec condimentum ipsum commodo id. Vivamus sit amet augue nec urna efficitur tincidunt. Vivamus consectetur aliquam lectus commodo viverra. Nunc eu augue nec arcu efficitur faucibus. Aliquam accumsan ac magna convallis bibendum. Quisque laoreet augue eget augue fermentum scelerisque. Vivamus dignissim mollis est dictum blandit. Nam porta auctor neque sed congue. Nullam rutrum eget ex at maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget vestibulum lorem.</p>
										</div><!--user-profile-ov end-->
										<div class="user-profile-ov st2">
											<h3>Experience</h3>
											<h4>Web designer</h4>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor aliquam felis, nec condimentum ipsum commodo id. Vivamus sit amet augue nec urna efficitur tincidunt. Vivamus consectetur aliquam lectus commodo viverra. </p>
											<h4>UI / UX Designer</h4>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor aliquam felis, nec condimentum ipsum commodo id.</p>
											<h4>PHP developer</h4>
											<p class="no-margin">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor aliquam felis, nec condimentum ipsum commodo id. Vivamus sit amet augue nec urna efficitur tincidunt. Vivamus consectetur aliquam lectus commodo viverra. </p>
										</div><!--user-profile-ov end-->
										<div class="user-profile-ov">
											<h3>Education</h3>
											<h4>Master of Computer Science</h4>
											<span>2015 - 2018</span>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor aliquam felis, nec condimentum ipsum commodo id. Vivamus sit amet augue nec urna efficitur tincidunt. Vivamus consectetur aliquam lectus commodo viverra. </p>
										</div><!--user-profile-ov end-->
										<div class="user-profile-ov">
											<h3>Location</h3>
											<h4>India</h4>
											<p>151/4 BT Chownk, Delhi </p>
										</div><!--user-profile-ov end-->
										<div class="user-profile-ov">
											<h3>Skills</h3>
											<ul>
												<li><a href="#" title="">HTML</a></li>
												<li><a href="#" title="">PHP</a></li>
												<li><a href="#" title="">CSS</a></li>
												<li><a href="#" title="">Javascript</a></li>
												<li><a href="#" title="">Wordpress</a></li>
												<li><a href="#" title="">Photoshop</a></li>
												<li><a href="#" title="">Illustrator</a></li>
												<li><a href="#" title="">Corel Draw</a></li>
											</ul>
										</div><!--user-profile-ov end-->
									</div><!--product-feed-tab end-->
									<div class="product-feed-tab" id="portfolio-dd">
										<div class="portfolio-gallery-sec">
											<h3>Portfolio</h3>
											<div class="gallery_pf">
												<div class="row">
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/271x174" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
													<div class="col-lg-4 col-md-4 col-sm-6 col-6">
														<div class="gallery_pt">
															<img src="http://via.placeholder.com/170x170" alt="">
															<a href="#" title=""><img src="images/all-out.png" alt=""></a>
														</div><!--gallery_pt end-->
													</div>
												</div>
											</div><!--gallery_pf end-->
										</div><!--portfolio-gallery-sec end-->
									</div><!--product-feed-tab end-->
								</div><!--main-ws-sec end-->
							</div>
							<div class="col-lg-3">
								<div class="right-sidebar">
									<div class="message-btn">
										<a href="#" title=""><i class="fa fa-envelope"></i> Message</a>
									</div>
									<div class="widget widget-portfolio">
										<div class="wd-heady">
											<h3>Portfolio</h3>
											<img src="images/photo-icon.png" alt="">
										</div>
										<div class="pf-gallery">
											<ul>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
												<li><a href="#" title=""><img src="http://via.placeholder.com/70x70" alt=""></a></li>
											</ul>
										</div><!--pf-gallery end-->
									</div><!--widget-portfolio end-->
								</div><!--right-sidebar end-->
							</div>
						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>

    
     <jsp:include page="footer.jsp"></jsp:include>
     
     
     <script>
         
  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var type = button.data('whatever') // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
   $("#type").val(type);
}) 
         
         
     </script>
     
    </body>
</html>
