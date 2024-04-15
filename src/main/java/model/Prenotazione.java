package model;

public class Prenotazione {
    private int id;
    private Utente utente;
    private Orario orario;
    private String giorno, messaggio;

    public Prenotazione() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public Orario getOrario() {
        return orario;
    }

    public void setOrario(Orario orario) {
        this.orario = orario;
    }

    public String getGiorno() {
        return giorno;
    }

    public void setGiorno(String giorno) {
        this.giorno = giorno;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }
}
