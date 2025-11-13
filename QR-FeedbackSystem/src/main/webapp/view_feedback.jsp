<%@ page import="packagep1.Feedback" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Feedback Reports</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #198754;
            margin-bottom: 30px;
        }

        table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 3px 15px rgba(0,0,0,0.2);
        }

        th {
            background-color: #198754;
            color: white;
        }

        td, th {
            text-align: center;
            padding: 10px;
        }

        .btn-back {
            background-color: #198754;
            color: white;
            border-radius: 6px;
            padding: 8px 20px;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #157347;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📋 Customer Feedback Reports</h2>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Food Item</th>
                <th>Food Quality</th>
                <th>Service Rating</th>
                <th>Overall Experience</th>
                <th>Comments</th>
                <th>Submitted At</th>
            </tr>
        </thead>

        <tbody>
            <%
           
            List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");

            if (feedbackList != null && !feedbackList.isEmpty()) {
                for (Feedback fb : feedbackList) {
        %>

        <tr>
            <td><%= fb.getId() %></td>
            <td><%= fb.getName() %></td>
            <td><%= fb.getEmail() %></td>
            <td><%= fb.getFoodItem() %></td>
            <td><%= fb.getFoodQuality() %></td>
            <td><%= fb.getServiceRating() %></td>
            <td><%= fb.getOverallExperience() %></td>
            <td><%= fb.getComments() %></td>
            <td><%= fb.getSubmittedAt() %></td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="9" class="text-center text-muted">No feedback records found.</td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="admin_home.jsp" class="btn-back">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
