package model;

public class ProdottoCarrello {
    private int idUtente;
    private int idProdotto;
    private int quantita;

    public ProdottoCarrello() {}

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void setAll(int idUtente, int idProdotto, int quantita) {
        this.idUtente = idUtente;
        this.idProdotto = idProdotto;
        this.quantita = quantita;
    }
}
