<%@ page import="java.io.*, javax.imageio.ImageIO, java.awt.image.BufferedImage" %>
<%@ page import="com.google.zxing.BarcodeFormat" %>
<%@ page import="com.google.zxing.WriterException" %>
<%@ page import="com.google.zxing.common.BitMatrix" %>
<%@ page import="com.google.zxing.qrcode.QRCodeWriter" %>
<%@ page import="java.util.Base64" %>

<%
    
    String feedbackUrl = "http://192.168.1.69:8080/FoodFeedbackSystem/feedback.jsp"; 

    int size = 250;
    String qrCodeBase64 = "";

    try {
        
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(feedbackUrl, BarcodeFormat.QR_CODE, size, size);

       
        BufferedImage image = new BufferedImage(size, size, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < size; x++) {
            for (int y = 0; y < size; y++) {
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF);
            }
        }

      
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", baos);
        byte[] imageBytes = baos.toByteArray();
        qrCodeBase64 = Base64.getEncoder().encodeToString(imageBytes);

    } catch (WriterException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>QR Code Generator</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light d-flex flex-column justify-content-center align-items-center" style="height:100vh;">

    <div class="card shadow-lg text-center" style="width: 22rem;">
        <div class="card-header bg-success text-white">
            <h5>Scan to Open Feedback Form</h5>
        </div>

        <div class="card-body">
            <p>Scan this QR code with your mobile camera to open the feedback form.</p>
            <img src="data:image/png;base64,<%= qrCodeBase64 %>" alt="QR Code" class="img-fluid rounded">
            <hr>
            <a href="<%= feedbackUrl %>" class="btn btn-outline-success w-100" target="_blank">
                Open Feedback Form
            </a>
        </div>
    </div>

</body>
</html>