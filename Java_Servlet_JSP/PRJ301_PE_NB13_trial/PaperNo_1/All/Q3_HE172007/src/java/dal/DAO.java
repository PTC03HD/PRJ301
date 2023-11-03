/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author phamt
 */
public class DAO {
    private Connection con;
    private String status = "OK";
    private List<Account> accList;

    public DAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            status = "error at get Connection: "+e.getMessage();
        }
    }
    
    public void loadDB(){
        accList = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                accList.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "Error at load Account: "+e.getMessage();
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Account> getAccList() {
        return accList;
    }

    public void setAccList(List<Account> accList) {
        this.accList = accList;
    }
    
    public Account checkLogin(String username, String password){
        for(Account a : accList){
            if(a.getUid().equals(username)&&a.getPassword().equals(password))
                return a;
        }
        return null;
    }
    
    public static void main(String[] args) {
        DAO d = new DAO();
        d.loadDB();
        System.out.println(d.getAccList());
        Account a = d.checkLogin("mrc", "1234");
        System.out.println(a);
    }
}
