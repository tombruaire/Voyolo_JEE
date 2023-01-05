package controleur;

public class VFilms {
	
	private int idservice;
	private String nomservice, typeservice, telservice;
	private int numtrain;
	private String nomtrain;
	private int idgare;
	private String nomgare;
	private int reffilm;
	private String nomfilm, realisateur, duree, resume, disponible, date_sortie;
	
	public VFilms(int idservice, String nomservice, String typeservice, String telservice, 
			int numtrain, String nomtrain, int idgare, String nomgare,
			int reffilm, String nomfilm, String realisateur, String duree, String resume, 
			String disponible, String date_sortie) {
		this.idservice = idservice;
		this.nomservice = nomservice;
		this.typeservice = typeservice;
		this.telservice = telservice;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.idgare = idgare;
		this.nomgare = nomgare;
		this.reffilm = reffilm;
		this.nomfilm = nomfilm;
		this.realisateur = realisateur;
		this.duree = duree;
		this.resume = resume;
		this.disponible = disponible;
		this.date_sortie = date_sortie;
	}

	public int getIdservice() {
		return idservice;
	}

	public void setIdservice(int idservice) {
		this.idservice = idservice;
	}

	public String getNomservice() {
		return nomservice;
	}

	public void setNomservice(String nomservice) {
		this.nomservice = nomservice;
	}

	public String getTypeservice() {
		return typeservice;
	}

	public void setTypeservice(String typeservice) {
		this.typeservice = typeservice;
	}

	public String getTelservice() {
		return telservice;
	}

	public void setTelservice(String telservice) {
		this.telservice = telservice;
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

	public int getIdgare() {
		return idgare;
	}

	public void setIdgare(int idgare) {
		this.idgare = idgare;
	}

	public String getNomgare() {
		return nomgare;
	}

	public void setNomgare(String nomgare) {
		this.nomgare = nomgare;
	}

	public int getReffilm() {
		return reffilm;
	}

	public void setReffilm(int reffilm) {
		this.reffilm = reffilm;
	}

	public String getNomfilm() {
		return nomfilm;
	}

	public void setNomfilm(String nomfilm) {
		this.nomfilm = nomfilm;
	}

	public String getRealisateur() {
		return realisateur;
	}

	public void setRealisateur(String realisateur) {
		this.realisateur = realisateur;
	}

	public String getDuree() {
		return duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getDisponible() {
		return disponible;
	}

	public void setDisponible(String disponible) {
		this.disponible = disponible;
	}

	public String getDate_sortie() {
		return date_sortie;
	}

	public void setDate_sortie(String date_sortie) {
		this.date_sortie = date_sortie;
	}

}
