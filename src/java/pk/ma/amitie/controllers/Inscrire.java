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
import pk.ma.amitie.models.Utilisateur;
import pk.ma.amitie.models.Ville;

/**
 *
 * @author IRADA
 */
@WebServlet(name = "Inscrire", urlPatterns = {"/Inscrire"})
public class Inscrire extends HttpServlet {

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
            out.println("<title>Servlet Inscrire</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Inscrire at " + request.getContextPath() + "</h1>");
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
        String email =request.getParameter("email");
        String nom =request.getParameter("nom");
        String prenom =request.getParameter("prenom");
        String mdp1 =request.getParameter("mdp1");
        String mdp2 =request.getParameter("mdp2");
        String cc =request.getParameter("cc");
        int idv=Integer.parseInt(request.getParameter("idv"));
        if(cc==null){
            request.setAttribute("msg","you must accept all terms and conditions.");
            request.getRequestDispatcher("/").forward(request, response);
        }else if(!mdp1.equals(mdp2)){
            request.setAttribute("msg","The two passwords do not match ");
            request.getRequestDispatcher("/").forward(request, response);
        }else{
            Utilisateur u=new Utilisateur();
            u.setNom(nom);
            u.setPrenom(prenom);
            u.setEmail(email);
            u.setMdp(mdp2);
            u.setProfilimg("avatar.png");
            u.setEtatcpt(true);
            
            Session s=MyHibernateUtil.getSession();
            Ville v=(Ville) s.get(Ville.class,idv);
            u.setVille(v);
            u.setRole("user");
            u.setRegdate(new Date());
            s.beginTransaction();
            s.save(u);
            s.getTransaction().commit();
            
            request.setAttribute("msg","You have successfully registered. you can log in now !! ");
            request.getRequestDispatcher("/").forward(request, response);
            
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
