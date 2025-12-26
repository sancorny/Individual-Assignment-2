<%@ page import="model.ProfileBean" %>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
    if (profile == null) {
        response.sendRedirect("profile_form.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Created</title>
    <style>
        body {
            background: linear-gradient(-45deg, #89f7fe, #66a6ff, #fbc2eb, #a18cd1);
            background-size: 400% 400%;
            animation: gradient 7s ease infinite;
            font-family: Arial;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            width: 500px;
        }
        .detail {
            margin: 10px 0;
            padding: 10px;
            background: #f5f5f5;
            border-radius: 5px;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            margin: 0 10px;
            color: #4a90e2;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 style="color: green;">Profile Created</h2>
        
        <div class="detail"><b>Name:</b> <%= profile.getName() %></div>
        <div class="detail"><b>Student ID:</b> <%= profile.getStudentId() %></div>
        <div class="detail"><b>Program:</b> <%= profile.getProgram() %></div>
        <div class="detail"><b>Email:</b> <%= profile.getEmail() %></div>
        <div class="detail"><b>Hobbies:</b> <%= profile.getHobbies() %></div>
        <div class="detail"><b>Introduction:</b> <%= profile.getIntroduction() %></div>
        
        <div class="links">
            <a href="profile_form.html">Create Another</a>
            <a href="viewProfiles.jsp">View All</a>
            <a href="search.jsp">Search</a>
        </div>
    </div>
</body>
</html>