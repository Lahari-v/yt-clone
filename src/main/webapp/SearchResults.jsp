<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #181818;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        h1 {
            text-align: left;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #fff;
            padding-left: 10px;
        }

        .video-card {
            background-color: #202020;
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            transform: scale(1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .video-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(255, 0, 0, 0.4);
        }

        .video-thumbnail {
            width: 100%;
            height: 180px;
            object-fit: cover;
            transition: opacity 0.3s ease;
        }

        .video-card:hover .video-thumbnail {
            opacity: 0.9;
        }

        .video-info {
            padding: 15px;
        }

        .video-title {
            font-size: 1rem;
            font-weight: 500;
            color: #fff;
            margin-bottom: 8px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .video-description {
            font-size: 0.85rem;
            color: #aaa;
            margin-bottom: 10px;
            height: 40px;
            overflow: hidden;
        }

        .btn-watch {
            display: inline-block;
            background-color: #ff0000;
            color: #fff;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .btn-watch:hover {
            background-color: #cc0000;
            transform: translateY(-3px);
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .back-button a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            background-color: #ff0000;
            padding: 12px 30px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #cc0000;
        }

        .video-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        @media (max-width: 768px) {
            .video-list {
                grid-template-columns: repeat(auto-fill, minmax(100%, 1fr));
            }
        }

        /* Animations */
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

        .video-card {
            animation: fadeInUp 0.5s ease-out;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Search Results</h1>
        <div class="video-list">
            <!-- Loop through the search results and display the video information -->
            <c:forEach var="video" items="${searchResults}">
                <div class="video-card">
                    <img src="${video.thumbnailUrl}" alt="${video.title}" class="video-thumbnail">
                    <div class="video-info">
                        <h3 class="video-title">${video.title}</h3>
                        <p class="video-description">${video.description}</p>
                        <a href="play?videoId=${video.videoId}" class="btn-watch">Watch Video</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Back to Home button -->
        <div class="back-button">
            <a href="home.jsp">Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>