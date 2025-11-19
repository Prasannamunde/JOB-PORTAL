package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {
    private Connection connection;

    public JobDAO() {
        this.connection = DBConnection.getConnection();
    }

    public boolean addJob(Job job) {
        String query = "INSERT INTO jobs (id, title, company, location, job_type, description) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, job.getId());
            stmt.setString(2, job.getTitle());
            stmt.setString(3, job.getCompany());
            stmt.setString(4, job.getLocation());
            stmt.setString(5, job.getJobType());
            stmt.setString(6, job.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateJob(Job job) {
        String query = "UPDATE jobs SET title = ?, company = ?, location = ?, job_type = ?, description = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, job.getTitle());
            stmt.setString(2, job.getCompany());
            stmt.setString(3, job.getLocation());
            stmt.setString(4, job.getJobType());
            stmt.setString(5, job.getDescription());
            stmt.setInt(6, job.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeJob(int id) {
        String query = "DELETE FROM jobs WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT * FROM jobs";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                jobs.add(new Job(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("company"),
                        rs.getString("location"),
                        rs.getString("job_type"),
                        rs.getString("description")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }

    public Job getJobById(int id) {
        String query = "SELECT * FROM jobs WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Job(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("company"),
                            rs.getString("location"),
                            rs.getString("job_type"),
                            rs.getString("description")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    

    public void close() {
        DBConnection.closeConnection();
    }
}
