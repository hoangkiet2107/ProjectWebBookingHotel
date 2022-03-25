/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Category;
import DTO.Product;
import MyUtils.ConnectionLib;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {
    ConnectionLib cn = new ConnectionLib();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String query;
    private ArrayList<Product> list;
    public ProductDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        list = new ArrayList<>();
        con = cn.getConnectDB();
        st = con.createStatement();
    }
    public ArrayList<Product> getAll(){
        list = new ArrayList<>();
        query = "SELECT[productID]\n" +
                "      ,[productName]\n" +
                "      ,[image]\n" +
                "      ,[price]\n" +
                "      ,[quantity]\n" +
                "      ,[catagoryID]\n" +
                "      ,[importDate]\n" +
                "      ,[usingDate]\n" +
                "  FROM [salefruit].[dbo].[tblProduct] WHERE [status] = 1 ";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    
                   list.add(new Product(productID, productName, image, price, quantity, catagoryID, importDate, usingDate));
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return list;
    }
    public ArrayList<Product> getAllAdmin(){
        list = new ArrayList<>();
        query = "SELECT[productID]\n" +
                "      ,[productName]\n" +
                "      ,[image]\n" +
                "      ,[price]\n" +
                "      ,[quantity]\n" +
                "      ,[catagoryID]\n" +
                "      ,[importDate]\n" +
                "      ,[usingDate]\n" +
                "      ,[status]\n" +
                "  FROM [salefruit].[dbo].[tblProduct] WHERE [status] = 1 ";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    int status = rs.getInt("status");
                   list.add(new Product(productID, productName, image, price, quantity, catagoryID, importDate, usingDate,status));
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return list;
    }
    public ArrayList<Product> searchby(String name){
        list = new ArrayList<>();
        query = "SELECT TOP (1000) [productID]\n" +
                "      ,[productName]\n" +
                "      ,[image]\n" +
                "      ,[price]\n" +
                "      ,[quantity]\n" +
                "      ,[catagoryID]\n" +
                "      ,[importDate]\n" +
                "      ,[usingDate]\n" +
                "  FROM [salefruit].[dbo].[tblProduct]\n" +
                "  WHERE [productName] LIKE '%"+name+"%' AND [status] = 1";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    
                   list.add(new Product(productID, productName, image, price, quantity, catagoryID, importDate, usingDate));
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return list;
    }
    public Product getOne(int ID){
        Product product = new Product();
        query = "SELECT [productID]\n" +
                "      ,[productName]\n" +
                "      ,[image]\n" +
                "      ,[price]\n" +
                "      ,[quantity]\n" +
                "      ,[catagoryID]\n" +
                "      ,[importDate]\n" +
                "      ,[usingDate]\n" +
                "  FROM [salefruit].[dbo].[tblProduct]\n" +
                "  WHERE [productID] = '"+ID+"'";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    
                   product = new Product(productID, productName, image, price, quantity, catagoryID, importDate, usingDate);
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return product;
    }
    public boolean add(Product product) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("INSERT [dbo].[tblProduct] ([productName],[image], [price],[quantity],[catagoryID],[importDate],[usingDate], [status]) VALUES (N'"+product.getProductName()+"',N'"+product.getImage()+"', CAST("+product.getPrice()+" AS Decimal(18, 0)), "+product.getQuantity()+", "+product.getCategoryID()+", '"+product.getImportDate()+"', '"+product.getUsingDate()+"', 1)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean edit(Product product, int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("UPDATE [dbo].[tblProduct] SET [productName] = '"+product.getProductName()+"',[image] = '"+product.getImage()+"', [price]= '"+product.getPrice()+"', [quantity] = "+product.getQuantity()+", [catagoryID] = "+product.getCategoryID()+",[importDate]= '"+product.getImportDate()+"',[usingDate]= '"+product.getUsingDate()+"' WHERE productId = "+id+";");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean delete(int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("UPDATE [tblProduct] SET [status] = 0 WHERE [productID] ="+id);
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
