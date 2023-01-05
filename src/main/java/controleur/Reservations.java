package controleur;

public class Reservations {
	
    private int idreservation;
    private String statut_reservation;
    private int nbpersonne, idu, numtrain;
    
    public Reservations(int idreservation, String statut_reservation, int nbpersonne, int idu, int numtrain) {
        this.idreservation = idreservation;
        this.statut_reservation = statut_reservation;
        this.nbpersonne = nbpersonne;
        this.idu = idu;
        this.numtrain = numtrain;
    }
    
    public Reservations(String statut_reservation, int nbpersonne, int idu, int numtrain) {
        this.idreservation = 0;
        this.statut_reservation = statut_reservation;
        this.nbpersonne = nbpersonne;
        this.idu = idu;
        this.numtrain = numtrain;
    }
    
    public int getIdreservation() {
        return this.idreservation;
    }
    
    public void setIdreservation(int idreservation) {
        this.idreservation = idreservation;
    }
    
    public String getStatut_reservation() {
        return this.statut_reservation;
    }
    
    public void setStatut_reservation(String statut_reservation) {
        this.statut_reservation = statut_reservation;
    }
    
    public int getNbpersonne() {
        return this.nbpersonne;
    }
    
    public void setNbpersonne(int nbpersonne) {
        this.nbpersonne = nbpersonne;
    }
    
    public int getIdu() {
        return this.idu;
    }
    
    public void setIdu(int idu) {
        this.idu = idu;
    }
    
    public int getNumtrain() {
        return this.numtrain;
    }
    
    public void setNumtrain(int numtrain) {
        this.numtrain = numtrain;
    }
}
