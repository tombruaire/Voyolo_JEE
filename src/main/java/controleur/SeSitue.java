package controleur;

public class SeSitue {
	
    private int idgare, idpays;
    
    public SeSitue(int idgare, int idpays) {
        this.idgare = idgare;
        this.idpays = idpays;
    }
    
    public int getIdgare() {
        return this.idgare;
    }
    
    public void setIdgare(int idgare) {
        this.idgare = idgare;
    }
    
    public int getIdpays() {
        return this.idpays;
    }
    
    public void setIdpays(int idpays) {
        this.idpays = idpays;
    }
}
