<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Job</title>
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
            max-width: 600px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"], textarea, input[type="hidden"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        button {
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            button {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h1>Edit Job</h1>
    <div class="container">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String title = "", company = "", location = "", jobType = "", description = "";

            Connection conn = null;
            Statement stmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Job2", "root", "pass123");
                stmt = conn.createStatement();

                String query = "SELECT * FROM jobs WHERE id=" + id;
                ResultSet rs = stmt.executeQuery(query);

                if (rs.next()) {
                    title = rs.getString("title");
                    company = rs.getString("company");
                    location = rs.getString("location");
                    jobType = rs.getString("job_type");
                    description = rs.getString("description");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        <form action="UpdateJobServlet" method="post">
            <input type="hidden" name="id" value="<%= id %>" />
            
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%= title %>" required />
            
            <label for="company">Company:</label>
            <input type="text" id="company" name="company" value="<%= company %>" required />
            
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="<%= location %>" required />
            
            <label for="job_type">Job Type:</label>
            <input type="text" id="job_type" name="job_type" value="<%= jobType %>" required />
            
            <label for="description">Description:</label>
            <textarea id="description" name="description" required><%= description %></textarea>
            
            <button type="submit">Update Job</button>
        </form>
    </div>
</body>
</html>
