<%@page import="jdbConnect.dbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<%
String uname = request.getParameter("uname");
String pswd = request.getParameter("pswd");
String role = request.getParameter("role");

dbConnection.DConnect();
String selectquery1 = "select * from signup where uname='" + uname + "' and pswd='" + pswd + "' and role='ps'" ;
String selectquery2 = "select * from signup where uname='" + uname + "' and pswd='" + pswd + "' and role='admin'" ;
String selectquery3 = "select * from signup where uname='" + uname + "' and pswd='" + pswd + "' and role='sg1'" ;
String selectquery4 = "select * from signup where uname='" + uname + "' and pswd='" + pswd + "' and role='sg2'" ;
dbConnection.rslt1 = dbConnection.stmt1.executeQuery(selectquery1);
dbConnection.rslt2 = dbConnection.stmt2.executeQuery(selectquery2);
dbConnection.rslt3 = dbConnection.stmt3.executeQuery(selectquery3);
dbConnection.rslt4 = dbConnection.stmt4.executeQuery(selectquery4);
if (dbConnection.rslt1.next()) {
%>
<script>
alert("Welcome to pheonix Airline");
window.location.href="home.html";
</script>

<%} else if (dbConnection.rslt2.next()) {%>
<script>
alert("welcome admin");
window.location.href="admin.html";
</script>

<%} else if (dbConnection.rslt3.next()) {%>
<script>
alert("welcome staff 1");
window.location.href="staff1.html";
</script>

<%} else if (dbConnection.rslt4.next()) {%>
<script>
alert("welcome staff 2");
window.location.href="staff2.html";
</script>


<%} else {%>
<script>
alert("No Record Found, Try again");
window.location.href="signup.html";
</script>
<%}%>