<%-- 
    Document   : login
    Created on : May 2, 2019, 9:05:05 PM
    Author     : h3ln4n_l33
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
       <body bgcolor = "#ffffff">
      
      <form method = "POST" action ="j_security_check">
         <table border = "0">
            <tr>
               <td>Login</td>
               <td><input type = "text" name="j_username"></td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type = "password" name="j_password"></td>
            </tr>
         </table>
         <input type = "submit" value = "Login!">
         
      </form>
      
   </body>
</html>
