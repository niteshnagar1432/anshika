<%-- 
    Document   : AllTransationHistory
    Created on : Jul 9, 2024, 12:57:45 PM
    Author     : HOME
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.anshu.bank.bean.bankBean"%>
<%@page import="com.anshu.bank.Dao.bankDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            ArrayList<bankBean>al =bd.FindAll();
             for(bankBean bb:al){
                %>
                <tr>
                    <td><%=bb.getTransactionID()%></td>
                    <td><%=bb.getAccount_no()%> </td>
                    <td><%=bb.getBeneficiar_acc_no()%></td>
               <td><%=bb.getTransactionDate()%> </td>
                <td><%=bb.getTransactionAmount()%> </td>
               <td>Delete</td>
                </tr>
                <%
                }
}
                %>
                
 
            </table>
        </form>
    </body>
</html>
