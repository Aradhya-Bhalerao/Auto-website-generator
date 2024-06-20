<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-color: #5a2f90; /* Default theme */
            --secondary-color: #f0f0f5;
            --text-color: #333333;
            --highlight-color: #ffcc00;
            --hover-bg-color: #3e1d61;
            --hover-text-color: #ffffff;
            --footer-bg-color: #4b226c;
            --footer-text-color: #ffffff;
            --navbar-bg-color: darkcyan;
            --navbar-text-color: white;
        }

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
            background-color: var(--navbar-bg-color);
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
            color: var(--navbar-text-color);
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
            color: var(--footer-bg-color);
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
          .required-star {
            color: red;
            margin-left: 5px;
        }

        @media screen and (max-width: 600px) {
            #landingForm label {
                width: 100%;
            }
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
    <center><h1>Create Your Landing Page</h1></center>

    <main class="container">
        <form id="landingForm" action="AddNewCompanyServlet" method="post" enctype="multipart/form-data">
            <div class="formpart1">
                <label for="companyName">Company Name:<span class="required-star">*</span></label>
                <input type="text" id="companyName" name="companyName" required>

                <label for="theme">Select Theme:<span class="required-star">*</span></label>
                <select id="theme" name="theme" required onchange="changeTheme(this.value)">
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

                <label for="about">About Information:<span class="required-star">*</span></label>
                <textarea id="about" name="about" rows="4" required></textarea>

                <label for="services">Product 1<span class="required-star">*</span></label>
                <textarea id="services" name="product1" rows="4" required></textarea>
                <label for="logoInput1">Upload Product Image:<span class="required-star">*</span></label>
                <input type="file" id="logoInput1" name="p1" accept="image/*" required>

                <label for="services">Product 2</label>
                <textarea id="services" name="product2" rows="4" ></textarea>
                <label for="logoInput2">Upload Product Image:</label>
                <input type="file" id="logoInput2" name="p2" accept="image/*" >

                <label for="services">Product 3</label>
                <textarea id="services" name="product3" rows="4" ></textarea>
                <label for="logoInput3">Upload Product Image:</label>
                <input type="file" id="logoInput3" name="p3" accept="image/*" >

                <label for="services">Product 4</label>
                <textarea id="services" name="product4" rows="4" ></textarea>
                <label for="logoInput4">Upload Product Image:</label>
                <input type="file" id="logoInput4" name="p4" accept="image/*" >
            </div>
            <div class="formpart2">
                <label for="services">Product 5</label>
                <textarea id="services" name="product5" rows="4" ></textarea>
                <label for="logoInput5">Upload Product Image:</label>
                <input type="file" id="logoInput5" name="p5" accept="image/*" >

                <label for="services">Product 6</label>
                <textarea id="services" name="product6" rows="4" ></textarea>
                <label for="logoInput6">Upload Product Image:</label>
                <input type="file" id="logoInput6" name="p6" accept="image/*" >

                <label for="footerText">Footer Text:<span class="required-star">*</span></label>
                <input type="text" id="footerText" name="footerText" required>

               
                <label for="instagramId">Instagram ID:<span class="required-star">*</span></label>
                <input type="text" id="instagramId" name="instagramId" required>

                <label for="whatsappNo">WhatsApp Number:<span class="required-star">*</span></label>
                <input type="text" id="whatsappNo" name="whatsappNo" required>
                
                 <label for="email">Email:<span class="required-star">*</span></label>
                <input type="text" id="email" name="email" required>

                <label for="mapAddress">Map Address Link:<span class="required-star">*</span></label>
                <input type="text" id="mapAddress" name="mapAddress" required>

                <label for="address">Address:<span class="required-star">*</span></label>
                <input type="text" id="address" name="address" required>

                <label for="logoInput">Upload Logo:<span class="required-star">*</span></label>
                <input type="file" id="logoInput" name="logoInput" accept="image/*" required>
                <%  String userId = (String)session.getAttribute("Id"); 
                
                %>                
                <input type="hidden" id="address" name="userId" value="<%= userId%>" required>

                <button type="submit" class="btn">Generate Landing Page</button>
            </div>
        </form>
    </main>

    <footer>
        <p>© 2024 JK Innovative Amravati. All Rights Reserved.</p>
    </footer>

    <script>
        const themes = {
            theme1: {
                "--primary-color": "#FF5F6D",
                "--secondary-color": "#FFEEDB",
                "--navbar-bg-color": "#121212",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#333",
                "--footer-text-color": "#FFFFFF"
            },
            theme2: {
                "--primary-color": "#FF9F1C",
                "--secondary-color": "#FFF3E1",
                "--navbar-bg-color": "#2EC4B6",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#1B262C",
                "--footer-text-color": "#FFFFFF"
            },
            theme3: {
                "--primary-color": "#8338EC",
                "--secondary-color": "#FFF3E1",
                "--navbar-bg-color": "#F72585",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#7209B7",
                "--footer-text-color": "#FFFFFF"
            },
            theme4: {
                "--primary-color": "#90E0EF",
                "--secondary-color": "#2A9D8F",
                "--navbar-bg-color": "#00B4D8",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#1D3557",
                "--footer-text-color": "#FFFFFF"
            },
            theme5: {
                "--primary-color": "#7D84B2",
                "--secondary-color": "#C7CEEA",
                "--navbar-bg-color": "#6B705C",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#423C6F",
                "--footer-text-color": "#FFFFFF"
            },
            theme6: {
                "--primary-color": "#F95738",
                "--secondary-color": "#D8DBE2",
                "--navbar-bg-color": "#5BC0EB",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#3F51B5",
                "--footer-text-color": "#FFFFFF"
            },
            theme7: {
                "--primary-color": "#FAC748",
                "--secondary-color": "#FFD6BA",
                "--navbar-bg-color": "#282B35",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#FFC93C",
                "--footer-text-color": "#FFFFFF"
            },
            theme8: {
                "--primary-color": "#8338EC",
                "--secondary-color": "#E0C3FC",
                "--navbar-bg-color": "#3A86FF",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#120078",
                "--footer-text-color": "#FFFFFF"
            },
            theme9: {
                "--primary-color": "#FFA41B",
                "--secondary-color": "#FFD392",
                "--navbar-bg-color": "#28334A",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#28334A",
                "--footer-text-color": "#FFFFFF"
            },
            theme10: {
                "--primary-color": "#FF5F6D",
                "--secondary-color": "#FFEEDB",
                "--navbar-bg-color": "#121212",
                "--navbar-text-color": "#FFFFFF",
                "--footer-bg-color": "#333",
                "--footer-text-color": "#FFFFFF"
            }
        };

        function changeTheme(theme) {
            const root = document.documentElement;
            const themeStyles = themes[theme];
            for (let style in themeStyles) {
                root.style.setProperty(style, themeStyles[style]);
            }
        }
    </script>
</body>
</html>
