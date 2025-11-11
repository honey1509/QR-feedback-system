package packagep1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/ViewFeedbackServlet")
public class ViewFeedbackServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Feedback> feedbackList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM feedback ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Feedback fb = new Feedback();   // ✅ NOW WORKS - MODEL IMPORTED

                fb.setId(rs.getInt("id"));
                fb.setFoodItem(rs.getString("food_item"));
                fb.setName(rs.getString("name"));
                fb.setEmail(rs.getString("email"));
                fb.setRating(rs.getInt("rating"));
                fb.setComments(rs.getString("comments"));
                fb.setDate(rs.getString("submitted_at"));

                feedbackList.add(fb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("view_feedback.jsp").forward(request, response);
    }
}
