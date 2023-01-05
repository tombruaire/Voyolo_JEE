package controleur;

public class Villes {
	
    private int idville;
    private String nomville;
    private int idpays;
    
    public Villes(int idville, String nomville, int idpays) {
        this.idville = idville;
        this.nomville = nomville;
        this.idpays = idpays;
    }
    
    public Villes(String nomville, int idpays) {
        this.idville = 0;
        this.nomville = nomville;
        this.idpays = idpays;
    }
    
    public int getIdville() {
        return this.idville;
    }
    
    public void setIdville(int idville) {
        this.idville = idville;
    }
    
    public String getNomville() {
        return this.nomville;
    }
    
    public void setNomville(String nomville) {
        this.nomville = nomville;
    }
    
    public int getIdpays() {
        return this.idpays;
    }
    
    public void setIdpays(int idpays) {
        this.idpays = idpays;
    }
}
