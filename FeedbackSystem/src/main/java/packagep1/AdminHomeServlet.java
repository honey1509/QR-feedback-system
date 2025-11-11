package packagep1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/adminhomeservlet")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (session == null || session.getAttribute("ADMIN") == null) {
            resp.sendRedirect("admin_login.jsp?error=login-first");
            return;
        }

        List<Feedback> feedbackList = new ArrayList<>();

        String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC LIMIT 20";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Feedback fb = new Feedback();

                fb.setId(rs.getLong("id"));
                fb.setRestaurantId(rs.getInt("restaurant_id"));
                fb.setTableNo(rs.getString("table_no"));
                fb.setOrderId(rs.getString("order_id"));
                fb.setRating(rs.getInt("rating"));
                fb.setComments(rs.getString("comments"));

                Timestamp ts = rs.getTimestamp("submitted_at");
                if (ts != null) {
                    fb.setSubmittedAt(ts.toLocalDateTime());
                }

                feedbackList.add(fb);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error loading feedback", e);
        }

        // Send to JSP
        req.setAttribute("feedbackList", feedbackList);
        req.getRequestDispatcher("admin_home.jsp").forward(req, resp);
    }

	}


