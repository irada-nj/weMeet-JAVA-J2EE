/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.ma.amitie.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import pk.ma.amitie.dao.MyHibernateUtil;
import pk.ma.amitie.models.Posts;
import pk.ma.amitie.models.Utilisateur;

/**
 *
 * @author IRADA
 */
@MultipartConfig
@WebServlet(name = "AddPostImageVideo", urlPatterns = {"/AddPostImageVideo"})
public class AddPostImageVideo extends HttpServlet {

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
            out.println("<title>Servlet AddPostImageVideo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostImageVideo at " + request.getContextPath() + "</h1>");
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
       String titre=request.getParameter("titre");
       String type=request.getParameter("type");
      Part p=request.getPart("file");
       Utilisateur u=(Utilisateur) request.getSession().getAttribute("user");
       Session s=MyHibernateUtil.getSession();
       
        String filename=p.getHeader("content-disposition");
            for(String ss:filename.split(";")){
                if(ss.trim().startsWith("filename")){
                    filename=ss.substring(ss.indexOf("=")+1).trim().replace("\"", "");
                    filename=filename.substring(filename.lastIndexOf('/')+1).substring(filename.lastIndexOf('\\')+1);
                }
            }
            
            
            if(type.equals("image")){
            p.write(getServletContext().getRealPath("/images/"+filename));
            }else{
             p.write(getServletContext().getRealPath("/videos/"+filename));
            }
       Posts ps=new Posts(0,u,titre,filename,new Date(),type,1L,0,0,null,null,null);
       s.beginTransaction();
       s.save(ps);
       s.getTransaction().commit();
       request.getSession().setAttribute("user", s.get(Utilisateur.class, u.getIdu()));
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
