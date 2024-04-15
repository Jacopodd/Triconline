package model;

public class Immagine {
    private int id;
    private int idProdotto;
    private String path;

    public Immagine() {}

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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setAll(int id, int idProdotto, String path) {
        this.id = id;
        this.idProdotto = idProdotto;
        this.path = path;
    }
}
