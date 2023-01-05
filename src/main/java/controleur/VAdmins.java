package controleur;

public class VAdmins {
	
    private int idu;
    private String nom, prenom, pseudo, email, mdp, role;
    private int nbTentatives, nbConnexion, bloque;
    private String last_connexion, last_deconnexion, creation_compte;
    private int num_identification;
    private String type;
    
    public VAdmins(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, int num_identification, String type) {
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
        this.num_identification = num_identification;
        this.type = type;
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
    
    public int getNum_identification() {
        return this.num_identification;
    }
    
    public void setNum_identification(int num_identification) {
        this.num_identification = num_identification;
    }
    
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
}
