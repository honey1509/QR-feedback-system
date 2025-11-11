<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Feedback Form</title>
    <style>
      
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://gimgs2.nohat.cc/thumb/f/640/restaurant-menu-background--4558535413202944.jpg');
            
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

      
        .rating {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin: 10px 0;
        }

        .star {
            width: 35px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .star:hover {
            transform: scale(1.2);
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

      
        .popup {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.6);
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background: #fff;
            padding: 25px 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .popup-content h3 {
            color: #27ae60;
            margin-bottom: 10px;
        }

        .popup-content button {
            background: #27ae60;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
        }

        .popup-content button:hover {
            background: #219150;
        }
    </style>
</head>
<body>

    <div class="feedback-box">
        <h2>🍴 Restaurant Feedback Form</h2>
        <form id="feedbackForm">
            <label for="name">Full Name:</label>
            <input type="text" id="name" placeholder="Enter your name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" placeholder="Enter your email" required>
            <label for="food">choose food item</label>
            <select id="food" required>
                <option value="">-- Select an option --</option>
                <option>Straters</option>
                <option>mocktails</option>
                <option>Biryani</option>
                <option>Desert</option>
                <option>Breakfast
                </option>
                
            </select>

            <label for="food">How was the food quality?</label>
            <select id="food" required>
                <option value="">-- Select an option --</option>
                <option>Excellent</option>
                <option>Good</option>
                <option>Average</option>
                <option>Poor</option>
            </select>

            <label for="service">How was the service?</label>
            <select id="service" required>
                <option value="">-- Select an option --</option>
                <option>Excellent</option>
                <option>Good</option>
                <option>Average</option>
                <option>Poor</option>
            </select>

            <label>Rate your overall experience:</label>
            <div class="rating" id="rating">
                <img src="https://cdn-icons-png.flaticon.com/512/616/616489.png" class="star" alt="star">
                <img src="https://cdn-icons-png.flaticon.com/512/616/616489.png" class="star" alt="star">
                <img src="https://cdn-icons-png.flaticon.com/512/616/616489.png" class="star" alt="star">
                <img src="https://cdn-icons-png.flaticon.com/512/616/616489.png" class="star" alt="star">
                <img src="https://cdn-icons-png.flaticon.com/512/616/616489.png" class="star" alt="star">
            </div>

            <label for="comments">Any suggestions?</label>
            <textarea id="comments" rows="3" placeholder="Your feedback..."></textarea>

            <button type="submit">Submit Feedback</button>
        </form>
    </div>

   
    <div class="popup" id="popup">
        <div class="popup-content">
            <h3>Thank You! 😊</h3>
            <p>Your feedback has been submitted successfully.</p>
            <button id="closePopup">OK</button>
        </div>
    </div>

    <script>
     
        const stars = document.querySelectorAll(".star");
        stars.forEach((star, index) => {
            star.addEventListener("click", () => {
                stars.forEach((s, i) => {
                    s.src = i <= index 
                        ? "https://cdn-icons-png.flaticon.com/512/1828/1828884.png" 
                        : "https://cdn-icons-png.flaticon.com/512/616/616489.png"
                });
            });
        });

        
        const form = document.getElementById("feedbackForm");
        const popup = document.getElementById("popup");
        const closePopup = document.getElementById("closePopup");

        form.addEventListener("submit", (e) => {
            e.preventDefault(); 
            popup.style.display = "flex";
        });

        closePopup.addEventListener("click", () => {
            popup.style.display = "none";
            form.reset();
            stars.forEach(s => s.src = "https://cdn-icons-png.flaticon.com/512/616/616489.png");
        });
    </script>
</body>

</html>