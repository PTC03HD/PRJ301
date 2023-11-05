/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;



import Models.Account;
import Models.Group;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 21H1 HNQA
 */
public class DAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        String sql = "select * from UserTBL where username = ? and password = ?";
        try {
            con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Group> getAllGroup() {
        List<Group> list = new ArrayList<>();
        String sql = "select * from GroupTBL";

        try {
            con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Group(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(String name, int gender, String dob, int qid, String create) {
        String sql = "insert into CandidateTBL\n"
                + "values(?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, gender);
            ps.setString(3, dob);
            ps.setInt(4, qid);
            ps.setString(5, create);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


 }
