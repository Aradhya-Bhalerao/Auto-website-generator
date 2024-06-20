<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Your Company</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pt Serif';
            background-size: cover;
            background-position: center;
            background-image: url("img/front.jpg");
                
                background-size: cover;
                background-attachment: fixed;
        }
        :root {
            --primary-color: #5a2f90;
            --secondary-color: #f0f0f5;
            --text-color: #333333;
            --highlight-color: #ffcc00;
            --hover-bg-color: #3e1d61;
            --hover-text-color: #ffffff;
            --footer-bg-color: #4b226c;
            --footer-text-color: #ffffff;
        }
        body {
            font-family: sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .navbar {
            background-color: darkcyan;
            overflow: hidden;
            display: flex;
            align-items: center;
            height: 70px;
            padding: 0 20px;
            background-color: rgba(0, 139, 139, 0.0); /* darkcyan with 50% opacity */

        }
        #navimg {
            height: 50px;
            width: 150px;
        }
        .navbar a {
            color: var(--footer-text-color);
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .navitem a:hover {
            background-color: var(--hover-bg-color);
            color: var(--hover-text-color);
            border-radius: 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .navitem {
            margin-left: auto;
            padding: 10px;
            position: relative;
            z-index: 2;
            display: flex;
            gap: 10px;
        }
        footer {
            background-color: darkcyan;
            color: var(--footer-text-color);
            text-align: center;
            padding: 10px;
            position: absolute;
            width: 100%;
            bottom: 0;
             background-color: rgba(0, 139, 139, 0.0); /* darkcyan with 50% opacity */

        }
        footer p {
            margin: 0;
        }
        .blur-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('table2.jpg');
            background-size: cover;
            background-position: center;
            filter: blur(5px);
            z-index: -1;
        }
        .container {
            width: 93%;
            margin: 15px auto;
            background-color: rgba(255, 255, 255, 0.5);
            padding: 20px;
            border-radius: 10px;
            overflow: auto;
        }
        h1 {
            text-align: center;
            margin: 0px;
            font-size: 45px;
            color: black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
        }
        #heading {
            color: white;
            background-color: black;
        }
        th, td {
            padding: 10px 7px;
            text-align: left;
        }
        thead {
            background-color: #333;
            color: white;
        }
        tbody tr {
            background-color: #f2f2f2;
        }
        .container button {
            position: absolute;
            right: 50px;
            top: 80px;
            margin-top: 20px;
            text-align: center;
            background: none;
            border: none;
        }
        .container button a {
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #333;
            transition: background-color 0.3s ease;
            display: inline-block;
        }
        button a:hover {
            background-color: #555;
        }
        tr:hover {
            background-color: lightgray;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="blur-bg"></div>
    <div class="navbar">
        <a href="index.html"><img id="navimg" src="img/logo.png"></a>
        <div class="navitem">
            <a href="index.html">Home</a>
            <a href="userreg.html">User Registration</a>
            <a href="login.html">User Login</a>
            <a href="adminlogin.html">Admin Login</a>
            <a href="contact.html">Contact Us</a>
        </div>
    </div>
    <div class="container">
        <h1>Your Company</h1><button><a href="userdashboard.jsp">Back</a></button>
        <%
            String userId = (String) session.getAttribute("Id");
                    

            if (userId != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");
                    String sql = "SELECT Id, CompanyName, InstaId, WhatsappNo, Email, Address, Payment FROM userinformation WHERE userId = ?";
                    PreparedStatement statement = con.prepareStatement(sql);
                    statement.setString(1, userId);
                    ResultSet rs = statement.executeQuery();
        %>
        <table border="0">
            <tbody>
                <tr id="heading">
                    <td>Id</td>
                    <td>Company Name</td>
                    <td>Instagram</td>
                    <td>Whatsapp</td>
                    <td>Email</td>
                    <td>Address</td>
                    <td>Payment</td>
                    
                </tr>
                <%
                    while (rs.next()) {
                %>
                                        <tr onclick="window.location='edit.jsp?Id=<%=rs.getString("Id")%>';">

                    <td><%= rs.getString("Id") %></td>
                    <td><%= rs.getString("CompanyName") %></td>
                    <td><%= rs.getString("InstaId") %></td>
                    <td><%= rs.getString("WhatsappNo") %></td>
                    <td><%= rs.getString("Email") %></td>
                    <td><%= rs.getString("Address") %></td>
                    <td><%= rs.getString("Payment") %></td>
                    <td></td>
                </tr>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }
            } else {
                out.print("User ID not found in session.");
            }
        %>
            </tbody>
        </table>
    </div>
    <footer>
        <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
    </footer>
</body>
</html>
