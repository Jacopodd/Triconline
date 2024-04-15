package model;

public class Recensione {
    private int id;
    private int idProdotto;
    private int idUtente;
    private String rating;
    private String commento;

    public void Recensione() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getCommento() {
        return commento;
    }

    public void setCommento(String commento) {
        this.commento = commento;
    }

    public void setAll(int id, int idProdotto, int idUtente, String rating, String commento) {
        this.id = id;
        this.idProdotto = idProdotto;
        this.idUtente = idUtente;
        this.rating = rating;
        this.commento = commento;
    }
}
