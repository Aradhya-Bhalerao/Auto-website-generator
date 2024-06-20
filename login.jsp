<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<%
    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/webmedia";
    String dbUsername = "root";
    String dbPassword = "admin";

    // Retrieve the parameters
    String username = request.getParameter("email");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare the SQL statement to check the username and password
            String query = "SELECT * FROM userreg WHERE email_id = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute the query
            rs = ps.executeQuery();

            // If the query returns a row, the user is authenticated
            if (rs.next()) {
                String userId = rs.getString("userId");
                session.setAttribute("Id", userId);
                response.sendRedirect("userdashboard.jsp"); // Redirect to dashboard
            } else {
        response.sendRedirect("login.html?error=loginFailed"); // Redirect if parameters are missing
            }
        } catch (SQLException e) {
            out.println("<p>Database error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("<p>Database error on close: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        }
    } else {
        response.sendRedirect("login.html?error=loginFailed"); // Redirect if parameters are missing

    }
%>
</body>
</html>
