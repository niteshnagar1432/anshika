/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anshu.bank.Dao;


import com.anshu.bank.bean.bankBean;
import com.anshu.bank.bean.newAccount;
import com.ram.bank.util.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HOME
 */
public class bankDao {

    static Connection conn = null;

//   =================================================ValidateAccount====================================
    private Boolean validateAccount(String ac) {
        conn = ConnectionPool.connectDB();
        boolean r = false;
        String sql = "select account_no from account_table where account_no='" + ac + "'";

        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                r = true;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return r;
    }

//    ===================================findBalance============================================================
    public double findBalance(String ac) {
        double res = 0;
       
        String sql = "select balance from account_table where account_no='" + ac + "'";
        conn = ConnectionPool.connectDB();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                res =rs.getDouble("balance");
                
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }
    
    
//    ==========================================================================================================
    
//     public double AddMoney(String ac,int money) {
//        double res = 0;
//        String sql = "select balance from account_table where account_no='" + ac + "'";
//        conn = ConnectionPool.connectDB();
//       
//        try {
//            Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            if (rs.next()) {
//                res = rs.getDouble("balance")+money;
//            }
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return res;
//    }
//    
    
//    =============================================DeleteAccount===========================================================
    
    public int DeleteAccount(String ac){
        conn=ConnectionPool.connectDB();
        String sql="delete from account_table where account_no='"+ac+"'";
        
      int r=0;
        try {
            Statement stmt=conn.createStatement();
            r=stmt.executeUpdate(sql);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
      return r;
    }

//    =============================================UpdateBalance===============================================
    public boolean updateBalance(String ac, double newbal) {
        boolean b = false;
        conn = ConnectionPool.connectDB();
        String sql = "update account_table set balance='" + newbal + "' where account_no='" + ac + "'";
        try {
            Statement stmt = conn.createStatement();
            int r = stmt.executeUpdate(sql);
            if (r > 0) {
                b = true;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }

    
//    ==========================================transferMoney==================================================
    public boolean transferMoney(bankBean bb) {
//        conn = ConnectionPool.connectDB();
        boolean r = false;
        int tid = 0;
        bankDao vd = new bankDao();
        if (vd.validateAccount(bb.getAccount_no()) && vd.validateAccount(bb.getBeneficiar_acc_no())) {
            double fromaccount = vd.findBalance(bb.getAccount_no());
            System.out.println("From account balance" + fromaccount);
            double tamount = bb.getTransactionAmount();
            System.out.println("Transfer amount" + tamount);
            if (fromaccount > tamount) {
                vd.updateBalance(bb.getAccount_no(), fromaccount - tamount);
                vd.updateBalance(bb.getBeneficiar_acc_no(), vd.findBalance(bb.getBeneficiar_acc_no()) + tamount);
                tid = (int) (Math.random() * 1000);
                System.out.println("Generatenumber " + tid);
                
                String sql = "insert into transfer_table values ('" + tid + "','" + bb.getAccount_no() + "','" + bb.getBeneficiar_acc_no() + "','" + bb.getTransactionDate() + "','" + bb.getTransactionAmount() + "')";
                int p = 0;
                try {
                    conn=ConnectionPool.connectDB();
                    Statement stmt=conn.createStatement();
                    p=stmt.executeUpdate(sql);
                    System.out.println("Insert Success");
                } catch (SQLException ex) {
                    Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println(""+ex);
                }

                r = true;
            }
        }
//           System.out.println(""+bb.getAccount_no());
//           System.out.println(""+bb.getBeneficiar_acc_no());
//           System.out.println(""+bb.getTransactionDate());
//           Syst em.out.println(""+bb.getTransactionAmount());
//           System.out.println(""+bb.getTransactionID());
//
        return r;
    }

    
//   ==============================Find all============================================================
    
    public ArrayList<bankBean>FindAll(){
        conn=ConnectionPool.connectDB(); //step1,step2
        //step3 :Write SQL Query
        ArrayList<bankBean> al = new ArrayList<>();
        String sql="select * from transfer_table";
        try {
            //step4: Create Object of Statement
            Statement stmt=conn.createStatement();
            //step5: call executeQuery
            ResultSet rs=stmt.executeQuery(sql);
            //step6: Process Result
            while(rs.next()){
                //System.out.println(""+rs.getInt("id")+"\t"+rs.getString("name")+"\t"+rs.getString("enroll")+"\t"+rs.getFloat("per"));
             bankBean bb=new bankBean();
             bb.setAccount_no(rs.getString("Account_no"));
             bb.setBeneficiar_acc_no(rs.getString("beneficiar_acc_no"));
             bb.setTransactionAmount(rs.getFloat("transactionAmount"));
             bb.setTransactionDate(rs.getString("transactionDate"));
             bb.setTransactionID(rs.getInt("transactionId"));
             al.add(bb);
            }
            //step7: Close the Connections
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      return al; 
    }
    

//    ===============================================find by id======================================================
    
     public ArrayList<bankBean>FindById(int id){
        conn=ConnectionPool.connectDB(); //step1,step2
        //step3 :Write SQL Query
        ArrayList<bankBean> al = new ArrayList<>();
        String sql="select * from transfer_table where Account_no='"+id+"'";
        try {
            //step4: Create Object of Statement
            Statement stmt=conn.createStatement();
            //step5: call executeQuery
            ResultSet rs=stmt.executeQuery(sql);
            //step6: Process Result
            while(rs.next()){
                //System.out.println(""+rs.getInt("id")+"\t"+rs.getString("name")+"\t"+rs.getString("enroll")+"\t"+rs.getFloat("per"));
             bankBean bb=new bankBean();
             bb.setAccount_no(rs.getString("Account_no"));
             bb.setBeneficiar_acc_no(rs.getString("beneficiar_acc_no"));
             bb.setTransactionAmount(rs.getFloat("transactionAmount"));
             bb.setTransactionDate(rs.getString("transactionDate"));
             bb.setTransactionID(rs.getInt("transactionId"));
             al.add(bb);
            }
            //step7: Close the Connections
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      return al; 
    }
   
     
//     ===============================================delete=========================================
     
     public int deletetransaction(int id) {
        conn = ConnectionPool.connectDB();//step1,step2
        //step3: Write SQL Query
        String sql = "delete  from transfer_table where transactionId='"+id+"'";
        //step4: Create Object of Statement
        int r = 0;
        try {
            Statement stmt = conn.createStatement();
            //step5: call executeUpdate() method
            r = stmt.executeUpdate(sql);
            //step6: Close the Connection
        } catch (SQLException ex) {
            Logger.getLogger(bankDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
//    ===============================================main======================================
    public static void main(String[] args) {
        bankDao bd = new bankDao();
       
//        1.================================validateAccount====================
//        boolean b=bd.validateAccount("12345678945");
//        if(b){
//        System.out.println("This is valid Account");
//        }
//        else{
//            System.out.println("This is not valid account");
//        }


//        2.================================FindBalance===========================
        System.out.println("Balance"+bd.findBalance("134"));


//        3.====================================updateBalance=========================
//        Boolean b=bd.updateBalance("12345678945",4567);
//        System.out.println(""+b);


//        4.================================transferAmount===========================
          bankBean bb =new bankBean();
//           bb.setAccount_no("67865432");
//           bb.setBeneficiar_acc_no("12345678945");
//           bb.setTransactionAmount(100);
//           bb.setTransactionDate("30-May-2024");
////           bb.setTransactionID(1240 );
//           boolean b = bd.transferMoney(bb);
//           if(b){
//         System.out.println("Amount Transfer Success: " + b);
//           }


//        5.==============================find all===================================
            System.out.println(bd.FindAll());
            
            
//        6===============================find by id=====================================
            System.out.println(bd.FindById(67865432));
            
//            7=============================deletetransaction================================
            int a=bd.deletetransaction(618);
            if(a>0){
                System.out.println("true");
            }
            else{
                System.out.println("false");
            }
            
//           8 ==============================AddMoney====================================
//             System.out.println("Balance"+bd.AddMoney("134",100));
    }
}
