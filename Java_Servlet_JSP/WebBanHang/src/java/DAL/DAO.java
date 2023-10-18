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
                        rs.getString(8)));
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
    }
}
