package com.example;

public class Job {
    private int id;
    private String title;
    private String company;
    private String location;
    private String jobType;
    private String description;

    public Job(int id, String title, String company, String location, String jobType, String description) {
        this.id = id;
        this.title = title;
        this.company = company;
        this.location = location;
        this.jobType = jobType;
        this.description = description;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getCompany() { return company; }
    public String getLocation() { return location; }
    public String getJobType() { return jobType; }
    public String getDescription() { return description; }
}
