<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <style>
        body {
            background: linear-gradient(-45deg, #89f7fe, #66a6ff, #fbc2eb, #a18cd1);
            background-size: 400% 400%;
            animation: gradient 7s ease infinite;
            font-family: Arial;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            max-width: 800px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background: #4a90e2;
            color: white;
            padding: 10px;
            text-align: left;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
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
        <h1>All Student Profiles</h1>
        
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/student_profiles", "app", "app");
                
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM profile");
                
                if (rs.next()) {
        %>
                    <table>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Program</th>
                            <th>Email</th>
                            <th>Hobbies</th>
                        </tr>
                        <% do { %>
                        <tr>
                            <td><%= rs.getString("student_id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("program") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("hobbies") %></td>
                        </tr>
                        <% } while (rs.next()); %>
                    </table>
        <%
                } else {
                    out.println("<p>No profiles found. Create the first one!</p>");
                }
                
            } catch(Exception e) {
                out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
            } finally {
                try { if(rs!=null) rs.close(); if(stmt!=null) stmt.close(); if(con!=null) con.close(); } 
                catch(Exception e) {}
            }
        %>
        
        <div class="links">
            <a href="profile_form.html">Back to Form</a>
            <a href="search.jsp">Search</a>
        </div>
    </div>
</body>
</html>