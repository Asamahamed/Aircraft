<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<Html>     
  <HEAD>
               <link rel="stylesheet"  href="css/admindesh.css"> 
     
    </HEAD>

    <body>

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
 
 
<table class="table table-bordered table-striped table-condensed" align="center"  width="10%" >
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
        
        


 <%-- ------------------------------------------------------------------------------ --%>
 
 
 

  
   
<nav>
        
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="admin.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="UserPage.html">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Monitor Pesenger</span>
                </a></li>
                <li><a href="signup.html">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Add Staff</span>
                </a></li>
                
                <li><a href="www.google.com">
                    <i class="uil uil-share"></i>
                    <span class="link-name">Share</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="home.html">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>  
    
    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            
            <!--<img src="images/profile.jpg" alt="">-->
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                       
                        <span class="text">Total Pesengers</span>
                        <span class="number">501,200</span>
                    </div>
                    <div class="box box2">
              
                        <span class="text">Total Staff</span>
                        <span class="number">20,120</span>
                    </div>
                    <div class="box box3">
                    
                        <span class="text">Total Shares</span>
                        <span class="number">10000</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>

            
            </div>
        </div>
    </section>

           

 <%-- ------------------------------------------------------------------------------ --%>
 
 
 
    
 <form method="POST">
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
             <select class="form-select" aria-label="Default select example"name="grade">
  <option selected>S_Grade</option>
  <option value="sg1" >G1 Staff</option>
  <option value="sg2">G2 Staff</option>  </td>


            </tr>
            <tr>
                <td> <input type="submit" id="submit" value="Approved" name="submit" class="btn btn-info" >   </td>
              
            </tr>
             </table>

 </form>

       
          
        
 <script src="js/admin.js">  
    </script>
   
   


</body>   
</Html>  
<!--Connection con=DriverManager.getConnection("jdbc:mysql://localhost/flightdb","root","");-->