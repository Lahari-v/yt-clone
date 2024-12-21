package com.yourtube.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WatchLaterServlet")
public class WatchLaterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");
        boolean isWatchLaterAdded = false;

        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                // Check if the video is already in watch_later
                String checkQuery = "SELECT * FROM watch_later WHERE video_id = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, videoId);
                    try (ResultSet rs = checkStmt.executeQuery()) {
                        if (rs.next()) {
                            // Video is already in watch_later
                            response.sendRedirect("videoplayback.jsp?videoId=" + videoId);
                            return;
                        }
                    }
                }

                // Fetch video details from videos table
                String videoQuery = "SELECT title, description, thumbnail_url FROM videos WHERE video_id = ?";
                try (PreparedStatement videoStmt = conn.prepareStatement(videoQuery)) {
                    videoStmt.setString(1, videoId);
                    try (ResultSet videoRs = videoStmt.executeQuery()) {
                        if (videoRs.next()) {
                            String title = videoRs.getString("title");
                            String description = videoRs.getString("description");
                            String thumbnailUrl = videoRs.getString("thumbnail_url");

                            // Insert video details into watch_later table
                            String insertQuery = "INSERT INTO watch_later (video_id, title, description, thumbnail_url) VALUES (?, ?, ?, ?)";
                            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                                insertStmt.setString(1, videoId);
                                insertStmt.setString(2, title);
                                insertStmt.setString(3, description);
                                insertStmt.setString(4, thumbnailUrl);
                                insertStmt.executeUpdate();
                                isWatchLaterAdded = true; // Flag to indicate the video was added to Watch Later
                            }
                        }
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to video playback page with the `watchLaterAdded=true` flag if video was added to Watch Later
        if (isWatchLaterAdded) {
            response.sendRedirect("videoplayback.jsp?videoId=" + videoId + "&watchLaterAdded=true");
        } else {
            response.sendRedirect("videoplayback.jsp?videoId=" + videoId);
        }
    }
}
