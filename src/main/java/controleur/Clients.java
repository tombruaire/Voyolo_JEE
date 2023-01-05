package controleur;

public class Clients extends Users {
	
    private String date_naissance, tel, adresse, carte_avantage;
    
    public Clients(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, String date_naissance, String tel, String adresse, String carte_avantage) {
        super(idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte);
        this.date_naissance = date_naissance;
        this.tel = tel;
        this.adresse = adresse;
        this.carte_avantage = carte_avantage;
    }
    
    public Clients(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, String date_naissance, String tel, String adresse, String carte_avantage) {
        super(idu, nom, prenom, pseudo, email, mdp, role);
        this.date_naissance = date_naissance;
        this.tel = tel;
        this.adresse = adresse;
        this.carte_avantage = carte_avantage;
    }
    
    public Clients(String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, String date_naissance, String tel, String adresse, String carte_avantage) {
        super(nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte);
        this.date_naissance = date_naissance;
        this.tel = tel;
        this.adresse = adresse;
        this.carte_avantage = carte_avantage;
    }
    
    public Clients(String nom, String prenom, String pseudo, String email, String mdp, String role, String date_naissance, String tel, String adresse, String carte_avantage) {
        super(nom, prenom, pseudo, email, mdp, role);
        this.date_naissance = date_naissance;
        this.tel = tel;
        this.adresse = adresse;
        this.carte_avantage = carte_avantage;
    }
    
    public String getDate_naissance() {
        return this.date_naissance;
    }
    
    public void setDate_naissance(String date_naissance) {
        this.date_naissance = date_naissance;
    }
    
    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }
    
    public String getAdresse() {
        return this.adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    
    public String getCarte_avantage() {
        return this.carte_avantage;
    }
    
    public void setCarte_avantage(String carte_avantage) {
        this.carte_avantage = carte_avantage;
    }
}
