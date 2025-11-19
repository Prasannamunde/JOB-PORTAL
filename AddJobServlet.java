package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddJobServlet")
public class AddJobServlet extends HttpServlet {
    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        jobDAO = new JobDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String jobType = request.getParameter("jobType");
        String description = request.getParameter("description");

        // Validate input parameters
        if (idParam == null || idParam.isEmpty() || 
            title == null || title.isEmpty() ||
            company == null || company.isEmpty() ||
            location == null || location.isEmpty() ||
            jobType == null || jobType.isEmpty() ||
            description == null || description.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing required parameters.");
            return;
        }

        try {
            int id = Integer.parseInt(idParam); // Convert ID to integer
            Job job = new Job(id, title, company, location, jobType, description);

            if (jobDAO.addJob(job)) {
                response.getWriter().write("Job added successfully!");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to add job. Please try again.");
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid ID format. ID must be a number.");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        jobDAO.close();
    }
}
