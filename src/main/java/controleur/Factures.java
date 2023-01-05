package controleur;

public class Factures {
	
    private int idfacture;
    private String date_heure_facture;
    private int idu, idreservation;
    
    public Factures(int idfacture, String date_heure_facture, int idu, int idreservation) {
        this.idfacture = idfacture;
        this.date_heure_facture = date_heure_facture;
        this.idu = idu;
        this.idreservation = idreservation;
    }
    
    public Factures(String date_heure_facture, int idu, int idreservation) {
        this.idfacture = 0;
        this.date_heure_facture = date_heure_facture;
        this.idu = idu;
        this.idreservation = idreservation;
    }
    
    public int getIdfacture() {
        return this.idfacture;
    }
    
    public void setIdfacture(int idfacture) {
        this.idfacture = idfacture;
    }
    
    public String getDate_heure_facture() {
        return this.date_heure_facture;
    }
    
    public void setDate_heure_facture(String date_heure_facture) {
        this.date_heure_facture = date_heure_facture;
    }
    
    public int getIdu() {
        return this.idu;
    }
    
    public void setIdu(int idu) {
        this.idu = idu;
    }
    
    public int getIdreservation() {
        return this.idreservation;
    }
    
    public void setIdreservation(int idreservation) {
        this.idreservation = idreservation;
    }
}
