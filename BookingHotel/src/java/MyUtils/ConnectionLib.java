/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DINH
 */
public class ConnectionLib {
    
    public static Connection con;
    public static Connection getConnection() throws SQLException{
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/booking", "root", "");
        } catch (SQLException e) {
            e.getMessage();
        }
        return  con;
    }
  
}