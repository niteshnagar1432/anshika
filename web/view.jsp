<%-- 
    Document   : view
    Created on : Jul 9, 2024, 10:54:38 AM
    Author     : HOME
--%>

<%@page import="com.anshu.bank.bean.newAccount"%>
<%@page import="com.anshu.bank.bean.bankBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anshu.bank.Dao.bankDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
                .login{
                 background-repeat: no-repeat;
/*                border: 2px solid black;*/
                margin-right: 80px;
               display: flex;
               color: white;
               border-radius: 10px;
               margin-top: 100px;
               margin-left: 80px;
               justify-content: center;
               align-items: center;
               background-size: cover;
               background-color: #3498DB ;
/*                background-image: url("https://wallpapers.com/images/hd/blue-color-background-1920-x-1200-uvzif7jtuk60sk5r.jpg")*/
            }
            .loginform{
                font-size: 24px;
            }
            .div{
                display: flex;
                justify-content: space-around;
            }
            .div a{
                text-decoration: none;
                color: black;
            }
            
        </style>
    </head>
    <body>
        <%
          newAccount na=(newAccount)session.getAttribute("user");
          
        %>
        
         <hr color="green">
        <div class="div">
        <h1 align="right" class="right">Welcome : <%=na.getCn()%></h1>
        <h1><a href="view.jsp?ac=<%=na.getAc()%>">View Transaction History</a></h1>
        </div>
        
        <hr color="red">
<!--        <button><a href="transfer.jsp"><- Back</a></button>-->
        <div class="login">
            
        <form action="" method="post">
            
            <table class="loginform" border="3" align="center" cellpadding='10'>
                <tr>
                    <th>Transaction Id</th>
                    <th>Account Number: </th>
                    <th>To Account Number : </th>
               <th>Transaction Date : </th>
                <th>Transaction Amount : </th>
               <th>Delete</th>
                </tr>
                <%
                     bankDao bd=new bankDao();
                    if(request.getParameter("ac")!=null){
                            int ac=Integer.parseInt(request.getParameter("ac"));
            ArrayList<bankBean>al =bd.FindById(ac);
             for(bankBean bb:al){
                %>
                <tr>
                    <td><%=bb.getTransactionID()%></td>
                    <td><%=bb.getAccount_no()%> </td>
                    <td><%=bb.getBeneficiar_acc_no()%></td>
               <td><%=bb.getTransactionDate()%> </td>
                <td><%=bb.getTransactionAmount()%> </td>
                <td><a href="view.jsp?id=<%=bb.getTransactionID()%>">Delete</a></td>
                </tr>
                <%
                }
}
                  if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));

                bd.deletetransaction(id);
//                response.sendRedirect("view.jsp"); 
            }

                %>
                
 
            </table>
        </form>
        </div>
    </body>
</html>
