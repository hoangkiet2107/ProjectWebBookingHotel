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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO {
    ConnectionLib cn = new ConnectionLib();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String query;
    private ArrayList<Category> list;
    public CategoryDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        list = new ArrayList<>();
        con = cn.getConnectDB();
        st = con.createStatement();
    }
    public ArrayList<Category> getAll(){
        list = new ArrayList<>();
        query = "SELECT [catagoryID]\n" +
                "      ,[catagoryName]\n" +
                "  FROM [salefruit].[dbo].[tblCategory]";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int catagoryID = rs.getInt("catagoryID");
                    String catagoryName = rs.getString("catagoryName");
                   list.add( new Category(catagoryID, catagoryName));

                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return list;
    }
}
