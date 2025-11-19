# Job Portal Web Application

A complete **Job Portal Web Application** built using **Java Servlets, JSP, and JDBC**.  
It allows admins to create, update, delete job postings and users to browse and apply for jobs.  
The project follows the MVC pattern and uses JDBC for database connectivity.

---

## 🚀 Features

### 👨‍💼 Admin Features
- Admin Login
- Add new Job postings
- Update existing Job details
- Delete Job postings
- View all Jobs

### 👨‍🎓 User Features
- User Login
- View available Jobs
- Apply for a Job
- Submit application form

---

## 🛠️ Technologies Used
- **Java (Servlets & JSP)**
- **Tomcat Server**
- **JDBC / MySQL**
- **HTML, CSS, JSP**
- **Eclipse IDE (Project Structure suggests Eclipse)**

---

## 📁 Project Structure
Demo/
├── src/main/java/com/example/
│ ├── AddJobServlet.java
│ ├── AdminLoginServlet.java
│ ├── JobApplicationServlet.java
│ ├── SubmitApplicationServlet.java
│ ├── UpdateJobServlet.java
│ ├── DeleteJobServlet.java
│ ├── ViewJobsServlet.java
│ ├── LoginServlet.java
│ ├── JobDAO.java
│ ├── Job.java
│ ├── DatabaseUtils.java
│ └── DBConnection.java
│
├── src/main/webapp/
│ ├── addJob.jsp
│ ├── AdminLogin.jsp
│ ├── viewJobs.jsp
│ ├── applyJob.jsp
│ ├── index.jsp
│ └── success.jsp
│
├── build/ (compiled classes)
├── .classpath
└── .project


---

## ⚙️ Setup Instructions

### **1️⃣ Import the Project**
- Open **Eclipse**
- File → Import → *Existing Projects into Workspace*
- Select the extracted `Demo/` folder

---

### **2️⃣ Configure Server**
- Install and configure **Apache Tomcat 9/10**
- Add the project to Tomcat server

---

### **3️⃣ Database Setup**
Create a MySQL database:

```sql
CREATE DATABASE job_portal;


Create required tables (example):

CREATE TABLE jobs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  description TEXT,
  location VARCHAR(255),
  salary VARCHAR(100)
);


Update database credentials in:

src/main/java/com/example/DBConnection.java

4️⃣ Run the Application

Start Tomcat

Open browser:

http://localhost:8080/Demo

🧩 MVC Flow Explanation
Controller (Servlets)

Handles:

Job CRUD operations

User login

Form submissions

Model (DAO & Java Classes)

JobDAO.java — interacts with DB

Job.java — job entity model

View (JSP)

Admin UI pages

Job listing pages

Application forms

📦 Build & Deployment

To deploy the project:

Export as WAR file in Eclipse

Deploy to Tomcat webapps folder

👨‍💻 Author

Project developed by Prasanna Munde
