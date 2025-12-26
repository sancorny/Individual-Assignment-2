package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import model.ProfileBean;  // Add this import

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        // Create ProfileBean object (REQUIRED STEP)
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntroduction(intro);

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/student_profiles", "app", "app");

            String sql = "INSERT INTO profile "
                       + "(name, student_id, program, email, hobbies, introduction) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, profile.getName());
            pst.setString(2, profile.getStudentId());
            pst.setString(3, profile.getProgram());
            pst.setString(4, profile.getEmail());
            pst.setString(5, profile.getHobbies());
            pst.setString(6, profile.getIntroduction());

            pst.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to JSP - Pass the ProfileBean object
        request.setAttribute("profile", profile);  // Pass bean instead of individual attributes

        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");  // Changed to profile.jsp
        rd.forward(request, response);
    }
}