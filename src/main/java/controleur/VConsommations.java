package controleur;

public class VConsommations {
	
	private int idservice;
	private String nomservice, typservice, telservice;
	private int numtrain;
	private String nomtrain;
	private int idgare;
	private String nomgare;
	private int refarticle;
	private String article, prix;
	private int quantite;
	private String description, date_expiration, date_ajout;
	
	public VConsommations(int idservice, String nomservice, String typeservice, String telservice, int numtrain, String nomtrain, int idgare, String nomgare, 
			int refarticle, String article, String prix, int quantite, String description, String date_expiration, String date_ajout) {
		this.idservice = idservice;
		this.nomservice = nomservice;
		this.typservice = typeservice;
		this.telservice = telservice;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.idgare = idgare;
		this.nomgare = nomgare;
		this.refarticle = refarticle;
		this.article = article;
		this.prix = prix;
		this.quantite = quantite;
		this.description = description;
		this.date_expiration = date_expiration;
		this.date_ajout = date_ajout;
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

	public int getRefarticle() {
		return refarticle;
	}

	public void setRefarticle(int refarticle) {
		this.refarticle = refarticle;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate_expiration() {
		return date_expiration;
	}

	public void setDate_expiration(String date_expiration) {
		this.date_expiration = date_expiration;
	}

	public String getDate_ajout() {
		return date_ajout;
	}

	public void setDate_ajout(String date_ajout) {
		this.date_ajout = date_ajout;
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

	public String getTypservice() {
		return typservice;
	}

	public void setTypservice(String typservice) {
		this.typservice = typservice;
	}

}
