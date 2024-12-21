# YourTube: Video Playback and Comments Application

Welcome to **YourTube**, a video playback and comments web application that allows users to:
- Watch videos seamlessly via YouTube embed.
- Post and view comments on videos.
- Like, dislike, and save videos to "Watch Later."

This project implements the **DAO design pattern** for efficient and maintainable data handling, ensuring modular, reusable, and easily testable code.

---

## Features
### 1. Video Playback
- Embedded YouTube player for smooth video viewing.
- Auto-play enabled for an uninterrupted experience. 

### 2. User Actions
- **Like** videos.
- **Save to Watch Later** feature. 

---

## Technologies Used
- **Java**: Backend logic and data handling.
- **JSP**: Frontend for dynamic page rendering.
- **Servlets**: Handling HTTP requests and responses.
- **MySQL**: Database for storing comments and video metadata. 
- **Bootstrap**: Responsive UI design. 

---

## Project Structure
```
YourTube/
├── src/
   └── main/
       ├── Java/
       │   └── com.yourtube.util/
       │       ├── DBConnection.java
       │       ├── HomeServlet.java
       │       ├── LikeVideosServlet.java
       │       ├── LoginServlet.java
       │       ├── RegisterServlet.java
       │       ├── SearchServlet.java
       │       ├── VideoDAO.java
       │       ├── VideoDetails.java
       │       ├── VideoPlaybackServlet.java
       │       ├── WatchLaterServlet.java
       │       └── YouTubeService.java
       └── webapp/
           ├── images/
           └── WEB-INF/
               ├── web.xml
               ├── error.jsp
               ├── home.jsp
               ├── index.jsp
               ├── liked-videos.jsp
               ├── login.jsp
               ├── profile.jsp
               ├── register.jsp
               ├── SearchResults.jsp
               ├── videoplayback.jsp
               ├── watch-history.jsp
               └── watch-later.jsp



```

---

## Installation

### Prerequisites
- JDK 8+
- Apache Tomcat Server
- MySQL Database
- Maven (optional, for dependency management)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Lahari-v/yourtube.git
   cd yourtube
   ```

2. Set up the database:
   - Import the provided `yourtube.sql` file to create the database and tables.
   - Example table for comments:
     ```sql
    CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    confirm_password VARCHAR(255) NOT NULL,   
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

    
CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    video_url VARCHAR(255) NOT NULL,
    thumbnail_url VARCHAR(255),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


     ```

3. Configure database connection:
   - Update `DatabaseConnection.java` with your MySQL credentials:
     ```java
     private static final String DB_URL = "jdbc:mysql://localhost:3306/yourtube";
     private static final String DB_USER = "root";
     private static final String DB_PASSWORD = "password";
     ```

4. Deploy on Tomcat:
   - Copy the project folder to `webapps` directory.
   - Start the server and access the app at: `http://localhost:8080/yourtube`.

---

## Usage
1. **Video Playback**: Enter a video ID and start playback.
2. **Post Comments**:
   - Navigate to a video's comment section.
   - Write a comment and hit "Post Comment."
   - The comment is stored in the database and displayed below the video.
3. **Like/Dislike and Watch Later**: Interact with buttons below the video.

---


## Contributing
Contributions are welcome! Please:
1. Fork the repository.
2. Create a new branch for your feature/bugfix.
3. Submit a pull request with detailed notes.


---

## Screenshots

### Register
![Screenshot (8)](https://github.com/user-attachments/assets/3dc91855-a51c-40ed-adc0-dc7b041d7bba)

### Login
![Screenshot (7)](https://github.com/user-attachments/assets/fbd8c889-2b30-4854-b111-bd282759319a)

### Home Page
![Screenshot (1)](https://github.com/user-attachments/assets/d27981af-5645-41e1-8b8d-47a1106303e0)
![Screenshot (2)](https://github.com/user-attachments/assets/25499833-59e2-4d88-83f9-ccdd591c34b4)

### Search Results
![Screenshot (3)](https://github.com/user-attachments/assets/b95634e8-e24b-41d9-a397-f9b226e2f117)

### Video Playback
![Screenshot (4)](https://github.com/user-attachments/assets/9c03ee53-837e-49c5-8fd7-c07ba780a1f6)

### Watch History
![Screenshot (5)](https://github.com/user-attachments/assets/b180153b-e1fe-4360-b4e0-93bc32d2476a)

---

## Contact
For questions or feedback, feel free to reach out at **lahariv28@gmail.com**.

