
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>


<%
    boolean check = false;
    // Check if the user is already logged in
//                if (session.getAttribute("isLoggedIn") != null && session.getAttribute("isLoggedIn").toString().equals("Yes")) {
//                    // If the user is already logged in, redirect to the admin dashboard
//                   
//
//                } else {
    // If not logged in, proceed with the login process
    try {
        String user = request.getParameter("email");
        String pass = request.getParameter("password");

        // Only proceed with database operations if both username and password are provided
        if (user != null && pass != null) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");

            String sql = "SELECT * FROM adminlogin WHERE Email_Id = ? AND Password = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                check = true;
                // If login is successful, set isLoggedIn attribute to "Yes" and redirect to admin dashboard
                session.setAttribute("isLoggedIn", "Yes");
            } else {
                // Credentials are incorrect, redirect back to adminlogin.html
        response.sendRedirect("adminlogin.html?error=loginFailed");
            }
            con.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
//                    }
    String loginstatus = (String) session.getAttribute("isLoggedIn");

    if (loginstatus == "Yes") {
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

        <title>Admin Panel</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                 font-family: sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
           
            box-sizing: border-box;
                margin: 0;
                padding: 0;
                height: 100vh;
                background-size: cover;
                background-attachment: fixed;
            }
            
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
           
        }

        
        /* Navbar styles */
        .navbar {
            background-color: darkcyan;
            overflow: hidden;
            display: flex;
            align-items: center; /* Center vertically */
            height: 70px;
            padding: 0 20px;
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
            position: absolute;
            width: 100%;
            bottom: 0;
                       

        }

        footer p {
            margin: 0;
        }
            .link-btns{
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                align-items: center;
                margin-top: 20px;
                width: 30%;
            }

            .link-btn{
                border : 1px solid black;
                border-radius: 15px;
                background-color: greenyellow;
                padding: 15px;
                text-decoration: none;
            }
            
            .container {
                display: flex;
                flex-direction: column;
                border: 2px solid black;
                border-style: outset;
                border-radius: 20px;
                /*                height: 350px;*/
                width: 30%;
                margin: 100px auto;
                box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            }
            .heading {
                font-size: 35px;
                font-weight: 600;
                margin-top: 1rem;
                text-align: center;
                letter-spacing: 1px;
                padding: 20px;

            }
            .box {
                margin-top: 2rem;
            }
            .inputbox {
                border-bottom: 2px solid #000000;
                margin: 10px 75px 25px 40px;
            }
            .inputbox label {
                font-size: 20px;
                font-weight: 500;
                display:block;
                text-align: left;
                letter-spacing: 1.5px;

            }
            .inputbox input{
                font-size: 20px;
                outline: none;
                border: none;
                background: transparent;
                margin-top: 10px;
                width: 100%;
                letter-spacing: 1.5px;
                font-weight: 600;
            }
            .btn {
                color: black;
                background: transparent;
                margin-left: 35%;
                border: 2px solid black;
                width: 30%;
                height: 35px;
                border-radius: 30px;
                font-size: 1rem;
                letter-spacing: 2px;

            }
            .btn:hover {
                background-color: black;
                letter-spacing: 4px;
                color: #ffffff;
            }
            .btn:active {
                transform: scale(0.8);
            } 
           footer {
                background-color: darkcyan;
                color: var(--footer-text-color);
                text-align: center;
                padding: 10px;
                position: fixed;
                width: 100%;
                bottom: 0;
            }

            footer p {
                margin: 0;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: fixed; 
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                z-index: 2;
                margin-top: 15px;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #5a2f90;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
            body {
                font-family: Arial, sans-serif;
            }
            .tab {
                display: none;
            }
            .tab.active {
                display: block;
            }
            .tab-content {
                padding: 20px;
                padding-top:10px !important;

                border: 1px solid #ccc;
                border-top: none;
                text-align: center;
                align-items: center;

            }
            .tabs {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }
            .tab-link {
                float: left;
                border-right: 1px solid #ccc;
                background-color: inherit;
                padding: 10px 20px;
                text-decoration: none;
                color: black;
            }
            .tab-link:last-child {
                border-right: none;
            }
            .tab-link:hover {
                background-color: #ddd;
            }
            .tab-link.active {
                background-color: white;
                border-bottom: 1px solid white;
            }
            ul {
                list-style: none;
                padding: 0;
            }
            ul li {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
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

        <div style="display:flex; flex-direction: column;">

            <div class="heading">Admin Dashboard</div>

            <div class="tabs">
                <a href="#" class="tab-link active" onclick="openTab(event, 'doctors')">Users</a>
                <!--<a href="#" class="tab-link" onclick="openTab(event, 'receptionists')">User Details</a>-->
                <!--<a href="#" class="tab-link" onclick="openTab(event, 'patients')">Users Information</a>-->

            </div>

            <div id="doctors" class="tab active">
                <div class="tab-content">
                    <h1>Users</h1>
                    <div style="width:100%; align-items: center; justify-content: center; text-align:center; display:flex;">

                        <ul class="link-btns">
                            <li><a href="paiduser.jsp" class="link-btn">Paid Users</a></li>
                            <li><a href="unpaiduser.jsp" class="link-btn">Unpaid Users</a></li>
                        </ul>
                    </div>

                </div>
            </div>

<!--            <div id="receptionists" class="tab">
                <div class="tab-content">
                    <h1>Receptionist</h1>
                    <div style="width:100%; align-items: center; justify-content: center; text-align:center; display:flex;">

                        <ul class="link-btns">
                            <li><a href="addNewReceptionist.jsp" class="link-btn">Add New Receptionist</a></li>
                            <li><a href="viewReceptionist.jsp" class="link-btn">View Receptionist</a></li>
                        </ul>
                    </div>
                </div>
            </div>-->

            
        </div>

       
<footer>
            <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
        </footer>

        <script>

            function openTab(evt, tabName) {

                var tabcontent = document.getElementsByClassName("tab");
                for (var i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }

                // Get all elements with class "tab-link" and remove the "active" class
                var tablinks = document.getElementsByClassName("tab-link");
                for (var i = 0; i < tablinks.length; i++) {
                    tablinks[i].classList.remove("active");
                }

                // Show the selected tab content and mark its link as active
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.classList.add("active");
            }

        </script>


<%
    } else {
        response.sendRedirect("adminlogin.html?error=loginFailed");
         return; 
    }
%>
        <!-- Footer -->
        
    </body>
</html>
