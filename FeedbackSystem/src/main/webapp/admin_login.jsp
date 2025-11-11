<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <!-- BOOTSTRAP -->
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" 
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            margin: 0;
            background-image: url('https://m.media-amazon.com/images/I/71mlk+5TszL._AC_UF894,1000_QL80_.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            backdrop-filter: blur(3px);
        }

        /* Glassmorphism Card */
        .login-card {
            background: rgba(255, 255, 255, 0.12);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0px 0px 25px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.3);
        }

        .login-card input {
            background: rgba(255,255,255,0.8);
            border-radius: 8px;
        }

        .title-text {
            font-weight: 600;
            font-size: 22px;
        }
    </style>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center" style="height:100vh;">
    <div class="col-md-4">

        <div class="login-card text-white">
            <h3 class="text-center mb-4 title-text">Restaurant Admin Login</h3>

            <form action="AdminLoginServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" required class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" required class="form-control">
                </div>

                <button class="btn btn-light w-100 mt-2 fw-bold">Login</button>
                </form>
        </div>

    </div>
</div>

</body>
</html>
