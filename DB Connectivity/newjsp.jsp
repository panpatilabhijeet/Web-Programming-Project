<%-- 
    Document   : newjsp
    Created on : 24 Mar, 2016, 11:07:17 AM
    Author     : AFRID
--%>
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
        <%
            String name=request.getParameter("name1");
            String address=request.getParameter("add");            
            String email=request.getParameter("email");            
            String username=request.getParameter("uname");            
            String upassword=request.getParameter("pwd");            
            if((name == "null")||(address=="null")||(email=="null")||(username=="null")||(upassword=="null"))
            {
                response.sendRedirect("login.html");
            }
            else if((name == "")||(address=="")||(email=="")||(username=="")||(upassword==""))
            {
                response.sendRedirect("Form.html");
            }
            else
            {                                            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","afrid");
            Statement st = conn.createStatement();
            int i=st.executeUpdate("insert into user values('"+name+"','"+address+"','"+email+"','"+username+"','"+upassword+"')");
            response.sendRedirect("reg.html");
            conn.close();
            st.close();
                       }
            
        %>
    </body>
</html>
