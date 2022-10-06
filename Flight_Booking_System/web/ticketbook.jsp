<%-- 
    Document   : ticket
    Created on : 6 Oct, 2022, 8:53:12 PM
    Author     : User
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        
        <%
       try {    
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb?zeroDateTimeBehavior=convertToNull","root","");
           Statement st1 = con.createStatement();
           
        String fid  = request.getParameter("id");    
        String tfrom = request.getParameter("frome");
        String tto  = request.getParameter("to");
        String tdtime = request.getParameter("dtime");
        String tatime  = request.getParameter("atime");
        String taircraft = request.getParameter("frome");
   
      String str1 = "INSERT INTO ticket(fid,taircraft,tatime,tdtime,tfrom,tto) value('"+fid+"','"+taircraft+"','"+tatime+"','"+tdtime+"','"+tfrom+"','"+tto+"')" ;
      st1.executeUpdate(str1);

        
%> 
        
        <form action="ticket.jsp" method="POST">
            
               <input type="text" name="id" value="<%request.getParameter("id");%>"/>
               <input type="text" name="from" value="<%request.getParameter("frome");%>"/>
               <input type="text" name="to" value="<%request.getParameter("to");%>"/>
               <input type="text" name="dpart" value="<%request.getParameter("dtime");%>"/>
               <input type="text" name="arrive" value="<%request.getParameter("atime");%>"/>
               <input type="text" name="aircraft" value="<%request.getParameter("aircraft");%>"/>
            <select id="class" name="class" class="box flex-item" required>
               <option value="1c">1st class</option>
               <option value="2c">2nd class</option>
               <option value="3c">3rd class</option>
            </select> 
            <br>
            Enter username : <input type="text" name="uname" value="" />
            Enter Passport ID : <input type="text" name="passid" value="" />
            <input type="submit" value="View Ticket" />
        </form>
        
        
          <%     
           
           
            }
           catch (Exception e) {
               
           }
        
        
        
        %>
    </body>
</html>
