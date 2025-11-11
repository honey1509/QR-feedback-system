<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            margin: 0;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgu8gYQ1FqtRFQSxhNr2cso0dPqSMSY-ABxA&s');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Glass Effect Card */
        .dashboard-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0px 5px 30px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.3);
        }

        .dashboard-title {
            font-size: 26px;
            font-weight: 600;
            color: #ffffff;
            text-shadow: 0px 0px 10px rgba(0,0,0,0.6);
        }

        .menu-btn {
            border-radius: 12px;
            font-size: 18px;
            transition: transform 0.2s ease-in-out;
        }

        .menu-btn:hover {
            transform: scale(1.06);
        }

    </style>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center" style="height:100vh;">

    <div class="dashboard-card text-center col-md-6">

        <h2 class="dashboard-title mb-4">Restaurant Admin Dashboard</h2>

        <div class="row">

            <div class="col-md-12 mb-3">
                <a href="generate_qr.jsp"
                   class="btn btn-primary menu-btn w-100 p-3 shadow">
                    Generate QR for feedback 
                </a>
            </div>

            <div class="col-md-12">
                <a href="ViewFeedbackServlet"
                   class="btn btn-success menu-btn w-100 p-3 shadow">
                    View Customer Feedback
                </a>
            </div>

        </div>

    </div>

</div>

</body>

</html>
