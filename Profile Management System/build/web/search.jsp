<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Profiles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: #f0f8ff;
        }
        .search-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
        }
        input[type="submit"] {
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .links {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="search-box">
        <h2>Search Profiles</h2>
        <form action="searchResults.jsp" method="get">
            <input type="text" name="keyword" placeholder="Enter student name or ID..." required>
            <br>
            <input type="submit" value="Search">
        </form>
        
        <div class="links">
            <a href="profile_form.html">Create Profile</a> | 
            <a href="viewProfiles.jsp">View All</a>
        </div>
    </div>
</body>
</html>
