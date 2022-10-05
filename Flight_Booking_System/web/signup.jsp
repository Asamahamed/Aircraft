<%-- 
    Document   : signup.jsp
    Created on : 5 Oct, 2022, 11:10:36 AM
    Author     : User
--%>

<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
try
{
ResultSet rs =null;
Class.forName("com.mysql.jdbc.Driver");
Connection con=    DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb?zeroDateTimeBehavior=convertToNull","root","");
Statement stmt=con.createStatement();
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String addr=request.getParameter("addr");
String cntno=request.getParameter("cntno");
String email=request.getParameter("email");
String uname=request.getParameter("uname");
String pswd=request.getParameter("pswd");
String role=request.getParameter("role");
stmt.executeUpdate("insert into users (fname,lname,addr,cntno,email,uname,pswd,role) values('"+fname+"','"+lname+"','"+addr+"','"+cntno+"','"+email+"','"+uname+"','"+pswd+"','"+role+"')");
response.sendRedirect("login.html");
con.close();
stmt.close();
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>