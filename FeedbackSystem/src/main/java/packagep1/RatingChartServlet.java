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
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/RatingChartServlet")
public class RatingChartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<Integer, Integer> ratingCounts = new LinkedHashMap<>();
        for (int i = 1; i <= 5; i++) {
            ratingCounts.put(i, 0);
        }

        String sql = "SELECT overall_experience, COUNT(*) AS count FROM feedback GROUP BY overall_experience";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int rating = rs.getInt("overall_experience");
                int count = rs.getInt("count");
                ratingCounts.put(rating, count);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("ratingCounts", ratingCounts);
        request.getRequestDispatcher("rating_chart.jsp").forward(request, response);
    }
}
