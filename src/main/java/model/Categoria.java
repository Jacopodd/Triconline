package model;

public class Categoria {
    private int id;
    private String nome;
    private String descrizione;
    private String immagine;

    public Categoria() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public void setAll(int id, String nome, String descrizione, String immagine) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.immagine = immagine;
    }
}
