<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>User Login</h1>
    
<%
    try
    {
    
    String firstname = request.getParameter("fname");
    String lastname = request.getParameter("lname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

  Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia","root","admin");
        Statement st= con.createStatement();
        String sql="insert into userreg(firstname,lastname,email_id,password)Values('"+firstname+"','"+lastname+"','"+email+"','"+password+"')";
        st.executeUpdate(sql);
         out.print("Information Registered Successfully");
          response.sendRedirect("login.html");
                }
                catch(Exception e)
                {
                    out.print(e);
                    
                }
                
%>
</body>
</html>