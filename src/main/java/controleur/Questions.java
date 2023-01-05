package controleur;

public class Questions {
	
    private int idquestion;
    private String enonce;
    
    public Questions(int idquestion, String enonce) {
        this.idquestion = idquestion;
        this.enonce = enonce;
    }
    
    public Questions(String enonce) {
        this.idquestion = 0;
        this.enonce = enonce;
    }
    
    public int getIdquestion() {
        return this.idquestion;
    }
    
    public void setIdquestion(int idquestion) {
        this.idquestion = idquestion;
    }
    
    public String getEnonce() {
        return this.enonce;
    }
    
    public void setEnonce(String enonce) {
        this.enonce = enonce;
    }
}
