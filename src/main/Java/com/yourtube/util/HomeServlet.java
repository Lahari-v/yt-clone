package com.yourtube.util;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch video details from the database using the VideoDAO class
        VideoDAO videoDAO = new VideoDAO();
        List<VideoDetails> videoDetailsList = videoDAO.getAllVideos();  // Assuming you have a method to get all videos

        // Set the list of video details as an attribute to pass to the JSP
        request.setAttribute("videoDetailsList", videoDetailsList);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
