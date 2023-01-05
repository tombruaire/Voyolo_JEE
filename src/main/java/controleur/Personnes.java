package controleur;

public class Personnes {
	
    private int idpers;
    private String sexe, nom, prenom, age, datenaissance, email, tel, adresse, type, score;
    
    public Personnes(int idpers, String sexe, String nom, String prenom, String age, String datenaissance, String email, String tel, String adresse, String type, String score) {
        this.idpers = idpers;
        this.sexe = sexe;
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.datenaissance = datenaissance;
        this.email = email;
        this.tel = tel;
        this.adresse = adresse;
        this.type = type;
        this.score = score;
    }
    
    public Personnes(String sexe, String nom, String prenom, String age, String datenaissance, String email, String tel, String adresse, String type, String score) {
        this.idpers = 0;
        this.sexe = sexe;
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.datenaissance = datenaissance;
        this.email = email;
        this.tel = tel;
        this.adresse = adresse;
        this.type = type;
        this.score = score;
    }
    
    public int getIdpers() {
        return this.idpers;
    }
    
    public void setIdpers(int idpers) {
        this.idpers = idpers;
    }
    
    public String getSexe() {
        return this.sexe;
    }
    
    public void setSexe(String sexe) {
        this.sexe = sexe;
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
    
    public String getAge() {
        return this.age;
    }
    
    public void setAge(String age) {
        this.age = age;
    }
    
    public String getDatenaissance() {
        return this.datenaissance;
    }
    
    public void setDatenaissance(String datenaissance) {
        this.datenaissance = datenaissance;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getScore() {
        return this.score;
    }
    
    public void setScore(String score) {
        this.score = score;
    }
}
