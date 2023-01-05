package controleur;

public class Gares {
	
    private int idgare;
    private String nomgare, type, adresse;
    private int idpays, idville;
    
    public Gares(int idgare, String nomgare, String type, String adresse, int idpays, int idville) {
        this.idgare = idgare;
        this.nomgare = nomgare;
        this.type = type;
        this.adresse = adresse;
        this.idpays = idpays;
        this.idville = idville;
    }
    
    public Gares(String nomgare, String type, String adresse, int idpays, int idville) {
        this.idgare = 0;
        this.nomgare = nomgare;
        this.type = type;
        this.adresse = adresse;
        this.idpays = idpays;
        this.idville = idville;
    }
    
    public int getIdgare() {
        return this.idgare;
    }
    
    public void setIdgare(int idgare) {
        this.idgare = idgare;
    }
    
    public String getNomgare() {
        return this.nomgare;
    }
    
    public void setNomgare(String nomgare) {
        this.nomgare = nomgare;
    }
    
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getAdresse() {
        return this.adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    
    public int getIdpays() {
        return this.idpays;
    }
    
    public void setIdpays(int idpays) {
        this.idpays = idpays;
    }
    
    public int getIdville() {
        return this.idville;
    }
    
    public void setIdville(int idville) {
        this.idville = idville;
    }
}
