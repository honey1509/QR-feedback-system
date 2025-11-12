<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Feedback Form</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://gimgs2.nohat.cc/thumb/f/640/restaurant-menu-background--4558535413202944.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .feedback-box {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            width: 400px;
            border-radius: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        button {
            width: 100%;
            background-color: #e67e22;
            border: none;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>

    <div class="feedback-box">
        <h2>🍴 Restaurant Feedback Form</h2>
        
        <form action="viewfeedbackservlet" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="foodItem">Choose food item:</label>
            <select id="foodItem" name="foodItem" required>
                <option value="">-- Select an option --</option>
                <option value="Starters">Starters</option>
                <option value="Mocktails">Mocktails</option>
                <option value="Biryani">Biryani</option>
                <option value="Dessert">Dessert</option>
                <option value="Breakfast">Breakfast</option>
            </select>

            <label for="foodQuality">How was the food quality?</label>
            <select id="foodQuality" name="foodQuality" required>
                <option value="">-- Select an option --</option>
                <option value="5">Excellent</option>
                <option value="4">Good</option>
                <option value="3">Average</option>
                <option value="2">Poor</option>
            </select>

            <label for="serviceRating">How was the service?</label>
            <select id="serviceRating" name="serviceRating" required>
                <option value="">-- Select an option --</option>
                <option value="5">Excellent</option>
                <option value="4">Good</option>
                <option value="3">Average</option>
                <option value="2">Poor</option>
            </select>

            <label for="overallExperience">Rate your overall experience (1–5):</label>
            <select id="overallExperience" name="overallExperience" required>
                <option value="">-- Select an option --</option>
                <option value="5">5</option>
                <option value="4">4</option>
                <option value="3">3</option>
                <option value="2">2</option>
                <option value="1">1</option>
            </select>

            <label for="comments">Any suggestions?</label>
            <textarea id="comments" name="comments" rows="3" placeholder="Your feedback..."></textarea>

            <button type="submit">Submit Feedback</button>
        </form>
    </div>

</body>
</html>
