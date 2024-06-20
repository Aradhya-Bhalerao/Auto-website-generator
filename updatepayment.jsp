<%-- 
    Document   : updatepayment
    Created on : Jun 8, 2024, 4:25:21 PM
    Author     : LENOVO
--%>

<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
           <%  try{
               String Id = (String) session.getAttribute("Id");
            session.setAttribute("Id",Id);
               
               String startDate = request.getParameter("startDate");
               String cname = request.getParameter("companyName");
String price = request.getParameter("price");
String endDate = request.getParameter("expiringDate");
String paymentStatus = "Paid";
        Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");

        String updateSql = "UPDATE userinformation SET AmountPaid = ?, Payment = ?, StartDate = ?, EndDate = ? WHERE Id = ?";
    PreparedStatement updatePst = con.prepareStatement(updateSql);
    updatePst.setString(1, price);
    updatePst.setString(2, paymentStatus);
    updatePst.setString(3, startDate);
    updatePst.setString(4, endDate);
    updatePst.setString(5, Id);
    updatePst.executeUpdate();
     


    final String username = "internaradhya@gmail.com";
    final String password = "egfspnqdjyrcmyfv";

    // Recipient's email address
    String to = "internaradhya@gmail.com";

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
        message.setSubject("Your Website Details");

        // Set email content
        String emailContent = "Company name : " + cname + "\n";
        emailContent += "Service starting date : " + startDate + "\n";
        emailContent += "Service ending date : " + endDate + "\n";
        emailContent += "Charges Paid : " + price + " Rs\n";

        message.setText(emailContent);

        // Send message
        Transport.send(message);

        // Print a success message
   response.sendRedirect("generatepage.jsp?success=true");
     
    } catch (Exception e) {
        // Print any errors
        out.print(e);
    }
    %>
    </body>
</html>
