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
             
                <th>Staff_Id</th>
                <th>Staff_Name</th>
                <th>Staff_Gmail</th>
                <th>Staff_Role</th>
            </tr>
          
            
     <%-- view all data from user table --%>
                   <% 
  
            try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/flightdb","root","");
           Statement st=con.createStatement();
           String str="select id,uname,email,role from users ";
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
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/flightdb","root","");
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
margin-top: 15px;  
padding: 30px;  
background-size: cover;  
font-family: sans-serif;  
background-color: #990099; 
} 
    
 
header {  
background-color: blanchedalmond;  
position: fixed;  
left: 15px;  
right: 15px;  
top: 10px;  
height: 40px;  
display: flex;  
align-items: center;  
box-shadow: 0 0 25px 0 black;  
}  
header * {  
display: inline;  
}  
header li {  
margin: 100px;  
}  
header li a {  
color: black;  
  text-decoration:peru;
}  
</style>   

 <%-- ------------------------------------------------------------------------------ --%>
 
 
<header>  
  
   
<nav>  

    
    <ul class="nav justify-content-end">
  <li class="nav-item">
    <a class="nav-link active" href="monitor.html">UserMonitor</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="signup.html">Add Staff</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="home.html">log out</a>
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
                
           <td>         
             <select class="form-select" aria-label="Default select example">
  <option selected>S_Grade</option>
  <option value="sg1" >G1 Staff</option>
  <option value="sg2">G2 Staff</option>  </td>

</select>
            </tr>
            <tr>
                <td> <input type="submit" id="submit" value="Approved" name="submit" class="btn btn-info" >   </td>
                    
                  
            </tbody>
            
            </tr>
             </table>
</form>

           
          

   


</body>   
</Html>  
<!--Connection con=DriverManager.getConnection("jdbc:mysql://localhost/flightdb","root","");-->