package packagep1;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/qrcodeservlet")
public class QRCodeServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

   
        String feedbackUrl = "https://glendora-monochromic-mineralogically.ngrok-free.dev" 
                           + request.getContextPath() + "/feedback_form.jsp";

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        try {
            BitMatrix bitMatrix = qrCodeWriter.encode(feedbackUrl, BarcodeFormat.QR_CODE, 250, 250);
            response.setContentType("image/png");
            OutputStream out = response.getOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", out);
            out.close();
        } catch (WriterException e) {
            e.printStackTrace();
        }
        
        
    }
}