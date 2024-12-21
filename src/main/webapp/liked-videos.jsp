<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.yourtube.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liked Videos - YourTube</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #181818;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #212121;
        }

        .navbar-brand {
            color: #FF0000 !important;
        }

        .nav-link {
            color: #ddd !important;
        }

        .container {
            margin-top: 60px;
        }

        .video-card {
            background-color: #212121;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .video-title {
            color: #FF0000;
            font-size: 1.2rem;
        }

        .btn-watch {
            margin-top: 10px;
            color: #fff;
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#"><i class="fab fa-youtube"></i> YourTube</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
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

    <!-- Liked Videos Section -->
    <div class="container">
        <h3>Your Liked Videos</h3>
        <div class="row">
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    conn = DBConnection.getConnection();
                    if (conn != null) {
                        // Fetch liked videos
                        String sql = "SELECT video_id, title, description, thumbnail_url FROM liked_videos";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
            %>
            <%
                do {
                    String videoId = rs.getString("video_id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String thumbnailUrl = rs.getString("thumbnail_url");
            %>
            <div class="col-md-4">
                <div class="video-card">
                    <img src="<%= thumbnailUrl %>" alt="<%= title %>" class="img-fluid">
                    <div>
                        <h5 class="video-title"><%= title %></h5>
                        <p><%= description %></p>
                        <a href="videoplayback.jsp?videoId=<%= videoId %>" class="btn btn-danger btn-watch">
                            <i class="fas fa-play"></i> Watch Video
                        </a>
                    </div>
                </div>
            </div>
            <%
                } while (rs.next());
            %>
            <%
                        } else {
            %>
            <div class="col-12">
                <p>No liked videos found.</p>
            </div>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
