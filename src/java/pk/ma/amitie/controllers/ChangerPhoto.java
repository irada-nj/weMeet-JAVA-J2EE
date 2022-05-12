/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.ma.amitie.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import pk.ma.amitie.dao.MyHibernateUtil;
import pk.ma.amitie.models.Utilisateur;

/**
 *
 * @author IRADA
 */
@MultipartConfig
@WebServlet(name = "ChangerPhoto", urlPatterns = {"/ChangerPhoto"})
public class ChangerPhoto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangerPhoto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangerPhoto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session ses=MyHibernateUtil.getSession();
         Utilisateur u=(Utilisateur) request.getSession().getAttribute("user");
         u=(Utilisateur) ses.get(Utilisateur.class, u.getIdu());
         Part pprof=request.getPart("imgprofile");
         Part pban=request.getPart("imgbanniere");
         
         if(pprof!=null){
         String imgprof=pprof.getHeader("content-disposition");
            for(String s:imgprof.split(";")){
                if(s.trim().startsWith("filename")){
                    imgprof=s.substring(s.indexOf("=")+1).trim().replace("\"", "");
                    imgprof=imgprof.substring(imgprof.lastIndexOf('/')+1).substring(imgprof.lastIndexOf('\\')+1);
                }
            }
            pprof.write(getServletContext().getRealPath("/images/"+imgprof));
            u.setProfilimg(imgprof);
         }
          if(pban!=null){
         String imgban=pban.getHeader("content-disposition");
            for(String s:imgban.split(";")){
                if(s.trim().startsWith("filename")){
                    imgban=s.substring(s.indexOf("=")+1).trim().replace("\"", "");
                    imgban=imgban.substring(imgban.lastIndexOf('/')+1).substring(imgban.lastIndexOf('\\')+1);
                }
            }   
         
            pban.write(getServletContext().getRealPath("/images/"+imgban));
            u.setBanniereimg(imgban);
          }
       ses.beginTransaction();
       ses.saveOrUpdate(u);
       ses.getTransaction().commit();
        request.getSession().setAttribute("user",u);
       request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
         
         
         
                 }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
