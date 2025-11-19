package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DatabaseUtils.java
public class DatabaseUtils {

 public static Connection getConnection() throws SQLException {
     String url = "jdbc:mysql://localhost:3306/Job2";
     String username = "root"; // Replace with your MySQL username
     String password = "pass123"; // Replace with your MySQL password
     return DriverManager.getConnection(url, username, password);
 }

 public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) {
     try {
         if (rs != null) rs.close();
         if (stmt != null) stmt.close();
         if (conn != null) conn.close();
     } catch (SQLException e) {
         e.printStackTrace();
     }
 }
}
