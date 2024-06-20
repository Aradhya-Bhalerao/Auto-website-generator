<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-color: #5a2f90; /* Default dark purple */
            --secondary-color: #f0f0f5; /* Default light grey */
            --text-color: #333333; /* Default dark grey */
            --highlight-color: #ffcc00; /* Default yellow */
            --hover-bg-color: #3e1d61; /* Default darker purple */
            --hover-text-color: #ffffff; /* Default white */
            --footer-bg-color: #4b226c; /* Default footer purple */
            --footer-text-color: #ffffff; /* Default footer white */
        }

        /* Theme 1 */
        .theme1 {
            --primary-color: #1a1a1a;
            --secondary-color: #e0e0e0;
            --text-color: #000000;
            --highlight-color: #ff5733;
            --hover-bg-color: #333333;
            --hover-text-color: #ffcc00;
            --footer-bg-color: #1a1a1a;
            --footer-text-color: #ffffff;
        }

        /* Theme 2 */
        .theme2 {
            --primary-color: #003366;
            --secondary-color: #f2f2f2;
            --text-color: #000033;
            --highlight-color: #99ccff;
            --hover-bg-color: #002244;
            --hover-text-color: #ffffff;
            --footer-bg-color: #003366;
            --footer-text-color: #ffffff;
        }
         .theme3 {
                --primary-color: #8338EC;
                --secondary-color : #FFF3E1;
                --navbar-bg-color: #F72585;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #7209B7;
                --footer-text-color: #FFFFFF;
            }
            .theme4 {
                --primary-color: #90E0EF;
                --secondary-color: #2A9D8F;
                --navbar-bg-color: #00B4D8;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #1D3557;
                --footer-text-color: #FFFFFF;
            }
            .theme5 {
                --primary-color: #7D84B2;
                --secondary-color: #C7CEEA;
                --navbar-bg-color: #6B705C;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #423C6F;
                --footer-text-color: #FFFFFF;
            }
            .theme6 {
                --primary-color: #F95738;
                --secondary-color: #D8DBE2;
                --navbar-bg-color: #5BC0EB;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #3F51B5;
                --footer-text-color: #FFFFFF;
            }
            .theme7 {
                --primary-color: #FAC748;
                --secondary-color: #FFD6BA;
                --navbar-bg-color: #282B35;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #FFC93C;
                --footer-text-color: #FFFFFF;
            }
            .theme8 {
                --primary-color: #8338EC;
                --secondary-color: #E0C3FC;
                --navbar-bg-color: #3A86FF;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #120078;
                --footer-text-color: #FFFFFF;
            }
            .theme9 {
                --primary-color: #FFA41B;
                --secondary-color: #FFD392;
                --navbar-bg-color: #28334A;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #28334A;
                --footer-text-color: #FFFFFF;
            }
            .theme10 {
                --primary-color: #FF5F6D;
                --secondary-color: #FFEEDB;
                --navbar-bg-color: #121212;
                --navbar-text-color: #FFFFFF;
                --footer-bg-color: #333;
                --footer-text-color: #FFFFFF;
            }
        /* Add similar blocks for Theme 3 to Theme 10 */

        body {
            font-family: sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
            display: flex;
            flex-direction: column;
        }

        .container {
            margin: 40px;
            margin-top: 5px;
            padding: 10px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        h1 {
            margin: 5px;
        }

        .navbar {
            background-color: var(--primary-color);
            overflow: hidden;
            display: flex;
            align-items: center;
            height: 70px;
            padding: 0 20px;
        }

        #navimg {
            height: 50px;
            width: 150px;
        }

        .navbar a {
            color: var(--highlight-color);
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

        .formpart1 {
            position: absolute;
            left: 30px;
            width: 40%;
        }

        .formpart2 {
            position: absolute;
            right: 30px;
            width: 40%;
        }

        footer {
            background-color: var(--footer-bg-color);
            color: var(--footer-text-color);
            text-align: center;
            padding: 10px;
            position: absolute;
            bottom: -750px;
            width: 100%;
        }

        footer p {
            margin: 0;
        }

        #landingForm {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 800px;
            width: 100%;
            margin: auto;
        }

        #landingForm label {
            width: 48%;
            margin-bottom: 10px;
            font-weight: bolder;
            text-transform: uppercase;
            color: var(--primary-color);
        }

        #landingForm input[type="text"],
        #landingForm input[type="file"],
        #landingForm select,
        #landingForm textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid var(--primary-color);
            border-radius: 5px;
            background-color: whitesmoke;
            color: var(--text-color);
        }

        #landingForm textarea {
            resize: vertical;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: var(--primary-color);
            color: var(--footer-text-color);
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: var(--hover-bg-color);
            color: var(--hover-text-color);
        }

        @media screen and (max-width: 600px) {
            #landingForm label {
                width: 100%;
            }
        }
    </style>
    <script>
        function changeTheme(theme) {
            document.body.className = theme;
        }
    </script>
</head>
 <%
        String userId = (String)session.getAttribute("Id"); //user id
        String ID = (String)session.getAttribute("Id");
        session.setAttribute("Id", userId);
                String id = request.getParameter("Id"); // company  id

        String Id = "", cname = "", theme = "", about = "", footer = "", insta = "", no = "", email = "", maplink = "", add = "", logo = "", product1 = "", product1Img = "", product2 = "", product2Img = "", product3 = "", product3Img = "", product4 = "", product4Img = "", product5 = "", product5Img = "", product6 = "", product6Img = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");
            String sql = "SELECT * FROM userinformation WHERE userId=? AND Id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, userId);
            pst.setString(2, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                Id = rs.getString("Id");
                cname = rs.getString("CompanyName");
                theme = rs.getString("Theme");
                about = rs.getString("AboutInformation");
                footer = rs.getString("FooterText");
                insta = rs.getString("InstaId");
                no = rs.getString("WhatsappNo");
                email = rs.getString("Email");
                maplink = rs.getString("MapLink");
                add = rs.getString("Address");
                logo = rs.getString("LogoPath");
                product1 = rs.getString("Productone");
                product1Img = rs.getString("Productoneimg");
                product2 = rs.getString("Producttwo");
                product2Img = rs.getString("Producttwoimg");
                product3 = rs.getString("Productthree");
                product3Img = rs.getString("Productthreeimg");
                product4 = rs.getString("Productfour");
                product4Img = rs.getString("Productfourimg");
                product5 = rs.getString("Productfive");
                product5Img = rs.getString("Productfiveimg");
                product6 = rs.getString("Productsix");
                product6Img = rs.getString("Productsiximg");
            }
    %>

<body class="<%= theme %>">
   
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

    <center><h1>Create Your Landing Page</h1></center>

    <main class="container">
        <form id="landingForm" action="UpdateCompanyServlet" method="post" enctype="multipart/form-data">
            <div class="formpart1">
                <input type="hidden" id="ID" name="ID" value="<%= ID %>" required>

                <label for="companyName">Company Name:</label>
                <input type="text" id="companyName" name="companyName" readonly value="<%= cname %>" required>

                <label for="theme">Select Theme:</label>
                <select id="theme" name="theme" required onchange="changeTheme(this.value)">
                    <option value="<%= theme %>">Your current theme: <%= theme %></option>
                    <option value="theme1">Theme 1</option>
                    <option value="theme2">Theme 2</option>
                    <option value="theme3">Theme 3</option>
                    <option value="theme4">Theme 4</option>
                    <option value="theme5">Theme 5</option>
                    <option value="theme6">Theme 6</option>
                    <option value="theme7">Theme 7</option>
                    <option value="theme8">Theme 8</option>
                    <option value="theme9">Theme 9</option>
                    <option value="theme10">Theme 10</option>
                </select>

                <label for="about">About Information:</label>
                <textarea id="about" name="about" rows="4" required><%= about %></textarea>

                <label for="product1">Product 1:</label>
                <textarea id="product1" name="product1" rows="4" required><%= product1 %></textarea>
                <label for="product1Img">Upload Product Image:</label>
                <input type="file" id="product1Img" name="product1Img" accept="image/*" required>

                <label for="product2">Product 2:</label>
                <textarea id="product2" name="product2" rows="4" ><%= product2 %></textarea>
                <label for="product2Img">Upload Product Image:</label>
                <input type="file" id="product2Img" name="product2Img" accept="image/*" >

                <label for="product3">Product 3:</label>
                <textarea id="product3" name="product3" rows="4" ><%= product3 %></textarea>
                <label for="product3Img">Upload Product Image:</label>
                <input type="file" id="product3Img" name="product3Img" accept="image/*" >

                <label for="product4">Product 4:</label>
                <textarea id="product4" name="product4" rows="4" ><%= product4 %></textarea>
                <label for="product4Img">Upload Product Image:</label>
                <input type="file" id="product4Img" name="product4Img" accept="image/*" >
            </div>
            <div class="formpart2">
                <label for="product5">Product 5:</label>
                <textarea id="product5" name="product5" rows="4" ><%= product5 %></textarea>
                <label for="product5Img">Upload Product Image:</label>
                <input type="file" id="product5Img" name="product5Img" accept="image/*" >

                <label for="product6">Product 6:</label>
                <textarea id="product6" name="product6" rows="4" ><%= product6 %></textarea>
                <label for="product6Img">Upload Product Image:</label>
                <input type="file" id="product6Img" name="product6Img" accept="image/*" >

                <label for="footerText">Footer Text:</label>
                <input type="text" id="footerText" name="footerText" value="<%= footer %>" required>

                <label for="instagramId">Instagram ID:</label>
                <input type="text" id="instagramId" name="instagramId" value="<%= insta %>" required>

                <label for="whatsappNo">WhatsApp Number:</label>
                <input type="text" id="whatsappNo" name="whatsappNo" value="<%= no %>" required>

                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="<%= email %>" required>

                <label for="mapAddress">Map Address Link:</label>
                <input type="text" id="mapAddress" name="mapAddress" value="<%= maplink %>" required>

                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= add %>" required>

                <label for="logoInput">Upload Logo:</label>
                <input type="file" id="logoInput" name="logoInput" accept="image/*" required>
                <input type="hidden" id="userId" name="userId" value="<%= id %>" required>

                <button type="submit" class="btn">Update Landing Page</button>
            </div>
        </form>
    </main>

    <!-- Footer -->
    <footer>
        <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
    </footer>

    <%
        rs.close();
        pst.close();
        con.close();
        } catch (Exception e) {
            out.print(e);
        }
    %>
</body>
</html>
