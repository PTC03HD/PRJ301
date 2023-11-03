/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Student;

/**
 *
 * @author phamt
 */
public class DAO {
    private Connection con;
    private List<Student> stList;
    private String status = "OK";
    
    public DAO(){
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            status = "error at get DB connection: "+e.getMessage();
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public List<Student> getStList() {
        return stList;
    }

    public void setStList(List<Student> stList) {
        this.stList = stList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    public void searchByName(String name){
        stList = new ArrayList<>();
        String sql = "select * from Student where [name] like ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+name+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                stList.add(new Student(rs.getInt(1), rs.getString(2), 
                        rs.getInt(3), rs.getDate(4)));
            }
        } catch (Exception e) {
            status = "Error at search Student: "+e.getMessage();
        }
    }
    public static void main(String[] args) {
        DAO d = new DAO();
        System.out.println(d.con);
        System.out.println(d.status);
    }
}
