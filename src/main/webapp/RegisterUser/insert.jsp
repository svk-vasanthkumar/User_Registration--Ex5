<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/userdb","root","svk@636807"
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO users(name,email,password) VALUES(?,?,?)"
    );

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, pass);

    int x = ps.executeUpdate();

    if(x > 0){
        out.println("<h3>Registration Successful!</h3>");
    } else {
        out.println("<h3>Error Occurred!</h3>");
    }

    con.close();

} catch(Exception e){
    out.println(e);
}
%>
