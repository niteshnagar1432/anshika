<%-- 
    Document   : new_account
    Created on : Jun 9, 2024, 10:27:00 AM
    Author     : HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .newacc{
                 background-repeat: no-repeat;
                border: 2px solid black;
                height: 500px;
                width: 500px;
               display: flex;
               border-radius: 10px;
               margin-top: 100px;
               margin-left: 470px;
               justify-content: center;
               align-items: center;
              
               background-size: cover;
                background-image: url("https://media.istockphoto.com/id/1497285758/vector/abstract-dark-blue-blurred-defocused-gradient-background.jpg?s=1024x1024&w=is&k=20&c=8VauXSB-QByqTeUkLfCNoF0ijgH44iBGoYjGYDEiWyU=")
            }
            .accform tr td {
                font-size: 25px;
                color: white;
               
               }
             .accform  input{
               font-size: 20px;
                margin: 15px;
             
              height: 30px;
              border-radius: 10px; 
                           }
               .button{
                  background-color: black ;   
                   font-size: 20px;
                margin: 15px;
                color: white;
              height: 45px;
              padding-left: 10px; 
              border-radius: 10px; 
                           }
                           
        </style>
        
    </head>
    <body>
        <div class="newacc">
        <form action="AccountController.jsp" method="post" >
            <table class="accform">
                <tr>
                    <td>Account Number : </td>
                    <td><input type="text" name="acno"></td>
                </tr>
                <tr>
                    <td>Customer Name : </td>
                    <td><input type="text" name="cn"></td>
                </tr>
                <tr>
                    <td>Balance : </td>
                    <td><input type="text" name="bal"></td>
                </tr>
                 <tr>
                    <td>Username : </td>
                    <td><input type="text" name="un"></td>
                </tr>
                 <tr>
                    <td>Password : </td>
                    <td><input type="text" name="ps"></td>
                </tr>
                <tr>
                    
                    <td>&nbsp;</td>
                    <td><button class="button" type="submit" value="Create new Account">Create new Account</button></td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</html>
