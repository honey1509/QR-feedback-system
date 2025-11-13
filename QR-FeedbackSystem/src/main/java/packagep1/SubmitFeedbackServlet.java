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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String foodItem = request.getParameter("fooditem");
        String comments = request.getParameter("comments");

        int foodQuality = 0;
        int serviceRating = 0;
        int overallExperience = 0;

        try {
            foodQuality = Integer.parseInt(request.getParameter("foodquality"));
            serviceRating = Integer.parseInt(request.getParameter("servicerating"));
            overallExperience = Integer.parseInt(request.getParameter("overall"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        try (Connection con = DBConnection.getConnection()) {

          
            String sql = "INSERT INTO feedback "
                       + "(name, email, food_item, food_quality, service_rating, overall_experience, comments) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, foodItem);
            ps.setInt(4, foodQuality);
            ps.setInt(5, serviceRating);
            ps.setInt(6, overallExperience);
            ps.setString(7, comments);

            int rows = ps.executeUpdate();
            ps.close();

            if (rows > 0) {
                System.out.println(" Feedback inserted successfully!");
                request.setAttribute("message", "Thank you! Your feedback was submitted successfully.");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                System.out.println(" Feedback not inserted!");
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
