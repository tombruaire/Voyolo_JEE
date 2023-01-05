package controleur;

public class VLivres {
	
	private int idservice;
	private String nomservice, typeservice, telservice;
	private int numtrain;
	private String nomtrain;
	private int idgare;
	private String nomgare;
	private int reflivre;
	private String nomlivre, auteur, edition;
	private int nbpages;
	private String resume, disponible, date_sortie;
	
	public VLivres(int idservice, String nomservice, String typeservice, String telservice, int numtrain, String nomtrain,
			int idgare, String nomgare, int reflivre, String nomlivre, String auteur, String edition,
			int nbpages, String resume, String disponible, String date_sortie) {
		this.idservice = idservice;
		this.nomservice = nomservice;
		this.typeservice = typeservice;
		this.telservice = telservice;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.idgare = idgare;
		this.nomgare = nomgare;
		this.reflivre = reflivre;
		this.nomlivre = nomlivre;
		this.auteur = auteur;
		this.edition = edition;
		this.nbpages = nbpages;
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

	public int getReflivre() {
		return reflivre;
	}

	public void setReflivre(int reflivre) {
		this.reflivre = reflivre;
	}

	public String getNomlivre() {
		return nomlivre;
	}

	public void setNomlivre(String nomlivre) {
		this.nomlivre = nomlivre;
	}

	public String getAuteur() {
		return auteur;
	}

	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public int getNbpages() {
		return nbpages;
	}

	public void setNbpages(int nbpages) {
		this.nbpages = nbpages;
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
