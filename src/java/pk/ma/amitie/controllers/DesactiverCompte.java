/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.ma.amitie.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import pk.ma.amitie.dao.MyHibernateUtil;
import pk.ma.amitie.models.Utilisateur;

/**
 *
 * @author IRADA
 */
@WebServlet(name = "DesactiverCompte", urlPatterns = {"/DesactiverCompte"})
public class DesactiverCompte extends HttpServlet {

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
            out.println("<title>Servlet DesactiverCompte</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DesactiverCompte at " + request.getContextPath() + "</h1>");
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
         
         
         String oldmdp=request.getParameter("password");
         String email=request.getParameter("email");
        
         if(oldmdp.equals(u.getMdp())&&email.equals(u.getEmail())){
             
              
                ses.beginTransaction();
                u.setEtatcpt(false);
                ses.saveOrUpdate(u);
                ses.getTransaction().commit();
                request.getSession().removeAttribute("user");
                request.setAttribute("msg","Your account has been deactivated!");
                request.getRequestDispatcher("/").forward(request, response);
             
         
         
         }else{
              request.setAttribute("msg","incorrect old password or email!");
                request.getRequestDispatcher("/views/profilesetting.jsp").forward(request, response);
              
              }
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