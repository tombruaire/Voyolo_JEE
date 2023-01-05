package controleur;

public class VClients {
	
    private int idu;
    private String nom, prenom, pseudo, email, mdp, role;
    private int nbTentatives, nbConnexion, bloque;
    private String last_connexion, last_deconnexion, creation_compte, date_naissance, tel, adresse, carte_avantage;
    
    public VClients(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, String date_naissance, String tel, String adresse, String carte_avantage) {
        this.idu = idu;
        this.nom = nom;
        this.prenom = prenom;
        this.pseudo = pseudo;
        this.email = email;
        this.mdp = mdp;
        this.role = role;
        this.nbTentatives = nbTentatives;
        this.nbConnexion = nbConnexion;
        this.bloque = bloque;
        this.last_connexion = last_connexion;
        this.last_deconnexion = last_deconnexion;
        this.creation_compte = creation_compte;
        this.date_naissance = date_naissance;
        this.tel = tel;
        this.adresse = adresse;
        this.carte_avantage = carte_avantage;
    }
    
    public int getIdu() {
        return this.idu;
    }
    
    public void setIdu(int idu) {
        this.idu = idu;
    }
    
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    public String getPseudo() {
        return this.pseudo;
    }
    
    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getMdp() {
        return this.mdp;
    }
    
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
    
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    public int getNbTentatives() {
        return this.nbTentatives;
    }
    
    public void setNbTentatives(int nbTentatives) {
        this.nbTentatives = nbTentatives;
    }
    
    public int getNbConnexion() {
        return this.nbConnexion;
    }
    
    public void setNbConnexion(int nbConnexion) {
        this.nbConnexion = nbConnexion;
    }
    
    public int getBloque() {
        return this.bloque;
    }
    
    public void setBloque(int bloque) {
        this.bloque = bloque;
    }
    
    public String getLast_connexion() {
        return this.last_connexion;
    }
    
    public void setLast_connexion(String last_connexion) {
        this.last_connexion = last_connexion;
    }
    
    public String getLast_deconnexion() {
        return this.last_deconnexion;
    }
    
    public void setLast_deconnexion(String last_deconnexion) {
        this.last_deconnexion = last_deconnexion;
    }
    
    public String getCreation_compte() {
        return this.creation_compte;
    }
    
    public void setCreation_compte(String creation_compte) {
        this.creation_compte = creation_compte;
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
