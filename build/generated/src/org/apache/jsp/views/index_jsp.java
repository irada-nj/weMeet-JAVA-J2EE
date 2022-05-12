package org.apache.jsp.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import pk.ma.amitie.models.Ville;
import org.hibernate.Session;
import pk.ma.amitie.dao.MyHibernateUtil;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("    <body class=\"sign-in\">\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t<div class=\"wrapper\">\n");
      out.write("\t\t\n");
      out.write("                 \n");
      out.write("\t\t<div class=\"sign-in-page\">\n");
      out.write("\t\t\t<div class=\"signin-popup\">\n");
      out.write("\t\t\t\t<div class=\"signin-pop\">\n");
      out.write("\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-6\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"cmp-info\">\n");
      out.write("                                                            ");
 
                if(request.getAttribute("msg")!=null){
                 
      out.write("\n");
      out.write("                 \n");
      out.write("                 <h4 style=\"color: red\">");
      out.print(request.getAttribute("msg"));
      out.write("</h4>\n");
      out.write("                   ");
 
                }
                
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"cm-logo\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"images/cm-logo.png\" alt=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<p>WeMeet, is a friend-meeting platform that is free and will remain so forever, find you old friends and chat with them.</p>\n");
      out.write("\t\t\t\t\t\t\t\t</div><!--cm-logo end-->\t\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"images/cm-main-img.png\" alt=\"\">\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</div><!--cmp-info end-->\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-6\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"login-sec\">\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"sign-control\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<li data-tab=\"tab-1\" class=\"current\"><a href=\"#\" title=\"\">Login</a></li>\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t<li data-tab=\"tab-2\"><a href=\"#\" title=\"\">Sign up</a></li>\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"sign_in_sec current\" id=\"tab-1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t<h3>Login</h3>\n");
      out.write("                                                                        <form action=\"/weMeet/Login\" method=\"post\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"login\" placeholder=\"Username\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-user\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div><!--sn-field end-->\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"password\" name=\"mdp\" placeholder=\"Password\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-lock\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"checky-sec\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"fgt-sec\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"cc\" id=\"c1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<label for=\"c1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<small>Remember me</small>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div><!--fgt-sec end-->\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\" title=\"\">Forgot Password?</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<button type=\"submit\" value=\"submit\">login </button>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t</div><!--sign_in_sec end-->\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"sign_in_sec\" id=\"tab-2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"signup-tab\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-long-arrow-left\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<h2>name@example.com</h2>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t</div><!--signup-tab end-->\t\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"dff-tab current\" id=\"tab-3\">\n");
      out.write("                                                                            <form  action=\"/weMeet/Inscrire\" method=\"post\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"row\">\n");
      out.write("                                                                                            <div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"email\" placeholder=\"Email\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-mail-forward\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"nom\" placeholder=\"last name\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-user\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"prenom\" placeholder=\"first name\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-user\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("                                                                                            \n");
      out.write("                                                                                            ");
 
                                                                                            Session s=MyHibernateUtil.getSession();
                                                                                            List<Ville> l=s.createQuery("from Ville").list();
                                                                                            
                                                                                            
                                                                                            
      out.write("\n");
      out.write("                                                                                            \n");
      out.write("                                                                                            \n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("                                                                                                            <select name=\"idv\">\n");
      out.write("                                                                                                                ");

                                                                                                                    String nomp="";
                                                                                                                   for(Ville v :l){ 
                                                                                                               
                                                                                                                    if(!v.getPays().getNomp().equals(nomp)){
                                                                                                                        nomp=v.getPays().getNomp();
                                                                                                                        
      out.write("\n");
      out.write("                                                                                                                         <option value=\"-1\">");
      out.print("---------"+nomp+"---------");
      out.write("</option>\n");
      out.write("                                                                                                                        \n");
      out.write("                                                                                                                        ");

                                                                                                                    }
                                                                                                                 
      out.write("\n");
      out.write("                                                                                                                <option value=\"");
      out.print(v.getIdv());
      out.write('"');
      out.write('>');
      out.print(v.getNomv());
      out.write("</option>\n");
      out.write("                                                                                                                ");
}
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-globe\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"password\" name=\"mdp1\" placeholder=\"Password\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-lock\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"sn-field\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"password\" name=\"mpd2\" placeholder=\"Repeat Password\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class=\"la la-lock\"></i>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"checky-sec st2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"fgt-sec\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"cc\" id=\"c2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<label for=\"c2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<small>Yes, I understand and accept all the terms and conditions</small>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t</div><!--fgt-sec end-->\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-lg-12 no-pdd\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<button type=\"submit\" value=\"submit\">sign up</button>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div><!--dff-tab end-->\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t</div>\t\t\n");
      out.write("\t\t\t\t\t\t\t</div><!--login-sec end-->\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\t\t\n");
      out.write("\t\t\t\t</div><!--signin-pop end-->\n");
      out.write("\t\t\t</div><!--signin-popup end-->\n");
      out.write("\t\t\t\n");
      out.write("\t\t</div><!--sign-in-page end-->\n");
      out.write("\n");
      out.write("\n");
      out.write("\t</div><!--theme-layout end-->\n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
