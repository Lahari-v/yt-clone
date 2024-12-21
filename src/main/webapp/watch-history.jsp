<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.yourtube.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watch History - YourTube</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        body {
            background-color: #181818;
            color: #fff;
        }

        .navbar {
            background-color: #202020;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 30 30'%3E%3Cpath stroke='rgba(255, 255, 255, 1)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }

        .sidebar {
            background-color: #202020;
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            padding-top: 60px;
        }

        .sidebar a {
            padding: 15px 25px;
            display: block;
            color: #fff;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #383838;
        }

        .container {
            margin-left: 270px;
            margin-top: 60px;
        }

        .video-card {
            background-color: #202020;
            border: none;
            margin-bottom: 20px;
        }

        .video-thumbnail {
            width: 100%;
            height: auto;
        }

        .video-title {
            font-size: 1.1rem;
            color: #fff;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="watch-later.jsp"><i class="fas fa-clock"></i> Watch Later</a>
        <a href="liked-videos.jsp"><i class="fas fa-thumbs-up"></i> Liked Videos</a>
    </div>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="#"><i class="fab fa-youtube"></i> YourTube</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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

    <!-- Main Content -->
    <div class="container">
        <h3>Your Watch History</h3>
        <div class="row">
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    conn = DBConnection.getConnection();
                    if (conn != null) {
                        stmt = conn.createStatement();
                        String sql = "SELECT video_id, title, description, thumbnail_url FROM videos";
                        rs = stmt.executeQuery(sql);

                        if (rs.next()) {
                            do {
                                String title = rs.getString("title");
                                String thumbnailUrl = rs.getString("thumbnail_url");
            %>
                                <div class="col-md-4">
                                    <div class="video-card">
                                        <img src="<%= thumbnailUrl %>" alt="<%= title %>" class="video-thumbnail">
                                        <div class="video-info p-3">
                                            <h5 class="video-title"><%= title %></h5>
                                        </div>
                                    </div>
                                </div>
            <%
                            } while (rs.next());
                        } else {
            %>
                            <p>No videos found in your watch history.</p>
            <%
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
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