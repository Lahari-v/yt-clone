<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to YourTube</title>

    <!-- External CSS and Animation Libraries -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            background-color: #181818;
            color: white;
        }

        .navbar {
            background-color: #212121;
            border-bottom: 1px solid #444;
        }

        .navbar-brand {
            font-weight: bold;
            color: #FF0000;
            font-size: 1.5rem;
        }

        .nav-link {
            color: #ddd !important;
            display: flex;
            align-items: center;
        }

        .nav-link i {
            margin-right: 5px;
        }

        /* Video Card Animation */
        .card {
            background-color: #181818;
            color: white;
            border: none;
            margin-bottom: 20px;
            border-radius: 8px;
            transition: transform 0.5s, box-shadow 0.5s;
        }

        .card:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 25px rgba(255, 0, 0, 0.4);
        }

        /* Hero Section */
        .hero-section {
            background-color: #FF0000;
            height: 60vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: bold;
            animation: fadeInDown 2s;
        }

        .hero-section p {
            font-size: 1.2rem;
            animation: fadeInUp 2s;
        }

        .hero-section .btn {
            animation: pulse 1.5s infinite;
        }

        /* Footer */
        footer {
            background-color: #212121;
            color: #bbb;
        }

        footer a {
            color: #FF0000;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <a class="navbar-brand" href="#">YourTube</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i>Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i>Register</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div>
            <h1 class="animate_animated animate_fadeInDown">Welcome to YourTube</h1>
            <p class="animate_animated animate_fadeInUp">Discover, Watch, and Share Educational Videos!</p>
            <a href="register.jsp" class="btn btn-light btn-lg mt-3">Join Now</a>
        </div>
    </section>

    <!-- Featured Videos Section -->
    <section class="container mt-5">
        <h2 class="text-center mb-4">Featured Videos</h2>
        <div class="row">
            <!-- Video Card 1 (g-fmCxT3HNA) -->
            <div class="col-md-4 animate_animated animate_zoomIn">
                <div class="card">
                    <iframe width="100%" height="215" src="https://www.youtube.com/embed/g-fmCxT3HNA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    <div class="card-body">
                        <h5 class="card-title">BELGIUM VLOG || exploring fairytale cities Brussels, Bruges, & Ghent!</h5>
                        <p class="card-text">Come with us to Brussels, Ghent, and Bruges in this vlog encompassing the first half of our trip. You can expect lots of exploring points of interest, cafes, and of course, chocolate and waffles. </p>
                        <a href="login.jsp" class="btn btn-outline-light">Watch Now</a>
                    </div>
                </div>
            </div>

            <!-- Video Card 2 (b5l5UodFzMo) -->
            <div class="col-md-4 animate_animated animate_zoomIn delay-1s">
                <div class="card">
                    <iframe width="100%" height="215" src="https://www.youtube.com/embed/b5l5UodFzMo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    <div class="card-body">
                        <h5 class="card-title">Learn Java in 15 Minutes (seriously)</h5>
                        <p class="card-text">Out of pure spite, I've decided to make the world's shortest Java course to make it simple and straightforward for anyone to learn Java.</p>
                        <a href="login.jsp" class="btn btn-outline-light">Watch Now</a>
                    </div>
                </div>
            </div>

            <!-- Video Card 3 (9_5wHw6l11o&t=1s) -->
            <div class="col-md-4 animate_animated animate_zoomIn delay-2s">
                <div class="card">
                    <iframe width="100%" height="215" src="https://www.youtube.com/embed/9_5wHw6l11o?start=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    <div class="card-body">
                        <h5 class="card-title">7 Recipes You Can Make In 5 Minutes</h5>
                        <p class="card-text">Check us out on Facebook! - facebook.com/buzzfeedtasty</p>
                        <a href="login.jsp" class="btn btn-outline-light">Watch Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center py-3">
        <p>&copy; 2024 YourTube | <a href="#">Privacy</a> | <a href="#">Terms</a></p>
    </footer>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
