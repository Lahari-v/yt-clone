<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.yourtube.util.VideoDAO, com.yourtube.util.VideoDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Playback - YourTube</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <style>
        /* Black & Red Theme */
        body {
            background-color: #181818;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #212121;
            border-bottom: 1px solid #444;
        }

        .navbar-brand {
            color: #FF0000 !important;
            font-weight: bold;
            font-size: 1.5rem;
        }

        .nav-link {
            color: #ddd !important;
        }

        .container {
            margin-top: 20px;
        }

        .video-player {
            margin-top: 20px;
            animation: fadeInUp 1.5s;
        }

        .video-description h3 {
            color: #FF0000;
        }

        .btn-icon {
            display: flex;
            align-items: center;
            margin: 10px 5px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-icon i {
            margin-right: 5px;
        }

        .btn-icon:hover {
            transform: scale(1.1);
            background-color: #FF0000;
            color: #fff;
        }

        .comments-section {
            margin-top: 30px;
            background-color: #212121;
            padding: 20px;
            border-radius: 8px;
            animation: fadeIn 2s;
        }

        .comment {
            display: flex;
            margin-bottom: 15px;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .comment-details {
            flex-grow: 1;
        }

        .comment-author {
            font-weight: bold;
        }

        .back-button a {
            margin-top: 20px;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">YourTube</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                                    <a class="nav-link" href="profile.jsp"><i class="fas fa-user-circle"></i> Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <%
            String videoId = request.getParameter("videoId");
            VideoDAO videoDAO = new VideoDAO();
            VideoDetails videoDetails = videoDAO.getVideoById(videoId);

            if (videoDetails == null) {
                videoDetails = new VideoDetails(videoId, "Video not found", "The video details could not be found.", "", 0, 0);
            }
        %>

        <!-- Video Player Section -->
        <div class="video-player animate_animated animate_fadeInUp">
            <iframe width="100%" height="400" src="https://www.youtube.com/embed/<%= videoId %>?autoplay=1" frameborder="0" allow="autoplay" allowfullscreen></iframe>
        </div>

        <!-- Video Description -->
        <div class="video-description">
            <h3><%= videoDetails.getTitle() %></h3>
            <p><%= videoDetails.getDescription() %></p>
        </div>

        <!-- Action Buttons -->
        <div>
            <form action="WatchLaterServlet" method="post">
                            <input type="hidden" name="videoId" value="<%= videoId %>">
                            <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">
                            <button type="submit" class="btn btn-success btn-icon">
                                <i class="fas fa-clock"></i> Save To WatchLater
                            </button>
                        </form>
            <form action="LikeVideosServlet" method="post">
                <input type="hidden" name="videoId" value="<%= videoId %>">
                <input type="hidden" name="userId" value="${sessionScope.userId}">
                <button type="submit" class="btn btn-success btn-icon">
                    <i class="fas fa-thumbs-up"></i> Like
                </button>
            </form>

            <button class="btn btn-danger btn-icon">
                <i class="fas fa-thumbs-down"></i> Dislike
            </button>
            <button class="btn btn-dark btn-icon subscribe-button">
                <i class="fas fa-bell"></i> Subscribe
            </button>
        </div>

        <!-- Comments Section -->
        <div class="comments-section">
            <h3>Post a Comment</h3>

            <!-- Comment Form -->
            <form action="videoplayback.jsp" method="post">
                <input type="hidden" name="videoId" value="<%= videoId %>">
                <input type="hidden" name="userId" value="${sessionScope.userId}"> <!-- Assuming the user ID is stored in the session -->

                <div class="form-group">
                    <label for="commentText">Write a comment:</label>
                    <!-- Black-colored text box for entering a comment -->
                    <textarea id="commentText" name="commentText" class="comment-textarea" rows="4" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Post Comment</button>
            </form>

        </div>


        <!-- Back Button -->
        <div class="back-button">
            <a href="searchResults.jsp" class="btn btn-secondary">Back to Search Results</a>
        </div>
    </div>

    <!-- JS & Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>