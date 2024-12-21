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

@WebServlet("/LikeVideosServlet")
public class LikeVideosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");

        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                // Check if the video is already in liked_videos
                String checkQuery = "SELECT * FROM liked_videos WHERE video_id = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, videoId);
                    try (ResultSet rs = checkStmt.executeQuery()) {
                        if (rs.next()) {
                            // Video is already liked
                            response.sendRedirect("videoplayback.jsp?videoId=" + videoId + "&liked=true");
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

                            // Insert video details into liked_videos table
                            String insertQuery = "INSERT INTO liked_videos (video_id, title, description, thumbnail_url) VALUES (?, ?, ?, ?)";
                            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                                insertStmt.setString(1, videoId);
                                insertStmt.setString(2, title);
                                insertStmt.setString(3, description);
                                insertStmt.setString(4, thumbnailUrl);
                                insertStmt.executeUpdate();
                            }
                        }
                    }
                }

                // Increment like_count in videos table
                String updateQuery = "UPDATE videos SET like_count = like_count + 1 WHERE video_id = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                    updateStmt.setString(1, videoId);
                    updateStmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("videoplayback.jsp?videoId=" + videoId + "&liked=true");
    }
}
