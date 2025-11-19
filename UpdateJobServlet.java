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

@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String jobType = request.getParameter("job_type");
        String description = request.getParameter("description");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job2", "root", "pass123");

            // Update query
            String query = "UPDATE jobs SET title=?, company=?, location=?, job_type=?, description=? WHERE id=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setString(2, company);
            pstmt.setString(3, location);
            pstmt.setString(4, jobType);
            pstmt.setString(5, description);
            pstmt.setInt(6, id);

            pstmt.executeUpdate();

            // Redirect to the job list page
            response.sendRedirect(request.getContextPath() + "/list_jobs.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating job: " + e.getMessage());
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
