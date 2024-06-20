<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*, java.util.UUID" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%
    
String Id = (String) session.getAttribute("Id");
     
    // If ID is not found in session, try to retrieve it from the request parameter
    if (Id == null || Id.isEmpty()) {
        Id = request.getParameter("ID");
    }
    try { 
   
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");

        String sql = "SELECT * FROM userinformation WHERE Id=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, Id);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            String id = rs.getString("Id");
            String cname = rs.getString("CompanyName");
            String theme = rs.getString("Theme");
            String about = rs.getString("AboutInformation");
            String footer = rs.getString("FooterText");
            String insta = rs.getString("InstaId");
            String no = rs.getString("WhatsappNo");
            String email = rs.getString("Email");
            String maplink = rs.getString("MapLink");
            String add = rs.getString("Address");
            String logo = rs.getString("LogoPath");
            String product1 = rs.getString("Productone");
            String product1Img = rs.getString("Productoneimg");
            String product2 = rs.getString("Producttwo");
            String product2Img = rs.getString("Producttwoimg");
            String product3 = rs.getString("Productthree");
            String product3Img = rs.getString("Productthreeimg");
            String product4 = rs.getString("Productfour");
            String product4Img = rs.getString("Productfourimg");
            String product5 = rs.getString("Productfive");
            String product5Img = rs.getString("Productfiveimg");
            String product6 = rs.getString("Productsix");
            String product6Img = rs.getString("Productsiximg");

            // Generate a unique subdomain identifier using UUID
            String uniqueId = "/Auto_Generate_Website/";
            // Main domain
 String mainDomain = cname;
        String mainDomainWithoutSpaces = mainDomain.replaceAll("\\s+", "");            // Form the unique subdomain link
            String uniqueSubdomainLink = "https:/"+uniqueId+mainDomainWithoutSpaces;
            




    final String username = "internaradhya@gmail.com";
    final String password = "egfspnqdjyrcmyfv";

    // Recipient's email address
    String to = "aradhyabhalerao7@gmail.com";

    // Get values from HTML form
   

    // SMTP server properties
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP server address
    props.put("mail.smtp.port", "587"); // Port for SMTP server

    // Set connection timeout and socket timeout
    props.put("mail.smtp.connectiontimeout", "5000"); // 5 seconds
    props.put("mail.smtp.timeout", "5000"); // 5 seconds

    // Get the Session object
    Session msgsession = Session.getInstance(props,
        new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

    
        // Create a default MimeMessage object
        Message message = new MimeMessage(msgsession);

        // Set From: header field
        message.setFrom(new InternetAddress(username));

        // Set To: header field
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

        // Set Subject: header field
        message.setSubject("Your Website Link");

        // Set email content
        String emailContent = "Your Company's link : " + uniqueSubdomainLink + "\n";
        

        message.setText(emailContent);

        // Send message
        Transport.send(message);

        // Print a success message
 %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page Generator</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style id="theme">
        <% if (theme.equals("theme1")) { %>
:root {
    --primary-color: #FF5F6D;
    --secondary-color: #FFEEDB;
    --hero-bg-color: #121212;
    --content-bg-color: #F0F0F0;
    --footer-bg-color: #333;
}
<% } %>
<%-- Theme 2 --%>
<% if (theme.equals("theme2")) { %>
:root {
    --primary-color: #FF9F1C;
    --secondary-color: #FFF3E1;
    --hero-bg-color: #2EC4B6;
    --content-bg-color: #FFD166;
    --footer-bg-color: #1B262C;
}
<% } %>

<%-- Theme 3 --%>
<% if (theme.equals("theme3")) { %>
:root {
    --primary-color: #8338EC;
    --secondary-color: #FFF3E1;
    --hero-bg-color: #F72585;
    --content-bg-color: #FFD166;
    --footer-bg-color: #7209B7;
}
<% } %>

<%-- Theme 4 --%>
<% if (theme.equals("theme4")) { %>
:root {
    --primary-color: #90E0EF;
    --secondary-color: #2A9D8F;
    --hero-bg-color: #00B4D8;
    --content-bg-color: #F0F0F0;
    --footer-bg-color: #1D3557;
}
<% } %>

<%-- Theme 5 --%>
<% if (theme.equals("theme5")) { %>
:root {
    --primary-color: #7D84B2;
    --secondary-color: #C7CEEA;
    --hero-bg-color: #6B705C;
    --content-bg-color: #EDF6E5;
    --footer-bg-color: #423C6F;
}
<% } %>

<%-- Theme 6 --%>
<% if (theme.equals("theme6")) { %>
:root {
    --primary-color: #F95738;
    --secondary-color: #D8DBE2;
    --hero-bg-color: #5BC0EB;
    --content-bg-color: #F8E9A1;
    --footer-bg-color: #3F51B5;
}
<% } %>

<%-- Theme 7 --%>
<% if (theme.equals("theme7")) { %>
:root {
    --primary-color: #FAC748;
    --secondary-color: #FFD6BA;
    --hero-bg-color: #282B35;
    --content-bg-color: #FF5F6D;
    --footer-bg-color: #FFC93C;
}
<% } %>

<%-- Theme 8 --%>
<% if (theme.equals("theme8")) { %>
:root {
    --primary-color: #8338EC;
    --secondary-color: #E0C3FC;
    --hero-bg-color: #3A86FF;
    --content-bg-color: #D6A2E8;
    --footer-bg-color: #120078;
}
<% } %>

<%-- Theme 9 --%>
<% if (theme.equals("theme9")) { %>
:root {
    --primary-color: #FFA41B;
    --secondary-color: #FFD392;
    --hero-bg-color: #28334AFF;
    --content-bg-color: #D9F0FF;
    --footer-bg-color: #28334AFF;
}
<% } %>

<%-- Theme 10 --%>
<% if (theme.equals("theme10")) { %>
:root {
    --primary-color: #FF5F6D;
    --secondary-color: #FFEEDB;
    --hero-bg-color: #121212;
    --content-bg-color: #F0F0F0;
    --footer-bg-color: #333;
}
<% } %>

        body {
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: var(--primary-color);
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        #showcase {
            background: var(--hero-bg-color) url('img/backk.jpg') no-repeat center center/cover;
            color: #fff;
            background: linear-gradient(to right, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), var(--hero-bg-color) url('img/backk.jpg') no-repeat center center/cover;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease-in-out;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #about, #services, #contact {
            padding: 60px 0;
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            color: #000;
        }
        .section-title {
            font-size: 2.5rem;
            margin-bottom: 30px;
            position: relative;
        }
        .section-title::after {
            content: '';
            width: 100px;
            height: 4px;
            background: var(--primary-color);
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        #contact .social img {
            width: 40px;
            margin: 0 10px;
            transition: transform 0.2s;
        }
        #contact .social img:hover {
            transform: scale(1.1);
        }
        footer {
            background-color: var(--footer-bg-color);
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        .card {
            border: none;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        #showcase .container {
            animation: fadeInUp 1s ease-in-out;
        }
        /* Add animation to cards */
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
        }
        /* Add animation to social icons */
        #contact .social img {
            transition: transform 0.2s ease-in-out;
        }
        #contact .social img:hover {
            transform: scale(1.1);
        }
        /* Define fadeInUp animation */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="<%= logo %>" alt="logo" class="d-inline-block align-top" style="height: 40px;"> <%= cname %></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#showcase">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#services">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <section id="showcase" class="d-flex align-items-center">
        <div class="container text-center">
            <h1>Welcome to <%= cname %></h1>
            <p class="lead">Your one-stop solution for amazing services</p>
            <a href="#about" class="btn btn-primary btn-lg">Learn More</a>
        </div>
    </section>

    <section id="about" class="bg-light">
        <div class="container text-center">
            <h2 class="section-title">About Us</h2>
            <p class="lead"><%= about %></p>
        </div>
    </section>

    <section id="services">
        <div class="container text-center">
            <h2 class="section-title">Our Services</h2>
            <div class="row">
                <!-- Dynamically generated service cards -->
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product1Img %>" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title"><%= product1 %></h5>
                        </div>
                    </div>
                </div>
                        <% if (product2 != null && !product2.isEmpty() && product2Img != null && !product2Img.isEmpty()) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product2Img %>" class="card-img-top" alt="Product 2">
                        <div class="card-body">
                            <h5 class="card-title"><%= product2 %></h5>
                        </div>
                    </div>
                </div>
                         <% } %>
                        <% if (product3 != null && !product3.isEmpty() && product3Img != null && !product3Img.isEmpty()) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product3Img %>" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title"><%= product3 %></h5>
                        </div>
                    </div>
                </div>
                         <% } %>
                        <% if (product4 != null && !product4.isEmpty() && product4Img != null && !product4Img.isEmpty()) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product4Img %>" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title"><%= product4 %></h5>
                        </div>
                    </div>
                </div>
                         <% } %>
                        <% if (product5 != null && !product5.isEmpty() && product5Img != null && !product5Img.isEmpty()) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product5Img %>" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title"><%= product5 %></h5>
                        </div>
                    </div>
                </div>
                 <% } %>
                <% if (product6 != null && !product6.isEmpty() && product6Img != null && !product6Img.isEmpty()) { %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= product6Img %>" class="card-img-top" alt="Product 3">
                        <div class="card-body">
                            <h5 class="card-title"><%= product6 %></h5>
                        </div>
                    </div>
                </div> <% } %>
                 
        </div>
    </section>

    <section id="contact" class="bg-light">
        <div class="container text-center">
            <h2 class="section-title">Contact Us</h2>
            <p>Address: <%= add %></p>
            <div class="social">
                <a href="https://www.instagram.com/<%= insta %>" target="_blank"><img src="img/instagram.png" alt="Instagram"></a>
                <a href="https://wa.me/<%= no %>" target="_blank"><img src="img/whatsapp.png" alt="WhatsApp"></a>
                <a href="https://mail.google.com/mail/?view=cm&fs=1&to=<%= email %>&su=Inquiry" target="_blank"><img src="img/email.png" alt="Email"></a>
                <a href="<%= maplink %>" target="_blank"><img src="img/map.png" alt="Map"></a>
            </div>
        </div>
    </section>

    

    <footer>
        <div class="container">
            <p><%= footer %></p>
            <p >Visit <%= cname %>'s site at: <a href="<%= uniqueSubdomainLink %>" target="_blank"><%= uniqueSubdomainLink %></a></p>
        </div>
    </footer>

    <script>
        const theme = '<%= theme %>';
        const themeStyles = {
            // Theme styles here
        };

        const selectedTheme = themeStyles[theme];
        if (selectedTheme) {
            const root = document.documentElement;
            Object.entries(selectedTheme).forEach(([key, value]) => {
                root.style.setProperty(key, value);
            });
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
        }
        rs.close();
        pst.close();
        con.close();
    } catch(Exception e) {
        out.print(e);
    }

%>

</body>
</html>

