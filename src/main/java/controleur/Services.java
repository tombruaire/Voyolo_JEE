package controleur;

public class Services {
	
    private int idservice;
    private String nomservice, typeservice, telservice;
    private int numtrain, idgare;
    
    public Services(int idservice, String nomservice, String typeservice, String telservice, int numtrain, int idgare) {
        this.idservice = idservice;
        this.nomservice = nomservice;
        this.typeservice = typeservice;
        this.telservice = telservice;
        this.numtrain = numtrain;
        this.idgare = idgare;
    }
    
    public Services(String nomservice, String typeservice, String telservice, int numtrain, int idgare) {
        this.idservice = 0;
        this.nomservice = nomservice;
        this.typeservice = typeservice;
        this.telservice = telservice;
        this.numtrain = numtrain;
        this.idgare = idgare;
    }
    
    public int getIdservice() {
        return this.idservice;
    }
    
    public void setIdservice(int idservice) {
        this.idservice = idservice;
    }
    
    public String getNomservice() {
        return this.nomservice;
    }
    
    public void setNomservice(String nomservice) {
        this.nomservice = nomservice;
    }
    
    public String getTypeservice() {
        return this.typeservice;
    }
    
    public void setTypeservice(String typeservice) {
        this.typeservice = typeservice;
    }
    
    public String getTelservice() {
        return this.telservice;
    }
    
    public void setTelservice(String telservice) {
        this.telservice = telservice;
    }
    
    public int getNumtrain() {
        return this.numtrain;
    }
    
    public void setNumtrain(int numtrain) {
        this.numtrain = numtrain;
    }
    
    public int getIdgare() {
        return this.idgare;
    }
    
    public void setIdgare(int idgare) {
        this.idgare = idgare;
    }
}
