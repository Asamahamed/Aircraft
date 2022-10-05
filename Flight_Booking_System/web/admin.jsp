<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<Html>     
 
<h1>Pending Staff Details </h1>

 <div>
<%--table style --%>
  <style>
table, td, th {
  border: 1px solid black;
}

table {

  width: 50%;
}

td {
  text-align: left;
}
</style>
 
 </div>

 <%-- ------------------------------------------------------------------------------ --%> 
 
 
<table >
            <tr>
             
                <th>Staff Id</th>
                <th>Staff name</th>
                <th>Staff Gmail</th>
                <th>Staff Role</th>
            </tr>
          
            
     <%-- view all data from user table --%>
                   <% 
  
            try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aircraftdb","root","");
           Statement st=con.createStatement();
           String str="select id,uname,email,role from user ";
           ResultSet rs=st.executeQuery(str);
           while(rs.next())
           {
             %>
             
             
               <%--  need data shows --%> 
           
             <tr>
                 
                 <td><%=rs.getString("id")%></td>
                 <td><%=rs.getString("uname")%></td>
                  <td><%=rs.getString("email")%></td> 
                  <td><%=rs.getString("role")%></td> 
             </tr>
            
             <% }

         } catch (Exception e)
            {
            
            
            }  
            
            
            %>
       
        
           </table>
        
         <%-- ------------------------------------------------------------------------------ --%>
    
<%--  Staff Record added  --%>


<%
    if(request.getParameter("submit")!=null) {
try
{
ResultSet rs =null;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aircraftdb","root","");
Statement stmt=con.createStatement();
String sname=request.getParameter("name");
String sgmail=request.getParameter("gmail");
String sid=request.getParameter("id");
String sgrade=request.getParameter("grade");

stmt.executeUpdate("insert into staffadd (name,gmail,id,grade) values('"+sname+"','"+sgmail+"','"+sid+"','"+sgrade+"')");
response.sendRedirect("admin.jsp");
con.close();
stmt.close();
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} 
    }  %>
    
    

      

 <%-- form html and css files --%>
        
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        

        
<style type=text/css> 
    
    
    
    body   
{ 

height: 100px;  
margin-top: 1px;  
padding: 30px;  
background-size: cover;  
font-family: sans-serif;  
} 
    
 
header {  
background-color: orange;  
position: fixed;  
left: 5px;  
right: 15px;  
top: 5px;  
height: 30px;  
display: flex;  
align-items: center;  
box-shadow: 0 0 25px 0 black;  
}  
header * {  
display: inline;  
}  
header li {  
margin: 50px;  
}  
header li a {  
color: green;  
text-decoration: none;  
}  
</style>   

 <%-- ------------------------------------------------------------------------------ --%>
 
 
<header>  
  
   
<nav>  
<ul>  
<li>  
<a href="#"> UserMonitor </a>  
</li>  
 <li> 
<a href="#"> Add Staff</a>  
</li>  
<li> 
<a href="#">log out</a>  
</li> 
</ul>  
</nav>  
             </form>
</header>  
  
 <%-- ------------------------------------------------------------------------------ --%>
 
 
<form    method="POST">
    
    
    <table style="margin-top:1px; right:100px;" border="1" width="15" cellspacing="5">
        
        
        <h3   style="margin-top:1px; right:100px;"><b>  Staff Account</b></h3>
        <tbody>
            <tr>
                <td>S_Name</td>
                <td><input type="text" name="name" placeholder="P.H.A Parara " id="name" requird /></td>
                
              
            </tr>
            <tr>
                <td>S_Gmail</td>
                <td><input type="text" name="gmail" placeholder="abc@gmail.com" id="gmail" requird/></td>
               
            </tr>
            <tr>
                <td>S_Id</td>
                <td><input type="text" name="id" placeholder="0000" id="id" requird /></td>
             
            </tr>
            
            <tr>
            
                 <td><label for="grade" class="grade">S_Grade</label>
                <select id="grade" name="grade"  required>
                
                    <option value="sg1" >G1 Staff</option>
                    <option value="sg2">G2 Staff</option>

                </select>
        </td>
                    
             
            </tr>
            <tr>
                <td> <input type="submit" id="submit" value="Approved" name="submit" class="btn btn-info" >   </td>
                    
                  
            </tbody>
            
            </tr>
             </table>
</form>

           
          

   


</body>   
</Html>  
<!--Connection con=DriverManager.getConnection("jdbc:mysql://localhost/aircraftdb","root","");-->