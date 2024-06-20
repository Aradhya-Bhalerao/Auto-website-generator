<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            }

            body {
                font-family: sans-serif;
                background-color: var(--secondary-color);
                color: var(--text-color);
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                 background-image: url("img/front.jpg");
                
                background-size: cover;
                background-attachment: fixed;
            }

            .container {
                margin: 40px;
                padding: 10px;
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
            }

            /* Navbar styles */
            .navbar {
                background-color: darkcyan;
                overflow: hidden;
                display: flex;
                align-items: center; /* Center vertically */
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

            /* Footer styles */
            footer {
                background-color: darkcyan;
                color: var(--footer-text-color);
                text-align: center;
                padding: 10px;
                position: fixed;
                width: 100%;
                bottom: 0;
                               background-color: rgba(0, 139, 139, 0.0); /* darkcyan with 50% opacity */

            }

            footer p {
                margin: 0;
            }

            /* Dashboard styles */
            .dashboard {
                text-align: center;
                margin-top: 100px; /* Adjust as needed */
            }

            .dashboard button {
                padding: 10px 20px;
                margin: 10px;
                background-color: var(--primary-color);
                color: var(--hover-text-color);
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .dashboard button:hover {
                background-color: var(--hover-bg-color);
            }
        </style>
    </head>
    <body>
        <%
        String ID = (String)session.getAttribute("Id");
        session.setAttribute("userId",ID );
        %>
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

        <!-- Dashboard -->
        <div class="dashboard">
           
            <button onclick="location.href='editcompanylist.jsp'">Edit Information</button>
            <button onclick="location.href='userinformation.jsp'">Create New Profile</button>
            <!--<input type="text" name="id" value="< ID %>" />-->
        </div>

        <!-- Footer -->
        <footer>
            <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
        </footer>
    </body>
</html>