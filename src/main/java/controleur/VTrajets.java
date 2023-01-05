package controleur;

public class VTrajets {
	
	private int idtrajet, numtrain;
	private String nomtrain;
	private int idgare1;
	private String gare_depart, date_depart, heure_depart;
	private int idgare2;
	private String gare_arrivee, date_arrivee, heure_arrivee, duree, prix, quai;
	
	public VTrajets(int idtrajet, int numtrain, String nomtrain, int idgare1, String gare_depart, String date_depart,
			String heure_depart, int idgare2, String gare_arrivee, String date_arrivee, String heure_arrivee,
			String duree, String prix, String quai) {
		this.idtrajet = idtrajet;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.idgare1 = idgare1;
		this.gare_depart = gare_depart;
		this.date_depart = date_depart;
		this.heure_depart = heure_depart;
		this.idgare2 = idgare2;
		this.gare_arrivee = gare_arrivee;
		this.date_arrivee = date_arrivee;
		this.heure_arrivee = heure_arrivee;
		this.duree = duree;
		this.prix = prix;
		this.quai = quai;
	}

	public int getIdtrajet() {
		return idtrajet;
	}

	public void setIdtrajet(int idtrajet) {
		this.idtrajet = idtrajet;
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

	public int getIdgare1() {
		return idgare1;
	}

	public void setIdgare1(int idgare1) {
		this.idgare1 = idgare1;
	}

	public String getGare_depart() {
		return gare_depart;
	}

	public void setGare_depart(String gare_depart) {
		this.gare_depart = gare_depart;
	}

	public String getDate_depart() {
		return date_depart;
	}

	public void setDate_depart(String date_depart) {
		this.date_depart = date_depart;
	}

	public String getHeure_depart() {
		return heure_depart;
	}

	public void setHeure_depart(String heure_depart) {
		this.heure_depart = heure_depart;
	}

	public int getIdgare2() {
		return idgare2;
	}

	public void setIdgare2(int idgare2) {
		this.idgare2 = idgare2;
	}

	public String getGare_arrivee() {
		return gare_arrivee;
	}

	public void setGare_arrivee(String gare_arrivee) {
		this.gare_arrivee = gare_arrivee;
	}

	public String getDate_arrivee() {
		return date_arrivee;
	}

	public void setDate_arrivee(String date_arrivee) {
		this.date_arrivee = date_arrivee;
	}

	public String getHeure_arrivee() {
		return heure_arrivee;
	}

	public void setHeure_arrivee(String heure_arrivee) {
		this.heure_arrivee = heure_arrivee;
	}

	public String getDuree() {
		return duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public String getQuai() {
		return quai;
	}

	public void setQuai(String quai) {
		this.quai = quai;
	}

}
