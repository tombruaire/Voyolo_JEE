package controleur;

public class VEnquetes {
	
	private int idenquete;
	private String nom_enquete, description, date_creation_enquete;
	
	public VEnquetes(int idenquete, String nom_enquete, String description, String date_creation_enquete) {
		this.idenquete = idenquete;
		this.nom_enquete = nom_enquete;
		this.description = description;
		this.date_creation_enquete = date_creation_enquete;
	}

	public int getIdenquete() {
		return idenquete;
	}

	public void setIdenquete(int idenquete) {
		this.idenquete = idenquete;
	}

	public String getNom_enquete() {
		return nom_enquete;
	}

	public void setNom_enquete(String nom_enquete) {
		this.nom_enquete = nom_enquete;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate_creation_enquete() {
		return date_creation_enquete;
	}

	public void setDate_creation_enquete(String date_creation_enquete) {
		this.date_creation_enquete = date_creation_enquete;
	}

}
