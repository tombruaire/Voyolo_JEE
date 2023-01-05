package controleur;

public class VReservations {
	
	private int idreservation;
	private String statut_reservation;
	private int nbpersonne, idu;
	private String nom, prenom, email, creation_compte;
	private int numtrain;
	private String nomtrain;
	
	public VReservations(int idreservation, String statut_reservation, int nbpersonne, int idu, String nom,
			String prenom, String email, String creation_compte, int numtrain, String nomtrain) {
		this.idreservation = idreservation;
		this.statut_reservation = statut_reservation;
		this.nbpersonne = nbpersonne;
		this.idu = idu;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.creation_compte = creation_compte;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
	}

	public int getIdreservation() {
		return idreservation;
	}

	public void setIdreservation(int idreservation) {
		this.idreservation = idreservation;
	}

	public String getStatut_reservation() {
		return statut_reservation;
	}

	public void setStatut_reservation(String statut_reservation) {
		this.statut_reservation = statut_reservation;
	}

	public int getNbpersonne() {
		return nbpersonne;
	}

	public void setNbpersonne(int nbpersonne) {
		this.nbpersonne = nbpersonne;
	}

	public int getIdu() {
		return idu;
	}

	public void setIdu(int idu) {
		this.idu = idu;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreation_compte() {
		return creation_compte;
	}

	public void setCreation_compte(String creation_compte) {
		this.creation_compte = creation_compte;
	}

	public int getNumtrain() {
		return numtrain;
	}

	public void setNumtrain(int numtrain) {
		this.numtrain = numtrain;
	}

	public String getNomtrain() {
		return nomtrain;
	}

	public void setNomtrain(String nomtrain) {
		this.nomtrain = nomtrain;
	}

}
