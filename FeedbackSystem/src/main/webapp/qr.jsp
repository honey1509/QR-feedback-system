<%@ page import="com.google.zxing.BarcodeFormat" %>
<%@ page import="com.google.zxing.WriterException" %>
<%@ page import="com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%@ page import="com.google.zxing.common.BitMatrix" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback QR Code</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: lightpink;
            color: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .qr-card {
            background: grey;
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            padding: 40px 30px;
            text-align: center;
            width: 90%;
            max-width: 420px;
        }

        .qr-card h3 {
            color: #ffffff;
            font-weight: 600;
            margin-bottom: 25px;
        }

        img {
            border-radius: 15px;
            max-width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }

        img:hover {
            transform: scale(1.05);
        }

        .btn-custom {
            background-color: #ffffff;
            color: #2575fc;
            font-weight: 600;
            border-radius: 50px;
            padding: 10px 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }

        .btn-custom:hover {
            background-color: #2575fc;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.4);
        }

        @media (max-width: 576px) {
            .qr-card {
                padding: 30px 20px;
            }

            h3 {
                font-size: 1.2rem;
            }
        }
    </style>
</head>

<body>

<%
    String feedbackUrl = "https://glendora-monochromic-mineralogically.ngrok-free.dev"
                       + request.getContextPath() + "/feedback_form.jsp";

    String base64Image = null;

    try {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(feedbackUrl, BarcodeFormat.QR_CODE, 250, 250);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", baos);
        base64Image = Base64.getEncoder().encodeToString(baos.toByteArray());
    } catch (WriterException e) {
        e.printStackTrace();
    }
%>

<div class="qr-card mx-auto">
    <h3>Scan the QR Code or Click Below to Give Feedback</h3>

    <% if (base64Image != null) { %>
        <img src="data:image/png;base64,<%= base64Image %>" alt="Feedback QR Code" class="mb-4 shadow-lg"/>
        <br>
        <a href="feedback_form.jsp" class="btn btn-custom" target="_blank">
            Go to Feedback Form
        </a>
        <br>
        <br>
        <a href="index.jsp" class="btn btn-custom" target="_blank">
            Return to Home
        </a>
    <% } else { %>
        <div class="alert alert-danger mt-3">Error generating QR Code.</div>
    <% } %>
</div>

</body>
</html>
