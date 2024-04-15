package model.dao;

import model.ConPool;
import model.IndirizzoSpedizione;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IndirizzoSpedizioneDAO {

    public static IndirizzoSpedizione doRetrieveById(int id) {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM  indirizzoSpedizione WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                IndirizzoSpedizione i = new IndirizzoSpedizione();
                i.setId(rs.getInt(1));
                i.setIdUtente(rs.getInt(2));
                i.setVia(rs.getString(3));
                i.setCap(rs.getString(4));
                i.setPaese(rs.getString(5));
                i.setNumeroTelefono(rs.getString(6));
                i.setDefault(rs.getBoolean(7));
                return i;
            }
            return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static List<IndirizzoSpedizione> doRetrieveAll() {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM indirizzoSpedizione");
            ResultSet rs = ps.executeQuery();
            List<IndirizzoSpedizione> lista = new ArrayList<>();
            while(rs.next()) {
                IndirizzoSpedizione i = new IndirizzoSpedizione();
                i.setId(rs.getInt(1));
                i.setIdUtente(rs.getInt(2));
                i.setVia(rs.getString(3));
                i.setCap(rs.getString(4));
                i.setPaese(rs.getString(5));
                i.setNumeroTelefono(rs.getString(6));
                i.setDefault(rs.getBoolean(7));
                lista.add(i);
            }
            if(lista.size() > 0)
                return lista;
            else
                return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static ArrayList<IndirizzoSpedizione> doRetrieveByIdUtente(int idUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("SELECT * FROM " +
                    "indirizzoSpedizione WHERE idUtente=?");
            ps.setInt(1, idUtente);
            ResultSet rs = ps.executeQuery();
            List<IndirizzoSpedizione> lista = new ArrayList<>();
            while (rs.next()){
                IndirizzoSpedizione i = new IndirizzoSpedizione();
                i.setId(rs.getInt(1));
                i.setIdUtente(rs.getInt(2));
                i.setVia(rs.getString(3));
                i.setCap(rs.getString(4));
                i.setPaese(rs.getString(5));
                i.setNumeroTelefono(rs.getString(6));
                i.setDefault(rs.getBoolean(7));
                lista.add(i);
            }
            if(lista.size() > 0)
                return (ArrayList<IndirizzoSpedizione>) lista;
            else
                return null;
        }catch (SQLException e){
            throw new RuntimeException(e) ;
        }
    }

    public static void doSave(IndirizzoSpedizione indirizzoSpedizione) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO indirizzoSpedizione (idUtente, via, cap, paese, numeroTelefono, isDefault) VALUES(?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, indirizzoSpedizione.getIdUtente());
            ps.setString(2, indirizzoSpedizione.getVia());
            ps.setString(3, indirizzoSpedizione.getCap());
            ps.setString(4, indirizzoSpedizione.getPaese());
            ps.setString(5, indirizzoSpedizione.getNumeroTelefono());
            ps.setBoolean(6, indirizzoSpedizione.isDefault());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            indirizzoSpedizione.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
