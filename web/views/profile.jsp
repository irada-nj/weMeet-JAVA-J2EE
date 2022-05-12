<%-- 
    Document   : profile
    Created on : 23 mars 2022, 13:58:48
    Author     : IRADA
--%>

<%@page import="pk.ma.amitie.models.Invitation"%>
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
    <jsp:include page="header.jsp"></jsp:include>
  
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
												<li><a href="#" title="" class="flww" data-toggle="modal" data-target="#inviterModal" data-idu="<%=u.getIdu()%>" data-nom="<%=u.getNom()%>"><i class="la la-plus"></i>Send an invitation</a></li>
                                                                                              
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
                                                                        
                             <div class="modal fade" id="inviterModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                  <div class="modal-content">
                                                                    <div class="modal-header">
                                                                      <h5 class="modal-title" id="exampleModalLabel">Send an invitation</h5>
                                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                      </button>
                                                                    </div>
                                                                      <form action="/weMeet/Inviter" method="post">
                                                                    <div class="modal-body">
                                                                        
                                                                        <div class="form-group">
                                                                          <label for="recipient-name" class="col-form-label">friends to invite:</label>
                                                                          <input type="text" class="form-control" name="nom" readonly="">
                                                                        </div>
                                                                          <input type="hidden" name="idu" id="idu">
                                                                      
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                      <button type="submit" class="btn btn-primary">Invite</button>
                                                                    </div>
                                                                      </form>
                                                                  </div>
                                                                </div>
                                                     </div>
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                         
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3>Friends</h3>
											<i class="la la-ellipsis-v"></i>
										</div><!--sd-title end-->
										<div class="suggestions-list">
                                                                                    <% 
                                                                                        if(isMe||isAmis){
                                                                                    for(int i=0;i<10;i++){
                                                                                      try{  
                                                                                      Utilisateur amis=u.getAmisesForIdu().get(i).getUtilisateurByIduAmis();
                                                                                    
                                                                                    %>
											<div class="suggestion-usd">
												<img src="/weMeet/images/<%=amis.getProfilimg()%>"  alt="" width="30px" height="30px">
												<div class="sgt-text">
											           <a href="/weMeet/views/profile.jsp?idu=<%=amis.getIdu()%>"><h4><%=amis.getNom()+" "+amis.getPrenom()%></h4></a>
													<span><%=amis.getVille().getNomv()%></span>
												</div>
                                                                                                        
											</div>
											
										<% }catch(Exception e){
                                                                                                                                    
                                                                                                                    }}%>	
											
											
											<div class="view-more">
												<a href="#" title="">View More</a>
											</div>
                                                                                          <%}else{%>
                                                                                          <h5>You have to be friends to see his friends </h5>
                                                                                          <%}%>
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
                                                                            <%
                                                                            if(isMe||isAmis){
                                                                            
                                                                            
                                                                            %>
                                                                            
                                                                            
										<div class="posts-section">
                                                                                    
                                                                                    <div class="post-bar">
												<div class="post_topbar">
													<div class="usy-dt">
														<img src="/weMeet/images/<%=u.getProfilimg()%>" alt="" width="35px" height="35px">
														<div class="usy-name">
															<h3><%=u.getNom()+" "+u.getPrenom()%></h3>

                                                                                                                </div>
                                                                                                        </div>
                                                                                                                        
                                                                                                                         <div class="ed-opts">
                                                                                                                        <a href="#" title="" class="ed-opts-open"><i class="la la-ellipsis-v"></i></a>
                                                                                                                        <ul class="ed-options">
															<li><a href="#" data-toggle="modal" data-target="#exampleModal" data-whatever="image" title="">Post an image</a></li>
															<li><a href="#" data-toggle="modal" data-target="#exampleModal" data-whatever="video" title="">Post a video</a></li>
															
                                                                                                                        </ul>
                                                                                                                        </div>

                                                                                                </div>
												
												<div class="job_descp">
													
													
                                                                                                    <form action="/weMeet/AddPost" method="post">
                                                                                                    <div class="form-group">
                                                                                                    
                                                                                                        <input type="text" class="form-control" name="titre" placeholder="give a title to your post">
                                                                                                        
                                                                                                    </div>
                                                                                                    <div class="form-group">
                                                                                                        
                                                                                                        <textarea class="form-control" name="contenu" rows="3" placeholder="content of your post"></textarea>
                                                                                                    </div>
                                                                                                                    
													<button type="submit" class="btn btn-info">Poster</button>
                                                                                                 </form>
												</div>
												
											</div><!--post-add end-->
                                                                                        
              <!--post-add image video-->     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post an image or a video</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form action="/weMeet/AddPostImageVideo" method="post" enctype="multipart/form-data">
      <div class="modal-body">
           
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Title:</label>
            <input type="text" class="form-control" name="titre">
          </div>
          <div class="form-group">
              <input type="file" name="file" class="form-control">
          </div>
            <input type="hidden" name="type" id="type">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Post</button>
      </div>
       </form>
    </div>
  </div>
</div>
                                                                                    
                                                                                    <%  
                                                                                        Query q=s.createQuery("Select p from Posts p where p.utilisateur.idu=:idu order by p.dateposte desc");
                                                                                        q.setInteger("idu",u.getIdu());
                                                                                        List<Posts> ps=q.list();
                                                                                        for(Posts post:ps){
                                                                                    
                                                                                    %>
											<div class="post-bar">
												<div class="post_topbar">
													<div class="usy-dt">
														<img src="/weMeet/images/<%=u.getProfilimg()%>" alt="" width="35px" height="35px">
														<div class="usy-name">
															<h3><%=u.getNom()+" "+u.getPrenom()%></h3>
															<span><%=post.getDateposte()%></span>
														</div>
													</div>
													<div class="ed-opts">
														<a href="#" title="" class="ed-opts-open"><i class="la la-ellipsis-v"></i></a>
														<ul class="ed-options">
															<li><a href="#" title="">Edit Post</a></li>
															<li><a href="/weMeet/SupprimerPost?idp=<%=post.getIdp()%>" title="">Delete</a></li>
															
														</ul>
													</div>
												</div>
												
												<div class="job_descp">
													<h3><%=post.getTitle()%></h3>
													
                                                                                                        <p> <%if(post.getTypeposte().equals("message")) {%>
                                                                                                          <%=post.getContenu()%>
                                                                                                          <%}else if(post.getTypeposte().equals("image")){
                                                                                                          
                                                                                                          %>
                                                                                                          <img src="/weMeet/images/<%=post.getContenu()%>" width="450px" height="250px">
                                                                                                               
                                                                                                            <%}else{%>
                                                                                                            <video controls="controls" src="/weMeet/videos/<%=post.getContenu()%>" width="450px" height="250px" ><%=post.getTitle()%></video>
                                                                                                       <%}%>
                                                                                                        
                                                                                                        </p>
													
												</div>
												<div class="job-status-bar">
													<ul class="like-com">
														<li>
															<a href="#"><i class="la la-heart"></i> Like</a>
															<img src="/weMeet/images/liked-img.png" alt="">
															<span><%=post.getNbrlikes()%></span>
														</li> 
														<li><a href="#" title="" class="com"><img src="/weMeet/images/com.png" alt=""><%=(post.getCommentaires()!=null)?post.getCommentaires().size():0%> Comments </a></li>
													</ul>
													
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
                                                                                        <%}%>
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
                                                                                    <% if(isMe||isAmis){%>
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
                                                                                <%}%>
									</div><!--product-feed-tab end-->
								</div><!--main-ws-sec end-->
							</div>
							<div class="col-lg-3">
								<div class="right-sidebar">
                                                                    <% if(isMe||isAmis){%>
									<div class="message-btn">
										<a href="#" title=""><i class="fa fa-envelope"></i> Message</a>
									</div>
									<div class="widget widget-portfolio">
										<div class="wd-heady">
											<h3>Invitation</h3>
											<img src="images/photo-icon.png" alt="">
										</div>
										<div class="pf-gallery">
										
                                                                                    <% 
                                                                                        if(isMe){
                                                                                            
                                                                                            List<Invitation> invs=s.createQuery("Select i from Invitation i where i.status='en cours' and i.utilisateurByIduInvite.idu="+u.getIdu()).list();
                                                                                            
                                                                                    for(int i=0;i<10;i++){
                                                                                      try{  
                                                                                      Invitation in=invs.get(i);
                                                                                    
                                                                                    %>
											<div class="suggestion-usd">
                                                                                            <div>
												<img src="/weMeet/images/<%=in.getUtilisateurByIdu().getProfilimg()%>"  alt="" width="30px" height="30px">
                                                                                            </div>
												<div class="sgt-text">
                                                                                                    
													 <a href="/weMeet/views/profile.jsp?idu=<%=in.getUtilisateurByIdu().getIdu()%>"><h4><%=in.getUtilisateurByIdu().getNom()+" "+in.getUtilisateurByIdu().getPrenom()%></h4></a>
													<span>invited on :<%=in.getDateinvitation()%></span>
												</div>
                                                                                                <div>
                                                                                                <a href="/weMeet/Inviter?action=accepte&idinv=<%=in.getIdinv()%>"><button class="btn btn-success">Accept</button></a>
                                                                                                <a href="/weMeet/Inviter?action=refuse&idinv=<%=in.getIdinv()%>"><button class="btn btn-danger">Refuse</button></a>
											</div>
                                                                                                </div>
											
										<% }catch(Exception e){
                                                                                                                                    
                                                                                                                    }}%>	
											
											
											<div class="view-more">
												<a href="#" title="">View More</a>
											</div>
                                                                                          <%}%>
										
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                                    
										</div><!--pf-gallery end-->
									</div><!--widget-portfolio end-->
								</div><!--right-sidebar end-->
                                                                <%}%>
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



$('#inviterModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var idu = button.data('idu')
  var nom = button.data('nom')// Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
 
  modal.find('.modal-body input').val(nom);
  $("#idu").val(idu);
})
         
         
     </script>
     
    </body>
</html>
