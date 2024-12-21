<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YourTube - Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #181818;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #202020;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1s ease-in-out;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            position: relative;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #333;
            overflow: hidden;
            margin-right: 20px;
            position: relative;
            transition: transform 0.3s ease;
        }

        .profile-avatar:hover {
            transform: scale(1.1);
        }

        .profile-avatar img {
            width: 100%;
            height: auto;
        }

        .upload-avatar {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #FF0000;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
        }

        .profile-details {
            flex: 1;
        }

        .detail {
            margin-bottom: 10px;
        }

        .detail label {
            font-weight: bold;
            color: #FF0000;
        }

        .detail span {
            margin-left: 10px;
            color: #fff;
        }

        h2 {
            color: #FF0000;
            text-shadow: 2px 2px 5px rgba(255, 0, 0, 0.7);
        }

        button:hover {
            background-color: #cc0000;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-custom {
            background-color: #FF0000;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #cc0000;
        }

        /* Glow effect */
        .profile-container:hover {
            box-shadow: 0 0 15px 4px rgba(255, 0, 0, 0.6);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="profile-container">
            <div class="profile-header">
                <!-- Avatar Section -->
                <div class="profile-avatar">
                    <form action="uploadAvatar" method="POST" enctype="multipart/form-data">
                        <img id="avatarImg" src="default-avatar.png" alt="Avatar">
                        <input type="file" name="avatar" class="upload-avatar form-control" onchange="previewAvatar(event)">
                    </form>
                </div>

                <!-- Profile Details -->
                <div class="profile-details">
                    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
                    <div class="detail">
                        <label>Full Name:</label>
                        <span id="fullName"></span>
                    </div>
                    <div class="detail">
                        <label>Email:</label>
                        <span id="email"></span>
                    </div>
                    <div class="detail">
                        <label>Member Since:</label>
                        <span id="createdAt"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function previewAvatar(event) {
            const reader = new FileReader();
            reader.onload = function () {
                const avatarImg = document.getElementById('avatarImg');
                avatarImg.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

    <%
        String username = (String) session.getAttribute("username");
        if (username != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video_app", "root", "Lahari@321");
                String query = "SELECT full_name, email, created_at FROM users WHERE username = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("full_name");
                    String email = rs.getString("email");
                    Timestamp createdAt = rs.getTimestamp("created_at");
    %>
                    <script>
                        document.getElementById('fullName').innerText = '<%= fullName %>';
                        document.getElementById('email').innerText = '<%= email %>';
                        document.getElementById('createdAt').innerText = '<%= createdAt.toString() %>';
                    </script>
    <%
                } else {
                    out.println("<p>Error: User details not found!</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        } else {
            out.println("<p>Error: User is not logged in!</p>");
        }
    %>
</body>

</html>