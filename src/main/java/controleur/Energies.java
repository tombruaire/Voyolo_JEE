package controleur;

public class Energies {
	
    private int idenergie, numtrain, energie_consommee;
    
    public Energies(int idenergie, int numtrain, int energie_consommee) {
        this.idenergie = idenergie;
        this.numtrain = numtrain;
        this.energie_consommee = energie_consommee;
    }
    
    public Energies(int numtrain, int energie_consommee) {
        this.idenergie = 0;
        this.numtrain = numtrain;
        this.energie_consommee = energie_consommee;
    }
    
    public int getIdenergie() {
        return this.idenergie;
    }
    
    public void setIdenergie(int idenergie) {
        this.idenergie = idenergie;
    }
    
    public int getNumtrain() {
        return this.numtrain;
    }
    
    public void setNumtrain(int numtrain) {
        this.numtrain = numtrain;
    }
    
    public int getEnergie_consommee() {
        return this.energie_consommee;
    }
    
    public void setEnergie_consomee(int energie_consommee) {
        this.energie_consommee = energie_consommee;
    }
}
