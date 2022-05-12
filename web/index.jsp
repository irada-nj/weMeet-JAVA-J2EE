<%-- 
    Document   : index
    Created on : 22 mars 2022, 19:18:44
    Author     : IRADA
--%>

<%@page import="java.util.List"%>
<%@page import="pk.ma.amitie.models.Ville"%>
<%@page import="org.hibernate.Session"%>
<%@page import="pk.ma.amitie.dao.MyHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="views/header.jsp"></jsp:include>
    <body class="sign-in">
	

	<div class="wrapper">
		
                 
		<div class="sign-in-page">
			<div class="signin-popup">
				<div class="signin-pop">
					<div class="row">
						<div class="col-lg-6">
							<div class="cmp-info">
                                                            <% 
                if(request.getAttribute("msg")!=null){
                 %>
                 
                 <h4 style="color: red"><%=request.getAttribute("msg")%></h4>
                   <% 
                }
                %>
								<div class="cm-logo">
									<img src="images/logo_wemeet3.png" alt="">
									<p>WeMeet, is a friend-meeting platform that is free and will remain so forever, find you old friends and chat with them.</p>
								</div><!--cm-logo end-->	
								<img src="images/cm-main-img.png" alt="">			
							</div><!--cmp-info end-->
						</div>
						<div class="col-lg-6">
							<div class="login-sec">
								<ul class="sign-control">
									<li data-tab="tab-1" class="current"><a href="#" title="">Login</a></li>				
									<li data-tab="tab-2"><a href="#" title="">sign up</a></li>				
								</ul>			
								<div class="sign_in_sec current" id="tab-1">
									
									<h3>Login</h3>
                                                                        <form action="/weMeet/Login" method="post">
										<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" name="login" placeholder="Username">
													<i class="la la-user"></i>
												</div><!--sn-field end-->
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="password" name="mdp" placeholder="Password">
													<i class="la la-lock"></i>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="checky-sec">
													<div class="fgt-sec">
														<input type="checkbox" name="cc" id="c1">
														<label for="c1">
															<span></span>
														</label>
														<small>Remember me</small>
													</div><!--fgt-sec end-->
													<a href="#" title="">Forgot Password?</a>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<button type="submit" value="submit">login </button>
											</div>
										</div>
									</form>
									
								</div><!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2">
									<div class="signup-tab">
										<i class="fa fa-long-arrow-left"></i>
										<h2>name@example.com</h2>
										
									</div><!--signup-tab end-->	
									<div class="dff-tab current" id="tab-3">
                                                                            <form  action="/weMeet/Inscrire" method="post">
											<div class="row">
                                                                                            <div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="email" placeholder="Email">
														<i class="la la-mail-forward"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="nom" placeholder="last name">
														<i class="la la-user"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="prenom" placeholder="first name">
														<i class="la la-user"></i>
													</div>
												</div>
                                                                                            
                                                                                            <% 
                                                                                            Session s=MyHibernateUtil.getSession();
                                                                                            List<Ville> l=s.createQuery("from Ville").list();
                                                                                            
                                                                                            
                                                                                            %>
                                                                                            
                                                                                            
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
                                                                                                            <select name="idv">
                                                                                                                <%
                                                                                                                    String nomp="";
                                                                                                                   for(Ville v :l){ 
                                                                                                               
                                                                                                                    if(!v.getPays().getNomp().equals(nomp)){
                                                                                                                        nomp=v.getPays().getNomp();
                                                                                                                        %>
                                                                                                                         <option value="-1"><%="---------"+nomp+"---------"%></option>
                                                                                                                        
                                                                                                                        <%
                                                                                                                    }
                                                                                                                 %>
                                                                                                                <option value="<%=v.getIdv()%>"><%=v.getNomv()%></option>
                                                                                                                <%}%>
														</select>
														<i class="la la-globe"></i>
														
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="mdp1" placeholder="Password">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="mdp2" placeholder="Repeat Password">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="checky-sec st2">
														<div class="fgt-sec">
															<input type="checkbox" name="cc" id="c2">
															<label for="c2">
																<span></span>
															</label>
															<small>Yes, I understand and accept all the terms and conditions</small>
														</div><!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="submit" value="submit">sign up</button>
												</div>
											</div>
										</form>
									</div><!--dff-tab end-->
									
								</div>		
							</div><!--login-sec end-->
						</div>
					</div>		
				</div><!--signin-pop end-->
			</div><!--signin-popup end-->
			
		</div><!--sign-in-page end-->


	</div><!--theme-layout end-->
         <jsp:include page="views/footer.jsp"></jsp:include>
    </body>

</html>
