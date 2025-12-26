<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String keyword = request.getParameter("keyword");
    if (keyword == null) keyword = "";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #f0f8ff;
        }
        .results {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .profile-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }
        .no-results {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="results">
        <h2>Search Results for "<%= keyword %>"</h2>
        
        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            boolean hasResults = false;
            int count = 0;
            
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/student_profiles", "app", "app");
                
                String sql = "SELECT * FROM profile WHERE name LIKE ? OR student_id LIKE ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                pst.setString(2, "%" + keyword + "%");
                
                rs = pst.executeQuery();
                
                // Check if there are results
                hasResults = rs.next();
                
                if (!hasResults) {
        %>
                    <div class="no-results">
                        <p>No profiles found matching "<%= keyword %>"</p>
                    </div>
        <%
                } else {
                    // Display first result (already retrieved by rs.next())
                    do {
                        count++;
        %>
                    <div class="profile-item">
                        <strong><%= rs.getString("name") %></strong> 
                        (ID: <%= rs.getString("student_id") %>)<br>
                        Program: <%= rs.getString("program") != null ? rs.getString("program") : "Not specified" %><br>
                        Email: <%= rs.getString("email") %><br>
                        <% if (rs.getString("hobbies") != null && !rs.getString("hobbies").isEmpty()) { %>
                        Hobbies: <%= rs.getString("hobbies") %><br>
                        <% } %>
                    </div>
        <%
                    } while (rs.next()); // Continue while there are more rows
        %>
                    <p><strong>Found <%= count %> profile(s)</strong></p>
        <%
                }
                
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <div class="no-results">
                    <p>Error searching: <%= e.getMessage() %></p>
                </div>
        <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        
        <br>
        <div style="text-align: center;">
            <a href="search.jsp">← Search Again</a> | 
            <a href="viewProfiles.jsp">View All Profiles</a> | 
            <a href="profile_form.html">Create New Profile</a>
        </div>
    </div>
</body>
</html>