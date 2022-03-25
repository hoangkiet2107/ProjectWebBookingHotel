/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import DTO.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateNewProduct", urlPatterns = {"/UpdateNewProduct"})
public class Editproduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String category = request.getParameter("category");
        String importdate = request.getParameter("importdate");
        String usingdate = request.getParameter("usingdate");
        String id = request.getParameter("id");
        DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd") ;
        LocalDate ldImport = LocalDate.parse( importdate , f ) ;
        LocalDate ldUsing = LocalDate.parse( usingdate , f ) ;
        ProductDAO product = null;
            try {
                product = new ProductDAO();
            } catch (SQLException ex) {
                Logger.getLogger(AddNewProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
        Product pro = new Product(0, productName, image, Double.valueOf(price), Integer.valueOf(quantity), Integer.valueOf(category), Date.valueOf(ldImport), Date.valueOf(ldUsing), 1);
        boolean check = product.edit(pro, Integer.valueOf(id));
            if (check) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerProduct.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("addnewproduct.jsp");
                dispatcher.forward(request, response);
            }
    }

}
