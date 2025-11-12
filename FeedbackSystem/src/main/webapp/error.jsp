<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light text-center mt-5">

<div class="container">
    <div class="alert alert-success shadow-lg p-4">
        <h3><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Thank You!" %></h3>
        <p>Your feedback has been submitted successfully.</p>
        <a href="../feedback_form.jsp" class="btn btn-outline-success mt-3">Submit Another Feedback</a>
    </div>
</div>

</body>
</html>