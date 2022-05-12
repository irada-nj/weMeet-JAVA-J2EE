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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import pk.ma.amitie.dao.MyHibernateUtil;
import pk.ma.amitie.models.Amis;
import pk.ma.amitie.models.Invitation;
import pk.ma.amitie.models.Utilisateur;

/**
 *
 * @author IRADA
 */
@WebServlet(name = "Inviter", urlPatterns = {"/Inviter"})
public class Inviter extends HttpServlet {

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
            out.println("<title>Servlet Inviter</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Inviter at " + request.getContextPath() + "</h1>");
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
        int idinv=Integer.parseInt(request.getParameter("idinv"));
       
        Session s=MyHibernateUtil.getSession();
        
        Invitation i=(Invitation) s.get(Invitation.class, idinv);
        String action=request.getParameter("action");
        i.setStatus(action);
        i.setDateacceptation(new Date());
        
        s.beginTransaction();
        s.saveOrUpdate(i);
        if(action.equals("accepte")){
         Utilisateur u=(Utilisateur) request.getSession().getAttribute("user");
         Amis a=new Amis(0,u,i.getUtilisateurByIdu(),new Date());
         s.save(a);
         
        }
        
        s.getTransaction().commit();
        //request.getSession().setAttribute(user);
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
        
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
        int idu=Integer.parseInt(request.getParameter("idu"));
        Utilisateur u=(Utilisateur) request.getSession().getAttribute("user");
        Session s=MyHibernateUtil.getSession();
        Utilisateur uinv=(Utilisateur) s.get(Utilisateur.class,idu);
        Invitation i=new Invitation(0,uinv,u,new Date(),null,"en cours");
        s.beginTransaction();
        s.save(i);
        s.getTransaction().commit();
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
