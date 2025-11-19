package com.example;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
public class JobApplicationServlet extends HttpServlet {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Job2";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "pass123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        int experience = Integer.parseInt(request.getParameter("experience"));

        Part resumePart = request.getPart("resume");
        String fileName = resumePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        resumePart.write(filePath);

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO applications (fullName, email, phone, position, experience, resumePath) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, position);
            stmt.setInt(5, experience);
            stmt.setString(6, filePath);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                message = "Application submitted successfully!";
            } else {
                message = "Failed to submit application.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Database error: " + e.getMessage();
        }

        // Forward to JSP with message
        request.setAttribute("message", message);
        request.getRequestDispatcher("response.jsp").forward(request, response);
    }
}
