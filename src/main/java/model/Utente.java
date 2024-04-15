package model;

public class Utente {
    private int id;
    private String nome;
    private String email;
    private String password;
    private boolean isAdmin;

    public Utente() {}

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public void setAll(String nome, String email, String password, boolean isAdmin) {
        this.nome = nome;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }
}
