
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Navbar Example</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"  href="CSS/Main.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand text-danger" href="#">JOB PORTAL</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="jobsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Jobs
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="jobsDropdown">
                            <li><a class="dropdown-item" href="#">Job 1</a></li>
                            <li><a class="dropdown-item" href="#">Job 2</a></li>
                            <li><a class="dropdown-item" href="#">Job 3</a></li>
                        </ul>
                    </li>
                </ul>

                <form class="d-flex mx-3">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                </form>

                <!-- Dynamic Login/Welcome -->
                <ul class="navbar-nav">
                    
                    <li class="nav-item dropdown">
                        <a class="btn btn-outline-primary dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Login
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="loginDropdown">
                            <li><a class="dropdown-item" href="index.jsp">Login as User</a></li>
                            <li><a class="dropdown-item" href="AdminLogin.jsp">Login as Admin</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>



    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-text text-danger">
            <h1>INDIA’S #1 JOB PLATFORM</h1>
            <p>Your job search ends here</p>
            <p>Discover 50 lakh+ career opportunities</p>
        </div>
    </div>
    
    
    <!-- Main Section -->
    <div class="container my-5">
        <h2 class="section-header text-center my-4 text-dark">IT Job Openings in Top Companies</h2>

        <div class="row g-4">
            <!-- Card 1 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Software Engineer</h5>
                        <p class="card-text">XYZ Tech Ltd. - Full-time</p>
                        <p class="location">Location: Bangalore, India</p>
                        <a href="apply.jsp" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Data Analyst</h5>
                        <p class="card-text">ABC Corp. - Full-time</p>
                        <p class="location">Location: Mumbai, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">UI/UX Designer</h5>
                        <p class="card-text">DesignPro Inc. - Full-time</p>
                        <p class="location">Location: Hyderabad, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Product Manager</h5>
                        <p class="card-text">TechStar Solutions - Full-time</p>
                        <p class="location">Location: Pune, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 5 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Marketing Specialist</h5>
                        <p class="card-text">MarketGuru Ltd. - Part-time</p>
                        <p class="location">Location: Chennai, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 6 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">HR Manager</h5>
                        <p class="card-text">PeopleFirst Inc. - Full-time</p>
                        <p class="location">Location: Gurgaon, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 7 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Backend Developer</h5>
                        <p class="card-text">TechSystems Ltd. - Full-time</p>
                        <p class="location">Location: Noida, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a> 
                    </div>
                </div>
            </div>

            <!-- Card 8 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sales Executive</h5>
                        <p class="card-text">SalesPro Inc. - Full-time</p>
                        <p class="location">Location: Delhi, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 9 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Web Developer</h5>
                        <p class="card-text">WebTech Co. - Full-time</p>
                        <p class="location">Location: Bangalore, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- Card 10 -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Project Manager</h5>
                        <p class="card-text">ProManage Solutions - Full-time</p>
                        <p class="location">Location: Chennai, India</p>
                        <a href="#" class="btn btn-primary apply-btn">Apply Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
	
	
	
	<div class="container">
        <div class="reviews-section">
            <!-- Centered Text Section -->
            <div class="text-info">
                Join the community of 5 crore satisfied job seekers who have found their dream jobs through our platform!
            </div>

            <!-- Scrollable Reviews Section -->
            <div class="reviews-container-wrapper">
                <div class="reviews-container">
                    <!-- Review 1 -->
                    <div class="review-card">
                        <h5 class="review-title">John Doe</h5>
                        <p class="review-text">"This platform helped me find my perfect job within weeks! Highly recommend it! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus hendrerit."</p>
                        <p class="reviewer">Software Engineer</p>
                    </div>

                    <!-- Review 2 -->
                    <div class="review-card">
                        <h5 class="review-title">Jane Smith</h5>
                        <p class="review-text">"Amazing experience! The job recommendations were spot on for my skill set. The interview tips were helpful too!"</p>
                        <p class="reviewer">Data Analyst</p>
                    </div>

                    <!-- Review 3 -->
                    <div class="review-card">
                        <h5 class="review-title">Alice Johnson</h5>
                        <p class="review-text">"Thanks to this site, I secured a great job in a leading company! The platform's interface is very user-friendly and easy to navigate."</p>
                        <p class="reviewer">UX Designer</p>
                    </div>

                    <!-- Review 4 -->
                    <div class="review-card">
                        <h5 class="review-title">Robert Brown</h5>
                        <p class="review-text">"The job application process was so easy and efficient. Love the platform!"</p>
                        <p class="reviewer">Marketing Specialist</p>
                    </div>

                    <!-- Review 5 -->
                    <div class="review-card">
                        <h5 class="review-title">Emily Clark</h5>
                        <p class="review-text">"Great platform for job seekers. The resources helped me get prepared for interviews!"</p>
                        <p class="reviewer">Project Manager</p>
                    </div>

                    <!-- Review 6 -->
                    <div class="review-card">
                        <h5 class="review-title">Chris Martin</h5>
                        <p class="review-text">"The platform is very user-friendly and helped me land a job quickly. Highly recommended!"</p>
                        <p class="reviewer">Backend Developer</p>
                    </div>

                    <!-- Review 7 -->
                    <div class="review-card">
                        <h5 class="review-title">Sophia Lee</h5>
                        <p class="review-text">"Excellent platform for job hunting. Great features and helpful insights throughout the process!"</p>
                        <p class="reviewer">HR Manager</p>
                    </div>

                    <!-- Review 8 -->
                    <div class="review-card">
                        <h5 class="review-title">Michael Brown</h5>
                        <p class="review-text">"Found the perfect match for my skills and background. Great job portal!"</p>
                        <p class="reviewer">Web Developer</p>
                    </div>

                    <!-- Review 9 -->
                    <div class="review-card">
                        <h5 class="review-title">Olivia Harris</h5>
                        <p class="review-text">"The job search experience was seamless, and I secured a job with a great company!"</p>
                        <p class="reviewer">Marketing Specialist</p>
                    </div>

                    <!-- Review 10 -->
                    <div class="review-card">
                        <h5 class="review-title">James Wilson</h5>
                        <p class="review-text">"Great platform for both freshers and experienced professionals. The process is fast and effective!"</p>
                        <p class="reviewer">Software Developer</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Footer Section -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <!-- Footer Column 1: Quick Links -->
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <div class="quick-links">
                        <a href="#">Home</a>
                        <a href="#">About Us</a>
                        <a href="#">Services</a>
                        <a href="#">Contact</a>
                        <a href="#">Blog</a>
                    </div>
                </div>

                <!-- Footer Column 2: Social Media Icons -->
                <div class="col-md-3">
                    <h5>Follow Us</h5>
                    <div class="social-icons">
                        <a href="#" class="social-icon"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>

                <!-- Footer Column 3: Contact Information -->
                <div class="col-md-3">
                    <h5>Contact Info</h5>
                    <p><i class="fas fa-phone-alt"></i> +1 800-123-4567</p>
                    <p><i class="fas fa-envelope"></i> info@company.com</p>
                    <p><i class="fas fa-map-marker-alt"></i> 1234 Street Name, City, Country</p>
                </div>

                <!-- Footer Column 4: Newsletter Signup -->
                <div class="col-md-3">
                    <h5>Subscribe</h5>
                    <form>
                        <input type="email" class="form-control" placeholder="Enter your email" required>
                        <button type="submit" class="btn btn-primary mt-3 w-100">Subscribe</button>
                    </form>
                </div>
            </div>

            <!-- Copy Right Section -->
            <div class="copy-right">
                <p>&copy; 2025 Company Name. All Rights Reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a></p>
            </div>
        </div>
    </div>
	
	
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
