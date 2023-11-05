/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Models.Account;
import Models.Comment;
import Models.Thread1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author ngngh
 */
public class DAO {
    public static DAO INSTANCE = new DAO();
    private Connection con;
    private List<Thread1> th;
    private List<Account> acc;
    private List<Comment> com;
    private String status ="OK";
    
    private DAO(){
        if (INSTANCE==null){
            con = new DBContext().connection;
        }else
            INSTANCE = this;
    }
    
    public void loadAll(){
        String sql = "select * from Account";
        acc = new Vector<Account>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                acc.add(new Account(rs.getString(1),rs.getString(2),rs.getString(3)));
            }
        } catch (Exception e) {
            status = "Error at read Account "+e.getMessage();
        }
        
        sql = "select * from Thread";
        th = new Vector<Thread1>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                th.add(new Thread1(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception e) {
            status = "Error at read Thread "+e.getMessage();
        }
        
        sql = "select * from Comment";
        com = new Vector<Comment>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                com.add(new Comment(rs.getInt(1),rs.getString(2),rs.getString(3),
                rs.getInt(4)));
            }
        } catch (Exception e) {
            status = "Error at read Comment "+e.getMessage();
        }
    }

    public static DAO getINSTANCE() {
        return INSTANCE;
    }

    public static void setINSTANCE(DAO INSTANCE) {
        DAO.INSTANCE = INSTANCE;
    }

    public List<Thread1> getTh() {
        return th;
    }

    public void setTh(List<Thread1> th) {
        this.th = th;
    }

    public List<Account> getAcc() {
        return acc;
    }

    public void setAcc(List<Account> acc) {
        this.acc = acc;
    }

    public List<Comment> getCom() {
        return com;
    }

    public void setCom(List<Comment> com) {
        this.com = com;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getAccName(String id){
        for (Account a : acc) {
            if (a.getUid().equals(id))
                return a.getDisplay();
        }
        return "";
    }

    public void Insert(String comment, String uid, int id) {
        String sql = "Insert into Comment values (?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setString(2, uid);
            ps.setInt(3, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert Comment "+e.getMessage();
        }
    }
}
