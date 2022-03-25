/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import DTO.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trant
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpServletRequest reg = (HttpServletRequest) request;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.login(email, password);
            if(user == null){
                RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
                dispatcher.forward(request, response);
            }else if (user.getRoleID() == 2) {
                session.setAttribute("user", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
                dispatcher.forward(request, response);
            } else if(user.getRoleID() == 1) {
                session.setAttribute("user", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerProduct.jsp");
                dispatcher.forward(request, response);
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        

    }
}
