<%-- 
    Document   : profilesetting
    Created on : 28 mars 2022, 16:23:59
    Author     : IRADA
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="pk.ma.amitie.dao.MyHibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="pk.ma.amitie.models.Invitation"%>
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
     Utilisateur u=(Utilisateur)session.getAttribute("user"); 



%>

<section class="profile-account-setting">
			<div class="container">
                           
                            
                            
                            
				<div class="account-tabs-setting">
					<div class="row">
						<div class="col-lg-3">
							<div class="acc-leftbar">
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
								    <a class="nav-item nav-link active" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" role="tab" aria-controls="nav-acc" aria-selected="true"><i class="la la-cogs"></i>Change profile and banner picture</a>
								    <a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>change status</a>
								    <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>Change Password</a>
								    <a class="nav-item nav-link" id="nav-notification-tab" data-toggle="tab" href="#nav-notification" role="tab" aria-controls="nav-notification" aria-selected="false"><i class="fa fa-flash"></i>Notifications</a>
								    <a class="nav-item nav-link" id="nav-requests-tab" data-toggle="tab" href="#nav-requests" role="tab" aria-controls="nav-requests" aria-selected="false"><i class="fa fa-group"></i>Invitation</a>
								    <a class="nav-item nav-link" id="nav-deactivate-tab" data-toggle="tab" href="#nav-deactivate" role="tab" aria-controls="nav-deactivate" aria-selected="false"><i class="fa fa-random"></i>Deactivate Account</a>
								  </div>
							</div><!--acc-leftbar end-->
						</div>
						<div class="col-lg-9">
							<div class="tab-content" id="nav-tabContent">
                                                                <%
                                                                if(request.getAttribute("msg")!=null){
                                                                out.print("<h4 style='color:red'>"+request.getAttribute("msg")+"</h4>");
                                                                }

                                                                %>
								<div class="tab-pane fade show active" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>Change profile and banner photo</h3>
                                                                                <form action="/weMeet/ChangerPhoto" method="post" enctype="multipart/form-data">
											<div class="notbar">
												<h4>Profile photo</h4>
												
												<div class="toggle-btn">
                                                                                                    <input type="file" name="imgprofile" >
												</div>
											</div><!--notbar end-->
											<div class="notbar">
												<h4>Banner picture</h4>
												
												<div class="toggle-btn">
													 <input type="file" name="imgbanniere" >
												</div>
											</div><!--notbar end-->
											
											<div class="save-stngs">
												<ul>
													<li><button type="submit">Save changes</button></li>
													<li><button type="submit">Cancel</button></li>
												</ul>
											</div><!--save-stngs end-->
										</form>
									</div><!--acc-setting end-->
								</div>
							  	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
							  		<div class="acc-setting">
							  			<h3>Change status</h3>
							  			<div class="profile-bx-details">
							  				<div class="row">
							  					
                                                                                            <form action="/weMeet/ChangerStatus" method="post">
                                                                                                <label>Actual status:</label>
                                                                                                <input type="text" class="form-control" name="status" value="<%=u.getStatus()%>">
                                                                                         <div class="save-stngs">
												<ul>
													<li><button type="submit">Save changes</button></li>
													<li><button type="submit">Cancel</button></li>
												</ul>
											</div><!--save-stngs end--> 
                                                                                            </form>    
							  					
							  					
							  				</div>
							  			</div><!--profile-bx-details end-->
							  			<div class="pro-work-status">
							  				<!-- <h4>Work Status  -  Last Months Working Status</h4> -->
							  			</div><!--pro-work-status end-->
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
							  		<div class="acc-setting">
										<h3>Change password</h3>
                                                                                <form action="/weMeet/ChangerMdp" method="post">
											<div class="cp-field">
												<h5>Old Password</h5>
												<div class="cpp-fiel">
													<input type="password" name="oldmdp" placeholder="Old Password">
													<i class="fa fa-lock"></i>
												</div>
											</div>
											<div class="cp-field">
												<h5>New Password</h5>
												<div class="cpp-fiel">
													<input type="password" name="newmdp" placeholder="New Password">
													<i class="fa fa-lock"></i>
												</div>
											</div>
											<div class="cp-field">
												<h5>Repeat Password</h5>
												<div class="cpp-fiel">
													<input type="password" name="repeatmdp" placeholder="Repeat Password">
													<i class="fa fa-lock"></i>
												</div>
											</div>
											<div class="cp-field">
												<h5><a href="#" title="">Forgot Password?</a></h5>
											</div>
											<div class="save-stngs pd2">
												<ul>
													<li><button type="submit">Save changes</button></li>
													<li><button type="submit">Cancel</button></li>
												</ul>
											</div><!--save-stngs end-->
										</form>
									</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-notification" role="tabpanel" aria-labelledby="nav-notification-tab">
							  		<div class="acc-setting">
							  			<h3>Notifications</h3>
							  			<div class="notifications-list">
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Poonam Verma</a> Bid on your Latest project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Tonney Dhman</a> Comment on your project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Poonam Verma </a> Bid on your Latest project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Tonney Dhman</a> Comment on your project</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  				<div class="notfication-details">
								  				<div class="noty-user-img">
								  					<img src="http://via.placeholder.com/35x35" alt="">
								  				</div>
								  				<div class="notification-info">
								  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
								  					<span>2 min ago</span>
								  				</div><!--notification-info -->
							  				</div><!--notfication-details end-->
							  			</div><!--notifications-list end-->
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-requests" role="tabpanel" aria-labelledby="nav-requests-tab">
							  		<div class="acc-setting">
							  			<h3>Invitation</h3>
                                                                                <% 
                                                                                       
                                                                                    Session s=MyHibernateUtil.getSession();
                                                                          List<Invitation> invs=s.createQuery("Select i from Invitation i where i.status='en cours' and i.utilisateurByIduInvite.idu="+u.getIdu()).list();
                                                                                            
                                                                                    for(Invitation is:invs){  
                                                                                
                                                                                %> 
							  			<div class="requests-list">
							  				<div class="request-details">
							  					<div class="noty-user-img">
                                                                                                    <img src="<%=is.getUtilisateurByIdu().getProfilimg()%>" alt="" height="35px" width="35px">
							  					</div>
							  					<div class="request-info">
							  						<h3><%=is.getUtilisateurByIdu().getNom()+" "+is.getUtilisateurByIdu().getPrenom()%></h3>
							  						<span><%=is.getUtilisateurByIdu().getVille().getNomv()%></span>
							  					</div>
							  					<div class="accept-feat">
							  						<ul>
                                                                                                            <li><a href="/weMeet/Inviter?action=accepte&idinv=<%=is.getIdinv()%>"><button type="button" class="accept-req">Accept</button></a></li>
                                                                                                            <li><a href="/weMeet/Inviter?action=refuse&idinv=<%=is.getIdinv()%>"><button type="button" class="close-req"><i class="la la-close"></i></button></a></li>
							  						</ul>
							  					</div><!--accept-feat end-->
							  				</div><!--request-detailse end-->
							  				<%}%>
							  				
							  				
							  				
							  				
							  			</div><!--requests-list end-->
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-deactivate" role="tabpanel" aria-labelledby="nav-deactivate-tab">
							  		<div class="acc-setting">
										<h3>Deactivate Account</h3>
                                                                                <form action="/weMeet/DesactiverCompte" method="post">
											<div class="cp-field">
												<h5>Email</h5>
												<div class="cpp-fiel">
													<input type="text" name="email" placeholder="Email">
													<i class="fa fa-envelope"></i>
												</div>
											</div>
											<div class="cp-field">
												<h5>Password</h5>
												<div class="cpp-fiel">
													<input type="password" name="password" placeholder="Password">
													<i class="fa fa-lock"></i>
												</div>
											</div>
											<div class="cp-field">
												<h5>Please Explain Further</h5>
												<textarea></textarea>
											</div>
											<div class="cp-field">
												<div class="fgt-sec">
													<input type="checkbox" name="cc" id="c4">
													<label for="c4">
														<span></span>
													</label>
													<small>Email option out</small>
												</div>
												<p></p>
											</div>
											<div class="save-stngs pd3">
												<ul>
													<li><button type="submit">Save</button></li>
													<li><button type="submit">Restore Setting</button></li>
												</ul>
											</div><!--save-stngs end-->
										</form>
									</div><!--acc-setting end-->
							  	</div>
							</div>
						</div>
					</div>
				</div><!--account-tabs-setting end-->
			</div>
		</section>





    </body>
    <jsp:include page="footer.jsp"></jsp:include>
    
<script type="text/javascript" src="/weMeet/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="/weMeet/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="/weMeet/js/script.js"></script>
</html>
