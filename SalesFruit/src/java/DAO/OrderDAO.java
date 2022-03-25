/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Order;
import DTO.OrderDetail;
import DTO.Product;
import MyUtils.ConnectionLib;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {
    ConnectionLib cn = new ConnectionLib();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String query;
    private ArrayList<Order> list;
    public OrderDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        list = new ArrayList<>();
        con = cn.getConnectDB();
        st = con.createStatement();
    }
    public boolean InsertOrder(int userId, int total) {
        boolean status = false;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
        LocalDateTime now = LocalDateTime.now();  
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT [dbo].[tblOrder] ([orderDate], [total], [userID], [status]) VALUES (N'"+dtf.format(now)+"', "+total+", N'"+userId+"', 1)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean edit(Date date,int userId, int status1, double total, int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("UPDATE [dbo].[tblOrder] SET [orderDate] = '"+date+"',[total] = '"+total+"', [userID]= '"+userId+"', [status] = "+status1+" WHERE [orderID] = "+id);
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean InsertOrderItem(OrderDetail item, int orderId) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT [dbo].[tblOrderDetail] ([price], [quantity], [orderID], [productID]) VALUES (CAST("+item.getPrice()+" AS Decimal(18, 0)), "+item.getQuantity()+", "+orderId+", "+item.getProductID()+")");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public int getOrderID() {
        int Id = 0;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT MAX ([orderID]) as maxId  FROM [salefruit].[dbo].[tblOrder]");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Id = rs.getInt("maxId");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Id;
    }
    public ArrayList<Order> getAll(){
        list = new ArrayList<>();
        query = "SELECT [orderID]\n" +
                "      ,[orderDate]\n" +
                "      ,[total]\n" +
                "      ,[userID]\n" +
                "      ,[status]\n" +
                "  FROM [salefruit].[dbo].[tblOrder]\n"+
                "WHERE [status] = 1";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    
                   list.add(new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getInt(4), 1));
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return list;
    }
    public Order getOne(int id){
        Order order = new Order();
        query = "SELECT [orderID]\n" +
                "      ,[orderDate]\n" +
                "      ,[total]\n" +
                "      ,[userID]\n" +
                "      ,[status]\n" +
                "  FROM [salefruit].[dbo].[tblOrder]\n"+
                "WHERE [orderID] = "+id;
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    
                   order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getInt(4), 1);
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return order;
    }
    public boolean delete(int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("UPDATE [dbo].[tblOrder] SET [status] = 0 WHERE [orderID] ="+id);
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
