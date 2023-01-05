package controleur;

public class Pays {
	
    private int idpays;
    private String nompays;
    
    public Pays(int idpays, String nompays) {
        this.idpays = idpays;
        this.nompays = nompays;
    }
    
    public Pays(String nompays) {
        this.idpays = 0;
        this.nompays = nompays;
    }
    
    public int getIdpays() {
        return this.idpays;
    }
    
    public void setIdpays(int idpays) {
        this.idpays = idpays;
    }
    
    public String getNompays() {
        return this.nompays;
    }
    
    public void setNompays(String nompays) {
        this.nompays = nompays;
    }
}
