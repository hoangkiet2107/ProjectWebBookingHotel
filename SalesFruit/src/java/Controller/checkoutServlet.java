/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OrderDAO;
import DTO.OrderDetail;
import DTO.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "checkoutServlet", urlPatterns = {"/checkoutServlet"})
public class checkoutServlet extends HttpServlet {

    
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
        HttpSession session = request.getSession();
        if(session.getAttribute("cart") == null){
                request.setAttribute("check", "Please select item to buy");
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
            }else{
                OrderDAO obj = null;
                try {
                    obj = new OrderDAO();
                } catch (SQLException ex) {
                    Logger.getLogger(checkoutServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                User user = (User) session.getAttribute("user");

                ArrayList<OrderDetail> objCartBean = (ArrayList<OrderDetail>) session.getAttribute("cart");
                if(objCartBean.size() <=0){
                    request.setAttribute("check", "Please select item to buy");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                    dispatcher.forward(request, response);
                }else{
                    int total = 0;
                    for (int i = 0; i < objCartBean.size(); i++) {
                        total += (int) (objCartBean.get(i).getQuantity()*objCartBean.get(i).getPrice());
                    }
                    obj.InsertOrder(user.getUserID(), total);
                    for (int i = 0; i < objCartBean.size(); i++) {
                        obj.InsertOrderItem(objCartBean.get(i), obj.getOrderID());
                    }

                    request.setAttribute("check", "Thank you for your Order!!! See you later");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                    dispatcher.forward(request, response);
                }
                
            }
    }
}
