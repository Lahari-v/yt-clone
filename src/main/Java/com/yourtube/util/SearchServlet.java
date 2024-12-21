package com.yourtube.util;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the search query from the URL's query parameters
        String query = request.getParameter("query");
        System.out.println("Received query: " + query);

        // Redirect to an error page if the query is empty
        if (query == null || query.isEmpty()) {
            response.sendRedirect("error.jsp"); // Redirect if no search query
            return;
        }

        // Create an instance of YouTubeService to fetch search results
        YouTubeService youtubeService = new YouTubeService();

        // Fetch the video details list using the search query
        List<VideoDetails> videoDetailsList = youtubeService.searchVideos(query);

        // Use VideoDAO to check if the videos already exist and insert them if not
        VideoDAO videoDAO = new VideoDAO();

        for (VideoDetails video : videoDetailsList) {
            String videoId = video.getVideoId();

            // Check if the video already exists in the database
            VideoDetails existingVideo = videoDAO.getVideoById(videoId);

            // If the video doesn't exist, insert it into the database
            if (existingVideo == null) {
                videoDAO.addVideo(video);
            }
        }

        // Store the list of VideoDetails in the request scope to pass to the JSP
        request.setAttribute("searchResults", videoDetailsList);
        System.out.println("Search results: " + videoDetailsList.toString());

        // Forward to SearchResults.jsp to display the results
        RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResults.jsp");
        dispatcher.forward(request, response);
    }
}
