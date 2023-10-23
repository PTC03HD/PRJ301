/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.*;
import java.util.*;
import models.*;

public class DAO {
    private Connection con;
    private String status = "OK";
    private List<Product> p;
    private List<Category> c;
    private List<Users> u;
    private List<Product> pagingPro;

    public DAO(){
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at Connection" + e.getMessage();
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public List<Product> getP() {
        return p;
    }

    public void setP(List<Product> p) {
        this.p = p;
    }

    public List<Category> getC() {
        return c;
    }

    public void setC(List<Category> c) {
        this.c = c;
    }

    public List<Users> getU() {
        return u;
    }

    public void setU(List<Users> u) {
        this.u = u;
    }

    public List<Product> getPagingPro() {
        return pagingPro;
    }

    public void setPagingPro(List<Product> pagingPro) {
        this.pagingPro = pagingPro;
    }
    
    
    
    public void loadDB() {
        String sql = "select * from Product";
        p = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                p.add(new Product(
                        rs.getString(1), 
                        rs.getInt(2), 
                        rs.getString(3), 
                        rs.getInt(4), 
                        rs.getString(5), 
                        rs.getInt(6), 
                        rs.getString(7), 
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            status = "Error at load Product: " + e.getMessage();
        }
        
        sql = "select * from category";
        c = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                c.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            status = "Error at load Category: "+e.getMessage();
        }
        
        sql = "select * from users";
        u = new Vector<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                u.add(new Users(rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            status = "Error at load Category: "+e.getMessage();
        }
    }
    
    public void signup(String username, String email, String password, int isAdmin, String phoneNum){
        String sql = "INSERT INTO users ([user_name], user_email, user_pass, isAdmin, phoneNum) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            if(isAdmin==1){
                ps.setInt(4, 0);
            }else{
                ps.setNull(4, java.sql.Types.INTEGER);
            }
            ps.setString(5, phoneNum);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert user: "+e.getMessage();
        }
    }
    
    public boolean checkUserExist(String username, String email, String phoneNum){
        for (Users user : u) {
            if(user.getUsername().equals(username)||
                    user.getUserEmail().equals(email)||
                    user.getPhoneNum().equals(phoneNum)){
                return true;
            }
        }
        return false;
    }
    
    public Users checkLogin(String username, String password){
        for (Users user : u) {
            if(user.getUsername().equals(username) && user.getUserPass().equals(password)){
                return user;
            }
        }
        return null;
    }
    
    public int getTotalProduct(){
        String sql = "select count(*) from Product";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at check total account: "+e.getMessage();
        }
        return 0;
    }
    
    public void pagingProduct(int index, int nrpp){
        pagingPro = new Vector<>();
        String sql = "select * from Product order by category_id offset ? row fetch next ? rows only";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, (index-1)*nrpp);
            ps.setInt(2, nrpp);
            ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                pagingPro.add(new Product(
                        rs.getString(1), 
                        rs.getInt(2),
                        rs.getString(3), 
                        rs.getInt(4), 
                        rs.getString(5), 
                        rs.getInt(6), 
                        rs.getString(7), 
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            status = "Error at paging Product: "+e.getMessage();
        }
    }
    
    public static void main(String[] args) {
        DAO d = new DAO();
        
    }
}
