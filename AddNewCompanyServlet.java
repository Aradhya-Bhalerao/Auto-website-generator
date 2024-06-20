import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddNewCompanyServlet")
@MultipartConfig
public class AddNewCompanyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Establishing database connection
            String url = "jdbc:mysql://localhost:3306/webmedia";
            String user = "root";
            String pass = "admin";

            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated to use the new MySQL driver class

            // Establish the connection
            connection = DriverManager.getConnection(url, user, pass);

            // Getting form data
            String cname = request.getParameter("companyName");
            String theme = request.getParameter("theme");
            String about = request.getParameter("about");
            String services = request.getParameter("services");
            String footer = request.getParameter("footerText");
            String insta = request.getParameter("instagramId");
            String whatsapp = request.getParameter("whatsappNo");
            String email = request.getParameter("email");
            String mapaddress = request.getParameter("mapAddress");
            String add = request.getParameter("address");
            String userId = request.getParameter("userId");

            // Handling file upload for logo
            String logoPath = saveFile(request.getPart("logoInput"), getServletContext().getRealPath("") + File.separator + "uploads");

            // Handling file upload for products
            String product1 = request.getParameter("product1");
            String product1Img = saveFileIfNotNull(request.getPart("p1"), getServletContext().getRealPath("") + File.separator + "uploads");
            String product2 = request.getParameter("product2");
            String product2Img = saveFileIfNotNull(request.getPart("p2"), getServletContext().getRealPath("") + File.separator + "uploads");
            String product3 = request.getParameter("product3");
            String product3Img = saveFileIfNotNull(request.getPart("p3"), getServletContext().getRealPath("") + File.separator + "uploads");
            String product4 = request.getParameter("product4");
            String product4Img = saveFileIfNotNull(request.getPart("p4"), getServletContext().getRealPath("") + File.separator + "uploads");
            String product5 = request.getParameter("product5");
            String product5Img = saveFileIfNotNull(request.getPart("p5"), getServletContext().getRealPath("") + File.separator + "uploads");
            String product6 = request.getParameter("product6");
            String product6Img = saveFileIfNotNull(request.getPart("p6"), getServletContext().getRealPath("") + File.separator + "uploads");

            // Inserting data into the database
            String query = "INSERT INTO userinformation (CompanyName, Theme, AboutInformation, FooterText, InstaId, WhatsappNo, Email, MapLink, Address, LogoPath, Productone, Productoneimg, Producttwo, Producttwoimg, Productthree, Productthreeimg, Productfour, Productfourimg, Productfive, Productfiveimg, Productsix, Productsiximg, userId ) VALUES (?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            statement = connection.prepareStatement(query);
            statement.setString(1, cname);
            statement.setString(2, theme);
            statement.setString(3, about);
            statement.setString(4, footer);
            statement.setString(5, insta);
            statement.setString(6, whatsapp);
            statement.setString(7, email);
            statement.setString(8, mapaddress);
            statement.setString(9, add);
            statement.setString(10, logoPath);
            statement.setString(11, product1);
            statement.setString(12, product1Img);
            statement.setString(13, product2);
            statement.setString(14, product2Img);
            statement.setString(15, product3);
            statement.setString(16, product3Img);
            statement.setString(17, product4);
            statement.setString(18, product4Img);
            statement.setString(19, product5);
            statement.setString(20, product5Img);
            statement.setString(21, product6);
            statement.setString(22, product6Img);
            statement.setString(23, userId);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("userinformation.jsp?message=New company & information added successfully!");
            } else {
                response.sendRedirect("userinformation.jsp?message=Failed to add information.");
            }
        } catch (ClassNotFoundException | SQLException | IOException e) {
            response.sendRedirect("userinformation.jsp?message=" + e.getMessage());
        } finally {
            // Closing resources
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                response.getWriter().println("Error: " + e.getMessage());
            }
        }
    }

    private String saveFile(Part filePart, String uploadDir) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String fileName = filePart.getSubmittedFileName();
        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdir();
        }

        String savePath = uploadDir + File.separator + fileName;
        File saveFile = new File(savePath);
        try (InputStream input = filePart.getInputStream(); OutputStream output = new FileOutputStream(saveFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }
        return "uploads/" + fileName;
    }

    private String saveFileIfNotNull(Part filePart, String uploadDir) throws IOException {
        return filePart != null && filePart.getSize() > 0 ? saveFile(filePart, uploadDir) : null;
    }
}
