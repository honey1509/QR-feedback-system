<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Overall Rating Chart</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .chart-container {
            width: 50%;         
            max-width: 500px;  
            margin: 0 auto;     
        }

        canvas {
            width: 100% !important;
            height: auto !important;
        }
    </style>
</head>

<body>

<div class="container mt-5 text-center">
    <h2 class="text-success mb-4"> Restaurant Overall Rating Chart</h2>

    <div class="card shadow p-4">
        <div class="chart-container">
            <canvas id="ratingPieChart"></canvas>
        </div>
    </div>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" 
           class="btn btn-success px-4 py-2 shadow-sm">
            
        </a>
    </div>
</div>

    <a href="admin_home.jsp" class="btn btn-secondary mt-3">⬅ Back to Dashboard</a>
</div>

<%
    Map<Integer, Integer> ratingCounts = (Map<Integer, Integer>) request.getAttribute("ratingCounts");
    String ratings = "";
    String counts = "";

    if (ratingCounts != null) {
        for (Map.Entry<Integer, Integer> entry : ratingCounts.entrySet()) {
            ratings += "'" + entry.getKey() + "★',";
            counts += entry.getValue() + ",";
        }
    }
%>

<script>
    const ctx = document.getElementById('ratingPieChart');
    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [<%= ratings %>],
            datasets: [{
                data: [<%= counts %>],
                backgroundColor: [
                    '#2ecc71', '#f1c40f', '#e67e22', '#e74c3c', '#3498db'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: { position: 'bottom' },
                title: {
                    display: true,
                    text: 'Overall Experience Rating Distribution',
                    font: { size: 16 }
                }
            }
        }
    });
</script>

</body>
</html>
