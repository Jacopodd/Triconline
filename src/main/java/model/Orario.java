package model;

public class Orario {
    private int id;
    private String inizio;
    private String fine;

    public Orario() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInizio() {
        return inizio;
    }

    public void setInizio(String inizio) {
        this.inizio = inizio;
    }

    public String getFine() {
        return fine;
    }

    public void setFine(String fine) {
        this.fine = fine;
    }

    public void setAll(String inizio, String fine) {
        this.inizio = inizio;
        this.fine = fine;
    }
}
