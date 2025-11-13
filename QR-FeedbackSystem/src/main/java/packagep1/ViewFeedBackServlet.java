package packagep1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/viewfeedbackservlet")
public class ViewFeedBackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Feedback> feedbackList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setName(rs.getString("name"));
                fb.setEmail(rs.getString("email"));
                fb.setFoodItem(rs.getString("food_item"));
                fb.setFoodQuality(rs.getInt("food_quality"));
                fb.setServiceRating(rs.getInt("service_rating"));
                fb.setOverallExperience(rs.getInt("overall_experience"));
                fb.setComments(rs.getString("comments"));
                fb.setSubmittedAt(rs.getTimestamp("submitted_at"));
                feedbackList.add(fb);
            }

            System.out.println("✅ Records fetched from DB: " + feedbackList.size());

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("view_feedback.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
