/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.AcG;
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

    public List<AcG> getCandi(String name) {
        List<AcG> list = new ArrayList<>();
        String sql = "select CandidateTBL.cid, CandidateTBL.cname, CandidateTBL.gender,CandidateTBL.dob, GroupTBL.gname ,CandidateTBL.created_by from CandidateTBL join GroupTBL on CandidateTBL.gid = GroupTBL.gid where GroupTBL.gname= ?";

        try {
            con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AcG(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<AcG> getAllCandi() {
        List<AcG> list = new ArrayList<>();

        String sql = "select CandidateTBL.cid, CandidateTBL.cname, CandidateTBL.gender,CandidateTBL.dob, GroupTBL.gname ,CandidateTBL.created_by from CandidateTBL join GroupTBL on CandidateTBL.gid = GroupTBL.gid ";

        try {
            con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AcG(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
