package jdbConnect;

import java.sql.*;
import java.util.*;
import java.io.*;



/**
 *
 * @author Joshi
 */
public class dbConnection {
    public static Connection conn;
    public static Statement stmt1,stmt2,stmt3,stmt4;
    public static ResultSet rslt1,rslt2,rslt3,rslt4;


public static void DConnect() throws  ClassNotFoundException, SQLException {

String username ="root"; 
String password =""; 

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightdb?zeroDateTimeBehavior=convertToNull",username,password);
stmt1 = conn.createStatement();
stmt2 = conn.createStatement();
stmt3 = conn.createStatement();
stmt4 = conn.createStatement();

}


}

