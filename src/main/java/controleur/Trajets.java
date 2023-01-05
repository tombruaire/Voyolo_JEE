package controleur;

public class Trajets {

	private int idtrajet, numtrain, idgare1;
	private String date_depart, heure_depart;
	private int idgare2;
	private String date_arrivee, heure_arrivee, duree, prix, quai;

	public Trajets(int idtrajet, int numtrain, int idgare1, String date_depart, String heure_depart, int idgare2,
			String date_arrivee, String heure_arrivee, String duree, String prix, String quai) {
		this.idtrajet = idtrajet;
		this.numtrain = numtrain;
		this.idgare1 = idgare1;
		this.date_depart = date_depart;
		this.heure_depart = heure_depart;
		this.idgare2 = idgare2;
		this.date_arrivee = date_arrivee;
		this.heure_arrivee = heure_arrivee;
		this.duree = duree;
		this.prix = prix;
		this.quai = quai;
	}

	public Trajets(int numtrain, int idgare1, String date_depart, String heure_depart, int idgare2, String date_arrivee,
			String heure_arrivee, String duree, String prix, String quai) {
		this.idtrajet = 0;
		this.numtrain = numtrain;
		this.idgare1 = idgare1;
		this.date_depart = date_depart;
		this.heure_depart = heure_depart;
		this.idgare2 = idgare2;
		this.date_arrivee = date_arrivee;
		this.heure_arrivee = heure_arrivee;
		this.duree = duree;
		this.prix = prix;
		this.quai = quai;
	}

	public int getIdtrajet() {
		return this.idtrajet;
	}

	public void setIdtrajet(int idtrajet) {
		this.idtrajet = idtrajet;
	}

	public int getNumtrain() {
		return this.numtrain;
	}

	public void setNumtrain(int numtrain) {
		this.numtrain = numtrain;
	}

	public int getIdgare1() {
		return this.idgare1;
	}

	public void setIdgare1(int idgare1) {
		this.idgare1 = idgare1;
	}

	public String getDate_depart() {
		return this.date_depart;
	}

	public void setDate_depart(String date_depart) {
		this.date_depart = date_depart;
	}

	public String getHeure_depart() {
		return this.heure_depart;
	}

	public void setHeure_depart(String heure_depart) {
		this.heure_depart = heure_depart;
	}

	public int getIdgare2() {
		return this.idgare2;
	}

	public void setIdgare2(int idgare2) {
		this.idgare2 = idgare2;
	}

	public String getDate_arrivee() {
		return this.date_arrivee;
	}

	public void setDate_arrivee(String date_arrivee) {
		this.date_arrivee = date_arrivee;
	}

	public String getHeure_arrivee() {
		return this.heure_arrivee;
	}

	public void setHeure_arrivee(String heure_arrivee) {
		this.heure_arrivee = heure_arrivee;
	}

	public String getDuree() {
		return this.duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
	}

	public String getPrix() {
		return this.prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public String getQuai() {
		return this.quai;
	}

	public void setQuai(String quai) {
		this.quai = quai;
	}
}
