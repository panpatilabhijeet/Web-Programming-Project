<%-- 
    Document   : login
    Created on : 24 Mar, 2016, 10:46:09 AM
    Author     : AFRID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
    <%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <% String FirstName = request.getParameter("uname");
         String pwd = request.getParameter("pwd");
         int flag=0;
//Step - One
Class.forName("com.mysql.jdbc.Driver");

//Step-Two
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","afrid");

//Step - Three
Statement s = c.createStatement();

//Step - Four
ResultSet r = s.executeQuery("select upassword from user where username='"+FirstName+"'");
 
while(r.next()){
    
    
    String up=r.getString(1);

    if(up.equals(pwd))
               {
        response.sendRedirect("logsuccess.html");
            flag=1;
    }
}

        if(flag==0){
            response.sendRedirect("loginfail.html");
        }
    c.close();
    s.close();
 

%>

    </body>
</html>
