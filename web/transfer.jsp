<%-- 
    Document   : transfer
    Created on : Jun 9, 2024, 10:05:03 AM
    Author     : HOME
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.anshu.bank.Dao.newAccountDao"%>
<%@page import="com.anshu.bank.Dao.bankDao"%>
<%@page import="com.anshu.bank.bean.bankBean"%>
<%@page import="com.anshu.bank.bean.newAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .div{
                display: flex;
                justify-content: space-around;
            }
            .div a{
                text-decoration: none;
                color: black;
            }
            .login{
                 background-repeat: no-repeat;
                border: 2px solid black;
                height: 550px;
                width: 550px;
               display: flex;
               border-radius: 10px;
               margin-top: 50px;
               margin-left: 470px;
               justify-content: center;
               align-items: center;
              
               background-size: cover;
                background-image: url("https://media.istockphoto.com/id/1497285758/vector/abstract-dark-blue-blurred-defocused-gradient-background.jpg?s=1024x1024&w=is&k=20&c=8VauXSB-QByqTeUkLfCNoF0ijgH44iBGoYjGYDEiWyU=")
            }
            .loginform tr td {
                font-size: 25px;
                color: white;
               
               }
             .loginform  input{
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
                padding: 10px;
              
             width: 150px;
              border-radius: 10px; 
                           }
                           .right{
                               padding-right: 50px;
                           }
                           .del{
                               margin-top: -50px;
                               margin-right: 50px;
                           }
        </style>
    </head>
    <body>
        <%
          newAccount na=(newAccount)session.getAttribute("user");
         bankDao bd=new bankDao();
        %>
         <%
                     String balance="";
                        if(request.getParameter("ac")!=null){
                             String ac=request.getParameter("ac");
                               double bal=bd.findBalance(ac);
//                            response.sendRedirect("transfer.jsp");
                              balance=""+bal;
                           
                        }
                        if(request.getParameter("acdel")!=null){
                            String ac=request.getParameter("acdel");
                            bd.DeleteAccount(ac);
                            response.sendRedirect("LoginPage.jsp");
                        }
                       
                        %>
        
        <hr color="green">
        <div class="div">
        <h1><a href="transfer.jsp?ac=<%=na.getAc()%>">Check Your Balance </a><%=balance%></h1>
       
        <h1 align="right" class="right">Welcome : <%=na.getCn()%></h1>
        <h1><a href="view.jsp?ac=<%=na.getAc()%>">View Transaction History</a></h1>
        </div>
        <hr color="red">
        <div class="login">
        <form action="transferController.jsp" method="post">
            <table class="loginform">
                <tr>
                    <td>Account Number: </td>
                    <td><input type="text" readonly="true" name="acno" value=<%=na.getAc()%> </td>
                </tr>
                <tr>
                    <td>To Account Number : </td>
                    <td><input type="text" name="toacno"></td>
                </tr>
                  <tr>
                    <td>Transaction Date : </td>
                    <td><input type="date" name="tdate"></td>
                </tr>
                  <tr>
                
                    <td>Transaction Amount : </td>
                    <td><input type="number" name="tamount"></td>
                </tr>
          
                <tr>
                    <td>&nbsp;</td>
                    <td><button class="button" type="submit" value="transfer balance">Click here</button</td>
                </tr>
            </table>
        </form>
        </div>

    </body>
</html>
