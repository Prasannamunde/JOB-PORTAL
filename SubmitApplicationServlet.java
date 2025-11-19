package com.example;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/SubmitApplicationServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class SubmitApplicationServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Job2";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "pass123";

    public static final String ACCOUNT_SID = "AC727bd0d2ec748b53a403b21c7dd43fd8";
    public static final String AUTH_TOKEN = "dcb2bd4987530036cad013c66554300e";
    public static final String FROM_PHONE = "+15179552164";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form fields
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        int experience = Integer.parseInt(request.getParameter("experience"));

        // Handle file upload
        Part filePart = request.getPart("resume");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Save application to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "INSERT INTO applications (fullName, email, phone, position, experience, resumePath) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, position);
            pstmt.setInt(5, experience);
            pstmt.setString(6, filePath);
            pstmt.executeUpdate();

            // Send SMS confirmation
            sendSMS(phone, fullName);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h2>Application submitted successfully!</h2>");
            out.println("<p>Thank you, " + fullName + "! A confirmation SMS has been sent to your phone.</p>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Error occurred: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void sendSMS(String toMobile, String userName) {
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

            // Ensure the phone number is in E.164 format
            if (!toMobile.startsWith("+")) {
                toMobile = "+91" + toMobile; // Assuming all numbers are from India (country code +91)
            }

            Message message = Message.creator(
                    new PhoneNumber(toMobile),
                    new PhoneNumber(FROM_PHONE),
                    "Dear " + userName + ",\n\nThank you for submitting your job application.\n\nBest regards,\nRecruitment Team"
            ).create();

            System.out.println("SMS sent successfully to " + toMobile);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
