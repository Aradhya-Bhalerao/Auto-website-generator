<%-- 
    Document   : userinformationupload
    Created on : Jun 6, 2024, 4:39:56 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
        function showAlert() {
            alert("Data added successfully!");
             window.location.href = "index.html"; 
        }
    </script>
    </head>
    <body>
        <%
             String ID = (String)session.getAttribute("Id");
            session.setAttribute("Id",ID);
            try {
                String cname = request.getParameter("companyName");
                String theme = request.getParameter("theme");
                String about = request.getParameter("about");
                String productone = request.getParameter("product1");
                String p1img = request.getParameter("p1");
                String producttwo = request.getParameter("product2");
                String p2img = request.getParameter("p2");
                String productthree = request.getParameter("product3");
                String p3img = request.getParameter("p3");
                String productfour = request.getParameter("product4");
                String p4img = request.getParameter("p4");
                String productfive = request.getParameter("product5");
                String p5img = request.getParameter("p5");
                String productsix = request.getParameter("product6");
                String p6img = request.getParameter("p6");
                String footer = request.getParameter("footerText");
                String insta = request.getParameter("instagramId");
                String whatsapp = request.getParameter("whatsappNo");
                String email = request.getParameter("email");
                String mapaddress = request.getParameter("mapAddress");
                String add = request.getParameter("address");
                String logo = request.getParameter("logoInput");
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");
                
                String sql = "INSERT INTO userinformation (CompanyName, Theme, AboutInformation, Productone,Productoneimg,Producttwo,Producttwoimg , Productthree,Productthreeimg,Productfour,Productfive,Productfiveimg,Productsix,Productsiximg,Productfourimg,FooterText, InstaId, WhatsappNo, Email, MapLink, Address, LogoPath, userId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                
                ps.setString(1, cname);
                ps.setString(2, theme);
                ps.setString(3, about);
                ps.setString(4, productone);
                ps.setString(5, p1img);
                ps.setString(6, producttwo);
                ps.setString(7, p2img);
                ps.setString(8, productthree);
                ps.setString(9, p3img);
                ps.setString(10, productfour);
                ps.setString(11, p4img);
                ps.setString(12, productfive);
                ps.setString(13, p5img);
                ps.setString(14, productsix);
                ps.setString(15, p6img);
                ps.setString(16, footer);
                ps.setString(17, insta);
                ps.setString(18, whatsapp);
                ps.setString(19, email);
                ps.setString(20, mapaddress);
                ps.setString(21, add);
                ps.setString(22, logo);
                ps.setString(23, ID);
                
                ps.executeUpdate();
                  out.println("<script>");
    out.println("showAlert();");
    out.println("</script>");
                ps.close();
                con.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

