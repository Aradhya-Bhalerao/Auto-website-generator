import java.io.*;
import java.nio.file.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/UpdateCompanyServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateCompanyServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("ID");
        String companyName = request.getParameter("companyName");
        String theme = request.getParameter("theme");
        String about = request.getParameter("about");
        String footerText = request.getParameter("footerText");
        String instagramId = request.getParameter("instagramId");
        String whatsappNo = request.getParameter("whatsappNo");
        String email = request.getParameter("email");
        String mapAddress = request.getParameter("mapAddress");
        String address = request.getParameter("address");

        // Directory to save uploaded files
        String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Save uploaded files and get their paths
        String product1ImgPath = saveFile(request.getPart("product1Img"), uploadDir);
        String product2ImgPath = saveFile(request.getPart("product2Img"), uploadDir);
        String product3ImgPath = saveFile(request.getPart("product3Img"), uploadDir);
        String product4ImgPath = saveFile(request.getPart("product4Img"), uploadDir);
        String product5ImgPath = saveFile(request.getPart("product5Img"), uploadDir);
        String product6ImgPath = saveFile(request.getPart("product6Img"), uploadDir);
        String logoPath = saveFile(request.getPart("logoInput"), uploadDir);

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmedia", "root", "admin");
            
            // Prepare SQL update statement
            PreparedStatement pst = con.prepareStatement("UPDATE userinformation SET CompanyName=?, Theme=?, AboutInformation=?, FooterText=?, InstaId=?, WhatsappNo=?, Email=?, MapLink=?, Address=?, LogoPath=?, Productoneimg=?, Producttwoimg=?, Productthreeimg=?, Productfourimg=?, Productfiveimg=?, Productsiximg=? WHERE Id=?");
            pst.setString(1, companyName);
            pst.setString(2, theme);
            pst.setString(3, about);
            pst.setString(4, footerText);
            pst.setString(5, instagramId);
            pst.setString(6, whatsappNo);
            pst.setString(7, email);
            pst.setString(8, mapAddress);
            pst.setString(9, address);
            pst.setString(10, logoPath);
            pst.setString(11, product1ImgPath);
            pst.setString(12, product2ImgPath);
            pst.setString(13, product3ImgPath);
            pst.setString(14, product4ImgPath);
            pst.setString(15, product5ImgPath);
            pst.setString(16, product6ImgPath);
            pst.setString(17, ID);

            int rowsAffected = pst.executeUpdate();

            pst.close();
            con.close();
            
            response.sendRedirect("generatepage.jsp?ID=" + ID + "&message=Company updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit.jsp?message=" + e.getMessage());
        }
    }

    private String saveFile(Part filePart, String uploadDir) throws IOException {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName.isEmpty()) {
            return null;
        }
        File file = new File(uploadDir, fileName);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        return "uploads/" + fileName;
    }
}
