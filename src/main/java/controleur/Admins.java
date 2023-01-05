package controleur;

public class Admins extends Users {
	
    private int num_identification;
    private String type;
    
    public Admins(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, int num_identification, String type) {
        super(idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte);
        this.num_identification = num_identification;
        this.type = type;
    }
    
    public Admins(int idu, String nom, String prenom, String pseudo, String email, String mdp, String role, int num_identification, String type) {
        super(idu, nom, prenom, pseudo, email, mdp, role);
        this.num_identification = num_identification;
        this.type = type;
    }
    
    public Admins(String nom, String prenom, String pseudo, String email, String mdp, String role, int nbTentatives, int nbConnexion, int bloque, String last_connexion, String last_deconnexion, String creation_compte, int num_identification, String type) {
        super(nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte);
        this.num_identification = num_identification;
        this.type = type;
    }
    
    public Admins(String nom, String prenom, String pseudo, String email, String mdp, String role, int num_identification, String type) {
        super(nom, prenom, pseudo, email, mdp, role);
        this.num_identification = num_identification;
        this.type = type;
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
