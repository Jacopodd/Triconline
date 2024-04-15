package model;

public class IndirizzoSpedizione {
    private int id, idUtente;
    private String via, cap, paese, numeroTelefono;
    private boolean isDefault;

    public IndirizzoSpedizione() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getPaese() {
        return paese;
    }

    public void setPaese(String paese) {
        this.paese = paese;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public void setDefault(boolean aDefault) {
        isDefault = aDefault;
    }

    public void setAll(int idUtente, String via, String cap, String paese, String numeroTelefono, boolean isDefault) {
        this.idUtente = idUtente;
        this.via = via;
        this.cap = cap;
        this.paese = paese;
        this.numeroTelefono = numeroTelefono;
        this.isDefault = isDefault;
    }
}
