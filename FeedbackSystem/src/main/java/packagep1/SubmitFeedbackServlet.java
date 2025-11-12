package packagep1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String foodItem = request.getParameter("foodItem");
        String foodquality = request.getParameter("foodquality");
        String comments = request.getParameter("comments");

        int servicerating = 0;
        int overallexperience = 0;

        try {
            servicerating = Integer.parseInt(request.getParameter("servicerating"));
            overallexperience = Integer.parseInt(request.getParameter("overall"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO feedback "
                       + "(name, email, foodItem, foodquality, servicerating, overallexperience, comments) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, foodItem);
            ps.setString(4, foodquality);
            ps.setInt(5, servicerating);
            ps.setInt(6, overallexperience);
            ps.setString(7, comments);

            ps.executeUpdate();
            ps.close();

           
            request.setAttribute("message", "Thank you! Your feedback was submitted successfully.");
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}