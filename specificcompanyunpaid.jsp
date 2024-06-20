<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Report</title>
    <style>
        :root {
            --primary-color: #5a2f90; /* Dark purple */
            --secondary-color: #f0f0f5; /* Light grey */
            --text-color: #333333; /* Dark grey */
            --highlight-color: #ffcc00; /* Yellow */
            --hover-bg-color: #3e1d61; /* Darker purple */
            --hover-text-color: #ffffff; /* White */
            --footer-bg-color: #4b226c; /* Slightly different purple for footer */
            --footer-text-color: #ffffff; /* White */
            --navbar-bg-color: darkcyan; /* Navbar background color */
            --container-bg-color: #fff; /* Container background color */
            --form-bg-color: #f9f9f9; /* Form background color */
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            min-height: 100vh; 
            box-sizing: border-box;
             background-image: url("img/front.jpg");
                
                background-size: cover;
                background-attachment: fixed;
        }

        /* Navbar styles */
        .navbar {
            background-color: var(--navbar-bg-color);
            overflow: hidden;
            display: flex;
            align-items: center; /* Center vertically */
            height: 70px;
            padding: 0 20px;
            background-color: rgba(0, 139, 139, 0.0);
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

        /* Footer styles */
       footer {
    background-color: var(--navbar-bg-color);
    color: var(--footer-text-color);
    text-align: center;
    padding: 10px;
    background-color: rgba(0, 139, 139, 0.0);
}

        footer p {
            margin: 0;
        }

        .container {
            width: 80%;
            margin: 5px auto;
            background-color: var(--container-bg-color);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
             background-color: rgba(255, 255, 255, 0.1);
        }

        .report, .payment {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            flex: 1;
            margin: 10px;
            background-color: var(--form-bg-color);
                         background-color: rgba(255, 255, 255, 0.7);

        }
        .payment{
            height: 30%;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .button, .backbtn {
            background-color: var(--primary-color);
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .button:hover, .backbtn:hover {
            background-color: #3e1d61; /* Darker purple on hover */
            transform: scale(1.05);
        }

        .backbtn a {
            text-decoration: none;
            color: white;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="date"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
    <script>
        function setExpiringDate() {
            const startDateInput = document.getElementById("startDate");
            const expiringDateInput = document.getElementById("expiringDate");

            const startDate = new Date(startDateInput.value);
            const expiringDate = new Date(startDate);
            expiringDate.setFullYear(expiringDate.getFullYear() + 1);

            const expiringDateString = expiringDate.toISOString().split('T')[0];
            expiringDateInput.value = expiringDateString;
        }

        window.onload = function() {
            const today = new Date();
            const todayString = today.toISOString().split('T')[0];

            const startDateInput = document.getElementById("startDate");
            startDateInput.value = todayString;
            setExpiringDate();
        };
    </script>
</head>
<body>
<!-- Navbar -->
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

<button class="backbtn"><a href="unpaiduser.jsp">Back</a></button>

<div class="container">
    <div class="report">
        <%
            String ID  = request.getParameter("Id");
            session.setAttribute("Id",ID);
                        String cname = "";

            try {
             
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");
                                String sql = "SELECT * FROM userinformation WHERE Id=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, ID);
                ResultSet rs = pst.executeQuery();
                out.println("<h1>Company details</h1>");
                out.println("<table>");
                while (rs.next()) {
                    String id = rs.getString("Id");
                     cname = rs.getString("CompanyName");
                    String theme = rs.getString("Theme");
                    String about = rs.getString("AboutInformation");
                    String footer = rs.getString("FooterText");
                    String no = rs.getString("WhatsappNo");
                    String email = rs.getString("Email");
                    String maplink = rs.getString("MapLink");
                    String add = rs.getString("Address");
                    String logo = rs.getString("LogoPath");
                    String payment = rs.getString("Payment");
                    // Output other fields as needed
                    out.println("<tr><td>Id</td><td>" + id + "</td></tr>");
                    out.println("<tr><td>Company Name</td><td>" + cname + "</td></tr>");
                    out.println("<tr><td>Theme</td><td>" + theme + "</td></tr>");
                    out.println("<tr><td>About Information</td><td>" + about + "</td></tr>");
                    out.println("<tr><td>Footer Text</td><td>" + footer + "</td></tr>");
                    out.println("<tr><td>Whatsapp No</td><td>" + no + "</td></tr>");
                    out.println("<tr><td>Email</td><td>" + email + "</td></tr>");
                    out.println("<tr><td>Map Address link</td><td>" + maplink + "</td></tr>");
                    out.println("<tr><td>Address</td><td>" + add + "</td></tr>");
                    out.println("<tr><td>Logo Path</td><td>" + logo + "</td></tr>");
                    out.println("<tr><td>Payment</td><td>" + payment + "</td></tr>");
                }
                out.println("</table>");
            %>
    </div>
    <div class="payment">
        <form action="updatepayment.jsp" method="post">
            <div class="form-group">
                    <input type="hidden" name="companyName" value="<%= cname %>">

                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="startDate">Starting Date:</label>
                <input type="date" id="startDate" name="startDate" onchange="setExpiringDate()" required>
            </div>
            <div class="form-group">
                <label for="expiringDate">Expiring Date:</label>
                <input type="date" id="expiringDate" name="expiringDate" readonly>
            </div>
            <input type="submit" value="Pay" class="button">
        </form>
    </div>
</div>

<%
    rs.close();
    pst.close();
    con.close();
} catch(Exception e) {
    out.print(e);
}
%>
<!-- Footer -->
<footer>
    <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
</footer>

</body>
</html>

