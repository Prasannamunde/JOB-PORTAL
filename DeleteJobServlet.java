package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job2", "root", "pass123");

            // Delete query
            String query = "DELETE FROM jobs WHERE id=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();

            // Use session to set a status message
            HttpSession session = request.getSession();
            if (rowsAffected > 0) {
                session.setAttribute("message", "Job deleted successfully!");
            } else {
                session.setAttribute("message", "Job not found or already deleted.");
            }

            // Redirect to job list page
            response.sendRedirect(request.getContextPath() + "/list_jobs.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting job: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
