/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import DAO.UserDAO;
import DTO.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd") ;
        LocalDate ld = LocalDate.parse( birthday , f ) ;
        
        User user = new User(0, fullname, password, 0, address, Date.valueOf(ld), phone, email, 1);
        try {
            UserDAO userDAO = new UserDAO();

            boolean check = userDAO.Register(user);
            if (check) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        

    }

}
