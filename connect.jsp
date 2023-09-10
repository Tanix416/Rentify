<%@ page import="java.sql.*" %>
<%
Connection con = null;
 %>

<%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://demo.crbb8jgdkq2e.eu-north-1.rds.amazonaws.com:3306/Rentify","admin","12345678");
%>