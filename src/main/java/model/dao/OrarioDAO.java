package model.dao;

import model.ConPool;
import model.Orario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrarioDAO {

    public static Orario doRetrieveById(int id) {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM  orario WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Orario o = new Orario();
                o.setId(rs.getInt(1));
                o.setInizio(rs.getString(2));
                o.setFine(rs.getString(3));
                return o;
            }
            return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static Orario doRetrieveByInizioFine(String inizio, String fine) {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM  orario WHERE inizio=? AND fine=?");
            ps.setString(1, inizio);
            ps.setString(2, fine);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Orario o = new Orario();
                o.setId(rs.getInt(1));
                o.setInizio(rs.getString(2));
                o.setFine(rs.getString(3));
                return o;
            }
            return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static List<Orario> doRetrieveAll() {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM orario");
            ResultSet rs = ps.executeQuery();
            List<Orario> lista = new ArrayList<>();
            while(rs.next()) {
                Orario o = new Orario();
                o.setId(rs.getInt(1));
                o.setInizio(rs.getString(2));
                o.setFine(rs.getString(3));
                lista.add(o);
            }
            if(lista.size() > 0)
                return lista;
            else
                return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static void doSave(Orario orario) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO orario (inizio, fine) VALUES(?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, orario.getInizio());
            ps.setString(2, orario.getFine());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            orario.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
