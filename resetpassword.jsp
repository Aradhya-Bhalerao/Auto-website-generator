<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Password Reset</title>
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
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Light background with opacity */
            padding: 20px;
            border: 2px solid black;
            border-style: outset;
            border-radius: 20px;
            width: 30%;
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            margin: 80px auto;
        }
        .heading {
            font-size: 25px;
            font-weight: 600;
            margin-top: 1rem;
            text-align: center;
            letter-spacing: 1px;
        }
        .inputbox {
            margin-top: 2rem;
        }
        .inputbox label {
            font-size: 20px;
            font-weight: 500;
            display: block;
            text-align: left;
            letter-spacing: 1.5px;
        }
        .inputbox input {
            font-size: 20px;
            outline: none;
            border: 2px solid #000000;
            background: transparent;
            margin-top: 10px;
            width: 100%;
            padding: 8px;
            letter-spacing: 1.5px;
            font-weight: 600;
            box-sizing: border-box;
            border-radius: 5px;
        }
        .btn {
            color: black;
            background: transparent;
            border: 2px solid black;
            width: 100%;
            height: 35px;
            border-radius: 30px;
            font-size: 1rem;
            letter-spacing: 2px;
            margin-top: 15px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: black;
            letter-spacing: 4px;
            color: #ffffff;
        }
        .btn:active {
            transform: scale(0.8);
        }
        .message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: green;
        }
        .error-message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: red;
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
        <div id="error-message" class="error-message" style="display:none;">Invalid email. Please try again.</div>
        <div id="success-message" class="message" style="display:none;">Password reset link sent successfully.</div>
        <form action="resetpassword_process.jsp" method="post" onsubmit="return validateForm()">
            <div class="heading">Reset Password</div>
            <div class="inputbox">
                <label for="email">Enter your Email</label>
                <input type="email" name="email" id="email" required/>
            </div>
            <div style="text-align:center; justify-content: center; display: flex;">
                <input class="btn" type="submit" value="Reset Password" />
            </div>
        </form>
        <a href="login.html" style="text-decoration: none; display: block; text-align: center; margin-top: 10px; font-weight: bold; color: #5a2f90;">Back to Login</a>
    </div>
 <footer>
        <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
    </footer>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value;

            // Basic email validation
            if (email.trim() === '' || !isValidEmail(email)) {
                document.getElementById('error-message').style.display = 'block';
                return false;
            }
            return true;
        }

        function isValidEmail(email) {
            // Basic email validation using regex
            var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }
    </script>
</body>
</html>
