<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate QR Code - Food Item</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
            <h4>Generate QR for feedback</h4>
        </div>

        <div class="card-body">

            <form action="GenerateQRServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Food Name</label>
                    <input type="text" name="foodName" class="form-control" required>
                </div>

                <button class="btn btn-primary w-100">Generate QR Code</button>

            </form>

        </div>

    </div>

</div>

</body>
</html>
