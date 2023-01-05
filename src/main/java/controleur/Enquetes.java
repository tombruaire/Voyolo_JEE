package controleur;

public class Enquetes {
	
    private int idenquete;
    private String nom_enquete, description, date_creation_enquete;
    
    public Enquetes(int idenquete, String nom_enquete, String description, String date_creation_enquete) {
        this.idenquete = idenquete;
        this.nom_enquete = nom_enquete;
        this.description = description;
        this.date_creation_enquete = date_creation_enquete;
    }
    
    public Enquetes(int idenquete, String nom_enquete, String description) {
        this.idenquete = idenquete;
        this.nom_enquete = nom_enquete;
        this.description = description;
    }
    
    public Enquetes(String nom_enquete, String description, String date_creation_enquete) {
        this.idenquete = 0;
        this.nom_enquete = nom_enquete;
        this.description = description;
        this.date_creation_enquete = date_creation_enquete;
    }
    
    public Enquetes(String nom_enquete, String description) {
        this.idenquete = 0;
        this.nom_enquete = nom_enquete;
        this.description = description;
    }
    
    public int getIdenquete() {
        return this.idenquete;
    }
    
    public void setIdenquete(int idenquete) {
        this.idenquete = idenquete;
    }
    
    public String getNom_enquete() {
        return this.nom_enquete;
    }
    
    public void setNom_enquete(String nom_enquete) {
        this.nom_enquete = nom_enquete;
    }
    
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getDate_creation_enquete() {
        return this.date_creation_enquete;
    }
    
    public void setDate_creation_enquete(String date_creation_enquete) {
        this.date_creation_enquete = date_creation_enquete;
    }
}
