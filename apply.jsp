<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="form-container">
                    <h2 class="text-center mb-4">Job Application Form</h2>
                    <form action="SubmitApplicationServlet" method="POST" enctype="multipart/form-data">
                        <!-- Personal Information -->
                        <h5 class="mb-3">Personal Information</h5>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group mb-3">
                <label for="phone">Mobile Number:</label>
                <input type="tel" id="mobile" name="phone" class="form-control" 
                       pattern="\+[0-9]{10,15}" 
                       placeholder="+919876543210" 
                       required 
                       data-toggle="tooltip" 
                       title="Enter your number in the format: +[CountryCode][Number].">
                <small class="form-text text-muted">
                    Enter your number in international format (e.g., +919876543210).
                </small>
            </div>
                        
                        <!-- Job Information -->
                        <h5 class="mb-3">Job Information</h5>
                        <div class="mb-3">
                            <label for="position" class="form-label">Position Applying For</label>
                            <input type="text" class="form-control" id="position" name="position" required>
                        </div>
                        <div class="mb-3">
                            <label for="experience" class="form-label">Years of Experience</label>
                            <input type="number" class="form-control" id="experience" name="experience" min="0" required>
                        </div>
                        
                        <!-- Resume Upload -->
                        <h5 class="mb-3">Upload Resume</h5>
                        <div class="mb-3">
                            <label for="resume" class="form-label">Resume (PDF/DOC)</label>
                            <input type="file" class="form-control" id="resume" name="resume" accept=".pdf,.doc,.docx" required>
                        </div>
                        
                        <!-- Submit -->
                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-primary btn-lg">Submit Application</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Resume file validation
        document.querySelector('#resume').addEventListener('change', function () {
            const file = this.files[0];
            if (file && file.size > 10 * 1024 * 1024) {
                alert('File size must be less than 10MB!');
                this.value = '';
            } else if (file && !['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'].includes(file.type)) {
                alert('Only PDF, DOC, or DOCX files are allowed!');
                this.value = '';
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
