package model.dao;

import model.ConPool;
import model.Prenotazione;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PrenotazioneDAO {
    public static Prenotazione doRetrieveById(int id) {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM  prenotazione WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Prenotazione p = new Prenotazione();
                p.setId(rs.getInt(1));
                p.setUtente(UtenteDAO.doRetrieveById(rs.getInt(2)));
                p.setOrario(OrarioDAO.doRetrieveById(rs.getInt(3)));
                p.setMessaggio(rs.getString(4));
                return p;
            }
            return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static List<Prenotazione> doRetrieveAll() {
        try(Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prenotazione");
            ResultSet rs = ps.executeQuery();
            List<Prenotazione> lista = new ArrayList<>();
            while(rs.next()) {
                Prenotazione p = new Prenotazione();
                p.setId(rs.getInt(1));
                int idUtente = rs.getInt(2);
                int idOrario = rs.getInt(3);
                p.setUtente(UtenteDAO.doRetrieveById(idUtente));
                p.setOrario(OrarioDAO.doRetrieveById(idOrario));
                p.setGiorno(rs.getString(4));
                p.setMessaggio(rs.getString(5));
                lista.add(p);
            }
            if(lista.size() > 0)
                return lista;
            else
                return null;
        } catch (SQLException ex){
            throw new RuntimeException(ex);
        }
    }

    public static void doSave(Prenotazione prenotazione) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prenotazione (idUtente, idOrario, messaggio) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, prenotazione.getUtente().getId());
            ps.setInt(2, prenotazione.getOrario().getId());
            ps.setString(3, prenotazione.getMessaggio());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            prenotazione.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
