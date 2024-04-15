package model.dao;

import model.ConPool;
import model.Utente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO {

    public static Utente doRetrieveById(int id) {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM  utente WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Utente u = new Utente();
                u.setId(rs.getInt(1));
                u.setNome(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setAdmin(rs.getBoolean(5));
                return u;
            }
            return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static List<Utente> doRetrieveAll() {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente");
            ResultSet rs = ps.executeQuery();
            List<Utente> lista = new ArrayList<>();
            while(rs.next()) {
                Utente u = new Utente();
                u.setId(rs.getInt(1));
                u.setNome(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setAdmin(rs.getBoolean(5));
                lista.add(u);
            }
            if(lista.size() > 0)
                return lista;
            else
                return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static Utente doRetrieveByEmailPassword(String email, String password){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("SELECT * FROM " +
                    "utente WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Utente u = new Utente();
                u.setId(rs.getInt(1));
                u.setNome(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setAdmin(rs.getBoolean(5));
                return u;
            }
            return null;
        }catch (SQLException e){
            throw new RuntimeException(e) ;
        }
    }

    public static void doSave(Utente utente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO utente (nome, email, password) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, utente.getNome());
            ps.setString(2, utente.getEmail());
            ps.setString(3, utente.getPassword());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            utente.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
