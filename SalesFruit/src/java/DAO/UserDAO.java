/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Product;
import DTO.User;
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
public class UserDAO {
    ConnectionLib cn = new ConnectionLib();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String query;
    public UserDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        con = cn.getConnectDB();
        st = con.createStatement();
    }
    public User login(String email, String password){
        User user = null;
        query = "SELECT TOP (1000) [userID]\n" +
                "      ,[fullname]\n" +
                "      ,[password]\n" +
                "      ,[roleID]\n" +
                "      ,[address]\n" +
                "      ,[birthday]\n" +
                "      ,[phone]\n" +
                "      ,[email]\n" +
                "      ,[status]\n" +
                "  FROM [salefruit].[dbo].[tblUsers]\n" +
                "  WHERE [email] = '"+email+"' AND [password] = "+password;
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int userID = rs.getInt("userID");
                    String fullname = rs.getString("fullname");
                    String passwordUser = rs.getString("password");
                    int roleID = rs.getInt("roleID");
                    Date birthday = rs.getDate("birthday");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    user = new User(userID, fullname, passwordUser, roleID, address, birthday, phone, email, status);
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return user;
    }
    public boolean Register(User user) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("INSERT [dbo].[tblUsers] ([fullname],[password] ,[roleID],[address],[birthday],[phone],[email],[status]) VALUES (N'"+user.getFullname()+"', N'"+user.getPassword()+"', 2, N'"+user.getAddress()+"','"+user.getBirthday()+"', N'"+user.getPhone()+"', N'"+user.getEmail()+"',1)");
             ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}