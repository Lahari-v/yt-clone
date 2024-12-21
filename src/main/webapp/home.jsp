<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - YourTube</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #181818;
            color: white;
        }

        .navbar {
            background-color: #202020;
            border-bottom: 2px solid #ff0000;
        }

        .navbar-brand {
            color: #ff0000;
        }

        .navbar-nav .nav-link {
            color: #ccc;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 220px;
            background-color: #202020;
            color: #ccc;
            padding-top: 20px;
            border-right: 2px solid #ff0000;
        }

        .sidebar a {
            color: #ccc;
            display: block;
            padding: 10px;
        }

        .sidebar a:hover {
            background-color: #ff0000;
            color: white;
        }

        .main-content {
            margin-left: 230px;
            padding: 20px;
        }

        .video-card {
            background-color: #282828;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .video-card iframe {
            width: 100%;
            height: 200px;
            border: none;
        }

        .video-info {
            padding: 10px;
        }

        .footer {
            background-color: #202020;
            color: #ccc;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 180px;
            }

            .main-content {
                margin-left: 180px;
            }
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="#"><i class="fab fa-youtube"></i> YourTube</a>
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

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Menu</h3>
        <a href="watch-history.jsp"><i class="fas fa-history"></i> History</a>
        <a href="watch-later.jsp"><i class="fas fa-clock"></i> Watch Later</a>
        <a href="liked-videos.jsp"><i class="fas fa-thumbs-up"></i> Liked Videos</a>
    </div>
<br>
<br>
<br><br>
    <!-- Main Content -->
    <div class="main-content">
        <div class="container">

            <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
            <p>Discover amazing videos and channels!</p>

            <!-- Search Bar -->
            <form action="search" method="GET" class="mb-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for videos..." name="query">
                    <div class="input-group-append">
                        <button class="btn btn-danger" type="submit"><i class="fas fa-search"></i> Search</button>
                    </div>
                </div>
            </form>


            <!-- Video Thumbnails Grid -->
            <div class="row">
            <div class="col-md-4 col-sm-6 video-card">
            <iframe src="https://www.youtube.com/embed/SqcY0GlETPk" allowfullscreen></iframe>
            <div class="video-info">
                <h5 class="video-title">React Tutorial for Beginners</h5>
                <p>Master React 18 with TypeScript! ⚛️  Build amazing front-end apps with this beginner-friendly tutorial.</p>
            </div>
            </div>

            <div class="col-md-4 col-sm-6 video-card">
                <iframe src="https://www.youtube.com/embed/St48epdRDZw" allowfullscreen></iframe>
                <div class="video-info">
                    <h5>How I Would Learn Python FAST in 2024 (if I could start over)</h5>
                    <p>Learn to build complex software 👉 https://app.codecrafters.io/join?via=... </p>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 video-card">
                                <iframe src="https://www.youtube.com/embed/q3zqJs7JUCQ" allowfullscreen></iframe>
                                <div class="video-info">
                                    <h5>Taylor Swift - Fortnight</h5>
                                    <p>►Follow Taylor Swift Online
                                       Instagram:   / taylorswift
                                       Facebook:   / taylorswift
                                       Tumblr:   / taylorswift
                                       Twitter:   / taylorswift13
                                       Website: http://www.taylorswift.com</p>
                                </div>
                            </div>

            <div class="col-md-4 col-sm-6 video-card">
                <iframe src="https://www.youtube.com/embed/HaN6LuwS_60" allowfullscreen></iframe>
                <div class="video-info">
                    <h5>If I start learning code in 2025, I’d do this.</h5>
                    <p>How I Would Start Coding from Scratch (and Never Be Replaced by AI)</p>
                </div>
            </div>
                <!-- First Video -->
                <div class="col-md-4 col-sm-6 video-card">
                    <iframe src="https://www.youtube.com/embed/e-ORhEE9VVg" allowfullscreen></iframe>
                    <div class="video-info">
                        <h5 class="video-title">Taylor Swift - Blank Space</h5>
                        <p>►Follow Taylor Swift Online
                           Instagram:   / taylorswift
                           Facebook:   / taylorswift
                           Tumblr:   / taylorswift
                           Twitter:   / taylorswift13
                           Website: http://www.taylorswift.com</p>
                    </div>
                </div>

                <!-- Second Video -->


                <!-- Third Video -->
                <div class="col-md-4 col-sm-6 video-card">
                    <iframe src="https://www.youtube.com/embed/VuNIsY6JdUw" allowfullscreen></iframe>
                    <div class="video-info">
                        <h5>Taylor Swift - You Belong With Me</h5>
                        <p>►Follow Taylor Swift Online
                           Instagram:   / taylorswift
                           Facebook:   / taylorswift
                           Tumblr:   / taylorswift
                           Twitter:   / taylorswift13
                           Website: http://www.taylorswift.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 YourTube. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
