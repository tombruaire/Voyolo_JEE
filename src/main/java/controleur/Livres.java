package controleur;

public class Livres extends Services {

	private int reflivre;
	private String nomlivre, auteur, edition;
	private int nbpages;
	private String resume, disponible, date_sortie;

	public Livres(int idservice, String nomservice, String typeservice, String telservice, int numtrain, int idgare,
			int reflivre, String nomlivre, String auteur, String edition, int nbpages, String resume,
			String disponible, String date_sortie) {
		super(idservice, nomservice, typeservice, telservice, numtrain, idgare);
		this.reflivre = reflivre;
		this.nomlivre = nomlivre;
		this.auteur = auteur;
		this.edition = edition;
		this.nbpages = nbpages;
		this.resume = resume;
		this.disponible = disponible;
		this.date_sortie = date_sortie;
	}

	public Livres(String nomservice, String typeservice, String telservice, int numtrain, int idgare, int reflivre,
			String nomlivre, String auteur, String edition, int nbpages, String resume, String disponible,
			String date_sortie) {
		super(nomservice, typeservice, telservice, numtrain, idgare);
		this.reflivre = reflivre;
		this.nomlivre = nomlivre;
		this.auteur = auteur;
		this.edition = edition;
		this.nbpages = nbpages;
		this.resume = resume;
		this.disponible = disponible;
		this.date_sortie = date_sortie;
	}

	public int getReflivre() {
		return this.reflivre;
	}

	public void setReflivre(int reflivre) {
		this.reflivre = reflivre;
	}

	public String getNomlivre() {
		return this.nomlivre;
	}

	public void setNomlivre(String nomlivre) {
		this.nomlivre = nomlivre;
	}

	public String getAuteur() {
		return this.auteur;
	}

	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	public String getEdition() {
		return this.edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public int getNbpages() {
		return this.nbpages;
	}

	public void setNbpages(int nbpages) {
		this.nbpages = nbpages;
	}

	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getDisponible() {
		return this.disponible;
	}

	public void setDisponible(String disponible) {
		this.disponible = disponible;
	}

	public String getDate_sortie() {
		return this.date_sortie;
	}

	public void setDate_sortie(String date_sortie) {
		this.date_sortie = date_sortie;
	}
}
