<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Invalidate the session to logout the user
    session.invalidate();
    // Redirect to login page or home page
    response.sendRedirect("login.jsp"); // or "index.jsp" depending on your application structure
%>
