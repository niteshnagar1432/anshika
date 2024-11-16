/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anshu.bank.bean;

/**
 *
 * @author HOME
 */
public class bankBean {
    private int transactionID;
    private String account_no;
    private String beneficiar_acc_no;
    private String transactionDate;
    private float transactionAmount;

    
    
//    public bankBean(int transactionID, String account_no, String beneficiar_acc_no, String transactionDate, float transactionAmount) {
//        this.transactionID = transactionID;
//        this.account_no = account_no;
//        this.beneficiar_acc_no = beneficiar_acc_no;
//        this.transactionDate = transactionDate;
//        this.transactionAmount = transactionAmount;
//    }
//
//    
//    public int getTransactionID() {
//        return transactionID;
//    }
//
//    public void setTransactionID(int transactionID) {
//        this.transactionID = transactionID;
//    }
//
//    public String getAccount_no() {
//        return account_no;
//    }
//
//    public void setAccount_no(String account_no) {
//        this.account_no = account_no;
//    }
//
//    public String getBeneficiar_acc_no() {
//        return beneficiar_acc_no;
//    }
//
//    public void setBeneficiar_acc_no(String beneficiar_acc_no) {
//        this.beneficiar_acc_no = beneficiar_acc_no;
//    }
//
//    public String getTransactionDate() {
//        return transactionDate;
//    }
//
//    public void setTransactionDate(String transactionDate) {
//        this.transactionDate = transactionDate;
//    }
//
//    public float getTransactionAmount() {
//        return transactionAmount;
//    }
//
//    public void setTransactionAmount(float transactionAmount) {
//        this.transactionAmount = transactionAmount;
//    }

    public bankBean() {
    }

    public bankBean(int transactionID, String account_no, String beneficiar_acc_no, String transactionDate, float transactionAmount) {
        this.transactionID = transactionID;
        this.account_no = account_no;
        this.beneficiar_acc_no = beneficiar_acc_no;
        this.transactionDate = transactionDate;
        this.transactionAmount = transactionAmount;
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public String getAccount_no() {
        return account_no;
    }

    public void setAccount_no(String account_no) {
        this.account_no = account_no;
    }

    public String getBeneficiar_acc_no() {
        return beneficiar_acc_no;
    }

    public void setBeneficiar_acc_no(String beneficiar_acc_no) {
        this.beneficiar_acc_no = beneficiar_acc_no;
    }

    public String getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }

    public float getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(float transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    @Override
    public String toString() {
        return "bankBean{" + "transactionID=" + transactionID + ", account_no=" + account_no + ", beneficiar_acc_no=" + beneficiar_acc_no + ", transactionDate=" + transactionDate + ", transactionAmount=" + transactionAmount + '}';
    }
    
    
}
