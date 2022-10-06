<%-- 
    Document   : passenger
    Created on : 6 Oct, 2022, 2:32:52 PM
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
        <link rel="stylesheet"  href="css/passenger.css">
    </head>
    <body>
      
        
        <div>
             <div class="lside">    
         <form  action="passenger.jsp" method="POST">
            <table class="container" >
                <tbody>
                    <tr>
                        <td style="font-size: 20px">From<input style="font-size: 20px" class="container" type="text" name="frome" value="" /> </td>
                        <td style="font-size: 20px">To :<input style="font-size: 20px" class="container" type="text" name="to" value="" /> </td>
                        <td style="font-size: 20px"><input style="font-size: 20px" class="submit1" type="submit" value="Filter" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
            </div>
             
            <div class="">    
          <table  >
               
                <tr>
                    <th>ID</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Aircraft</th>
                    <th>Status</th>
                </tr>
               
        <%
          
            
           try {    
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb?zeroDateTimeBehavior=convertToNull","root","");
           Statement st = con.createStatement();
           
           String fromd = request.getParameter("frome");
           String tod  = request.getParameter("to");
           
           String str = "select * from flight where fromd='"+fromd+"' and tod='"+tod+"'" ;
           ResultSet rs = st.executeQuery(str);
           while(rs.next()){
           %>
            
           <br> 
            <tr>
                <form action="ticketbook.jsp" method="POST">
                    <td><input type="text" name="id" value="<%=rs.getInt("id")%>" /></td>
                    <td><input type="text" name="from" value="<%=rs.getString("fromd")%>" /></td>
                    <td><input type="text" name="to" value="<%=rs.getString("tod")%>" /></td>
                    <td><input type="text" name="dpart" value="<%=rs.getDate("dtime")%>" /></td>
                    <td><input type="text" name="arrive" value="<%=rs.getDate("atime")%>" /></td>
                    <td><input type="text" name="aircraft" value="<%=rs.getString("aircraft")%>" /></td>
                    <td><input class="submit" type="submit" value="Book" /></td>
                 </form> 
             </tr>
            
        </table>
            </div>            
    </div>             
                    <% }    
           
           
            }
           catch (Exception e) {
               
           }
        
        
        
        %>
       
            
  
       
    </body>
</html>
