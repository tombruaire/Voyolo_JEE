package controleur;

public class Films extends Services {

	private int reffilm;
	private String nomfilm, realisateur, duree, resume, disponible, date_sortie;

	public Films(int idservice, String nomservice, String typeservice, String telservice, int numtrain, int idgare,
			int reffilm, String nomfilm, String realisateur, String duree, String resume, String disponible,
			String date_sortie) {
		super(idservice, nomservice, typeservice, telservice, numtrain, idgare);
		this.reffilm = reffilm;
		this.nomfilm = nomfilm;
		this.realisateur = realisateur;
		this.duree = duree;
		this.resume = resume;
		this.disponible = disponible;
		this.date_sortie = date_sortie;
	}

	public Films(String nomservice, String typeservice, String telservice, int numtrain, int idgare, int reffilm,
			String nomfilm, String realisateur, String duree, String resume, String disponible, String date_sortie) {
		super(nomservice, typeservice, telservice, numtrain, idgare);
		this.reffilm = reffilm;
		this.nomfilm = nomfilm;
		this.realisateur = realisateur;
		this.duree = duree;
		this.resume = resume;
		this.disponible = disponible;
		this.date_sortie = date_sortie;
	}

	public int getReffilm() {
		return this.reffilm;
	}

	public void setReffilm(int reffilm) {
		this.reffilm = reffilm;
	}

	public String getNomfilm() {
		return this.nomfilm;
	}

	public void setNomfilm(String nomfilm) {
		this.nomfilm = nomfilm;
	}

	public String getRealisateur() {
		return this.realisateur;
	}

	public void setRealisateur(String realisateur) {
		this.realisateur = realisateur;
	}

	public String getDuree() {
		return this.duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
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
