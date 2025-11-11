<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Food Feedback Form</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-success text-white text-center">
            <h4>Food Feedback</h4>
        </div>

        <div class="card-body">

            <form action="SubmitFeedbackServlet" method="post">

                <input type="hidden" name="foodItem" 
                       value="<%= request.getParameter("food") %>">

                <div class="mb-3">
                    <label class="form-label">Your Name</label>
                    <input type="text" name="name" required class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Your Email</label>
                    <input type="email" name="email" required class="form-control">
                </div>
                
                <div class="mb-3">
    <label class="form-label">choose the food item?</label>
    <select name="option" class="form-control" required>
        <option value="" disabled selected>Select fooditem</option>
        <option>Strater</option>
        <option>Biryani<option>
        <option>Mocktails</option>
        <option>Deserts</option>
        <option>Breakfast</option>
        <option>pizza</option>
        
    </select>
          </div>

                <div class="mb-3">
    <label class="form-label">How was the food quality?</label>
    <select name="option" class="form-control" required>
        <option value="" disabled selected>Select Rating</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
          </div>
                <div class="mb-3">
    <label class="form-label">How was service?</label>
    <select name="option" class="form-control" required>
        <option value="" disabled selected>Select Rating</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
          </div>
                <div class="mb-3">
                    <label class="form-label">Rate your overall experience</label>
                     <select name="option" class="form-control" required>
        <option value="" disabled selected>Select Rating</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
                    
                </div>
               

                <div class="mb-3">
                    <label class="form-label">Any Suggestions</label>
                    <textarea name="comments" rows="3" required class="form-control"></textarea>
                </div>

                <button class="btn btn-success w-100">Submit Feedback</button>

            </form>

        </div>

    </div>

</div>

</body>
</html>
