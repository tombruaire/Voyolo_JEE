package controleur;

public class Trains {
	
    private int numtrain;
    private String nomtrain;
    private int nbwagon;
    private String date_creation_train;
    
    public Trains(int numtrain, String nomtrain, int nbwagon, String date_creation_train) {
        this.numtrain = numtrain;
        this.nomtrain = nomtrain;
        this.nbwagon = nbwagon;
        this.date_creation_train = date_creation_train;
    }
    
    public Trains(int numtrain, String nomtrain, int nbwagon) {
        this.numtrain = numtrain;
        this.nomtrain = nomtrain;
        this.nbwagon = nbwagon;
    }
    
    public Trains(String nomtrain, int nbwagon, String date_creation_train) {
        this.numtrain = 0;
        this.nomtrain = nomtrain;
        this.nbwagon = nbwagon;
        this.date_creation_train = date_creation_train;
    }
    
    public Trains(String nomtrain, int nbwagon) {
        this.numtrain = 0;
        this.nomtrain = nomtrain;
        this.nbwagon = nbwagon;
    }
    
    public int getNumtrain() {
        return this.numtrain;
    }
    
    public void setNumtrain(int numtrain) {
        this.numtrain = numtrain;
    }
    
    public String getNomtrain() {
        return this.nomtrain;
    }
    
    public void setNomtrain(String nomtrain) {
        this.nomtrain = nomtrain;
    }
    
    public int getNbwagon() {
        return this.nbwagon;
    }
    
    public void setNbwagon(int nbwagon) {
        this.nbwagon = nbwagon;
    }
    
    public String getDate_creation_train() {
        return this.date_creation_train;
    }
    
    public void setDate_creation_train(String date_creation_train) {
        this.date_creation_train = date_creation_train;
    }
}
