<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Job" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Listings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-title {
            color: #343a40;
            font-weight: bold;
        }

        .card-subtitle {
            color: #6c757d;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .no-jobs {
            text-align: center;
            color: #6c757d;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Job Listings</h1>
        <div class="row">
            <%
                List<Job> jobs = (List<Job>) request.getAttribute("jobs");
                if (jobs != null && !jobs.isEmpty()) {
                    for (Job job : jobs) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= job.getTitle() %></h5>
                        <h6 class="card-subtitle mb-2 text-muted"><%= job.getCompany() %></h6>
                        <p class="card-text">
                            <strong>Location:</strong> <%= job.getLocation() %><br>
                            <strong>Type:</strong> <%= job.getJobType() %><br>
                            <%= job.getDescription() %>
                        </p>
                        <a href="apply.jsp" class="btn btn-primary">Apply Now</a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12">
                <p class="no-jobs">No jobs available.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
