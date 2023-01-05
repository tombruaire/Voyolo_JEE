package modele;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public class Bdd  {

    private String serveur;
    private String bdd;
    private String user;
    private String mdp;
    private Connection maConnexion;
    
    public Bdd(String serveur, String bdd, String user, String mdp) {
        this.serveur = serveur;
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
        this.maConnexion = null;
    }
    
    public void chargerPilote() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException exp) {
            System.out.println("Absence du pilote jdbc");
        }
    }
    
    public void seConnecter() {
        String url = "jdbc:mysql://" + this.serveur + "/" + this.bdd;
        url = String.valueOf(url) + "?verifyServerCertificate=false&useSSL=false";
        this.chargerPilote();
        try {
            this.maConnexion = DriverManager.getConnection(url, this.user, this.mdp);
        }
        catch (SQLException exp) {
            System.out.println("Erreur de connexion \u00e0 : " + url);
        }
    }
    
    public void seDeconnecter() {
        try {
            if (this.maConnexion != null) {
                this.maConnexion.close();
            }
        }
        catch (SQLException exp) {
            System.out.println("Erreur de connexion");
        }
    }
    
    public Connection getMaConnexion() {
        return this.maConnexion;
    }
}
