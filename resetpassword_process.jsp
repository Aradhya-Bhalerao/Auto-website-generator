<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random, javax.mail.*, javax.mail.internet.*, java.sql.*, java.util.Properties, javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Password Reset Processing</title>
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
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border: 2px solid black;
            border-style: outset;
            border-radius: 20px;
            width: 30%;
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            margin: 90px auto;
        }
        .heading {
            font-size: 25px;
            font-weight: 600;
            margin-top: 1rem;
            text-align: center;
            letter-spacing: 1px;
        }
        .message, .error-message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
        .message { color: green; }
        .error-message { color: red; }
        .back-link {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: #5a2f90;
            text-decoration: none;
            display: block;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input {
            padding: 10px;
            margin: 5px;
            width: 80%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #5a2f90;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #3a1c5b;
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
    <div class="container">
        <% 
            String email = request.getParameter("email");
            String enteredVerificationCode = request.getParameter("verification_code");
            String newPassword = request.getParameter("new_password");
            HttpSession session1 = request.getSession();

            if (email != null && enteredVerificationCode != null && newPassword != null) {
                String storedVerificationCode = (String) session1.getAttribute("verificationCode");
                if (enteredVerificationCode.equals(storedVerificationCode)) {
                    boolean passwordUpdated = updatePasswordInDatabase(email, newPassword);
                    if (passwordUpdated) {
                        session1.removeAttribute("verificationCode");
        %>
                        <div class="message">Password updated successfully for <%= email %>!</div>
        <% 
                    } else {
        %>
                        <div class="error-message">Failed to update password. Please try again.</div>
        <% 
                    }
                } else {
        %>
                    <div class="error-message">Invalid verification code. Please check and try again.</div>
        <% 
                }
            } else if (email != null) {
                String verificationCode = generateVerificationCode();
                session1.setAttribute("verificationCode", verificationCode);
                sendVerificationCode(email, verificationCode);
        %>
                <div class="message">Verification code sent to <%= email %>. Please check your email and enter the verification code below.</div>
                <form method="post" action="">
                    <input type="hidden" name="email" value="<%= email %>">
                    <input type="text" name="verification_code" placeholder="Enter verification code" required>
                    <input type="password" name="new_password" placeholder="Enter new password" required>
                    <button type="submit">Reset Password</button>
                </form>
        <% 
            } else {
        %>
                <form method="post" action="">
                    <input type="text" name="email" placeholder="Enter your email" required>
                    <button type="submit">Send Verification Code</button>
                </form>
        <% 
            }
        %>
        <a href="login.html" class="back-link">Back to Login</a>
    </div>

    <%-- Utility methods --%>
    <%! 
        boolean updatePasswordInDatabase(String email, String newPassword) {
            boolean passwordUpdated = false;
            try {
                String url = "jdbc:mysql://localhost:3306/webmedia";
                String dbUsername = "root";
                String dbPassword = "admin";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
                String sql = "UPDATE userreg SET password=? WHERE email_id=?";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, email);
                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    passwordUpdated = true;
                }
                pstmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return passwordUpdated;
        }

        void sendVerificationCode(String email, String verificationCode) {
            String host = "smtp.gmail.com";
            String port = "587";
            String username = "internaradhya@gmail.com";
            String password = "egfspnqdjyrcmyfv";
            
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("Password Reset Verification Code");
                message.setText("Your verification code is: " + verificationCode);
                Transport.send(message);
                System.out.println("Verification code email sent to " + email);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }

        String generateVerificationCode() {
            String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            int length = 6;
            Random random = new Random();
            StringBuilder sb = new StringBuilder(length);
            for (int i = 0; i < length; i++) {
                sb.append(chars.charAt(random.nextInt(chars.length())));
            }
            return sb.toString();
        }
    %>
     <footer>
        <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
    </footer>
</body>
</html>
