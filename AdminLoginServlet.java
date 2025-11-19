package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminLoginServlet extends HttpServlet {
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Job2";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "pass123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // JDBC connection variables
        String jdbcURL = "jdbc:mysql://localhost:3306/Job2";
        String dbUser = "root";
        String dbPassword = "pass123";

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Query to check user credentials
            String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Execute query
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Valid user - Create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirect to welcome page
                response.sendRedirect("welcome.jsp");
            } else {
                // Invalid credentials
                PrintWriter out = response.getWriter();
                out.println("<html><body><h3>Invalid username or password.</h3>");
                out.println("<a href='index.jsp'>Go Back</a></body></html>");
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            // Log the error details
            e.printStackTrace();  // Print the error stack trace to the server logs
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your login.");
        }
}
}
