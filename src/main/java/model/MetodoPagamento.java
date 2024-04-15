package model;

public class MetodoPagamento {
    private int id;
    private int idUtente;
    private String proprietario;
    private String numeroCarta;
    private String dataScadenza;
    private String cvv;
    private boolean isDefault;

    public MetodoPagamento() {}

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

    public String getProprietario() {
        return proprietario;
    }

    public void setProprietario(String proprietario) {
        this.proprietario = proprietario;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }

    public String getDataScadenza() {
        return dataScadenza;
    }

    public void setDataScadenza(String dataScadenza) {
        this.dataScadenza = dataScadenza;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public void setDefault(boolean aDefault) {
        isDefault = aDefault;
    }

    public void setAll(int id, int idUtente, String proprietario, String numeroCarta, String dataScadenza, String cvv, boolean isDefault) {
        this.id = id;
        this.idUtente = idUtente;
        this.proprietario = proprietario;
        this.numeroCarta = numeroCarta;
        this.dataScadenza = dataScadenza;
        this.cvv = cvv;
        this.isDefault = isDefault;
    }
}
