package packagep1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/adminhomeservlet")
public class AdminHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

       
        if (session == null || session.getAttribute("ADMIN") == null) {
            response.sendRedirect("admin_login.jsp?error=login-first");
            return;
        }

        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC LIMIT 20";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

           
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setName(rs.getString("name"));
                fb.setEmail(rs.getString("email"));
                fb.setFoodItem(rs.getString("food_item"));
                fb.setServiceRating(rs.getInt("service_rating"));
                fb.setOverallExperience(rs.getInt("overall_experience"));
                fb.setComments(rs.getString("comments"));
                fb.setSubmittedAt(rs.getTimestamp("submitted_at"));
                feedbackList.add(fb);
            }

         
            request.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("view_feedback.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException("Error loading feedback data", e);
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
