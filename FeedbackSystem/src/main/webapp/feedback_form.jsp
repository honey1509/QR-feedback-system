<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Feedback Form</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-success text-white text-center">
            <h4>🍴 Food Feedback Form</h4>
        </div>

        <div class="card-body">

            <form action="SubmitFeedbackServlet" method="post">

                <!-- Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" required class="form-control" placeholder="Enter your name">
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" required class="form-control" placeholder="Enter your email">
                </div>

                <!-- Food Item -->
                <div class="mb-3">
                    <label class="form-label">Choose the food item</label>
                    <select name="fooditem" class="form-control" required>
                        <option value="" disabled selected>Select food item</option>
                        <option>Biryani</option>
                        <option>Mocktails</option>
                        <option>Starters</option>
                        <option>Dessert</option>
                        <option>Breakfast</option>
                        <option>Pizza</option>
                    </select>
                </div>

                <!-- Food Quality -->
                <div class="mb-3">
                    <label class="form-label">How was the food quality?</label>
                    <select name="foodquality" class="form-control" required>
                        <option value="" disabled selected>Select Rating</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>

                <!-- Service Rating -->
                <div class="mb-3">
                    <label class="form-label">How was the service?</label>
                    <select name="servicerating" class="form-control" required>
                        <option value="" disabled selected>Select Rating</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>

                <!-- Overall Experience -->
                <div class="mb-3">
                    <label class="form-label">Rate your overall experience</label>
                    <select name="overall" class="form-control" required>
                        <option value="" disabled selected>Select Rating</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>

                <!-- Comments -->
                <div class="mb-3">
                    <label class="form-label">Any Suggestions</label>
                    <textarea name="comments" rows="3" required class="form-control" placeholder="Your feedback..."></textarea>
                </div>

                <button class="btn btn-success w-100">Submit Feedback</button>

            </form>

        </div>
    </div>
</div>

</body>
</html>
