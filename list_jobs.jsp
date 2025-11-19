<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 20px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table thead {
            background-color: #007bff;
            color: white;
        }

        table th, table td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .message {
            text-align: center;
            margin-bottom: 20px;
            color: green;
            font-weight: bold;
        }

        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        .actions a {
            margin-right: 10px;
        }

        @media (max-width: 768px) {
            table th, table td {
                padding: 8px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <h1>Job List</h1>
    <div class="container">
        <% 
            // Display status message from session
            if (session != null && session.getAttribute("message") != null) {
        %>
            <p class="message"><%= session.getAttribute("message") %></p>
        <%
                session.removeAttribute("message"); // Clear the message after displaying
            }
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Company</th>
                    <th>Location</th>
                    <th>Job Type</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job2", "root", "pass123");
                        stmt = conn.createStatement();

                        String query = "SELECT * FROM jobs";
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String title = rs.getString("title");
                            String company = rs.getString("company");
                            String location = rs.getString("location");
                            String jobType = rs.getString("job_type");
                            String description = rs.getString("description");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= title %></td>
                    <td><%= company %></td>
                    <td><%= location %></td>
                    <td><%= jobType %></td>
                    <td><%= description %></td>
                    <td class="actions">
                        <a href="DeleteJobServlet?id=<%= id %>">Delete</a>
                        <a href="edit_job.jsp?id=<%= id %>">Edit</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
