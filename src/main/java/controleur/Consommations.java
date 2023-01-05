package controleur;

public class Consommations extends Services {

	private int refarticle;
	private String article, prix;
	private int quantite;
	private String description, date_expiration, date_ajout;

	public Consommations(int idservice, String nomservice, String typeservice, String telservice, int numtrain,
			int idgare, int refarticle, String article, String prix, int quantite, String description,
			String date_expiration, String date_ajout) {
		super(idservice, nomservice, typeservice, telservice, numtrain, idgare);
		this.refarticle = refarticle;
		this.article = article;
		this.prix = prix;
		this.quantite = quantite;
		this.description = description;
		this.date_expiration = date_expiration;
		this.date_ajout = date_ajout;
	}
	
	public Consommations(int idservice, String nomservice, String typeservice, String telservice, int numtrain,
			int idgare, int refarticle, String article, String prix, int quantite, String description,
			String date_expiration) {
		super(idservice, nomservice, typeservice, telservice, numtrain, idgare);
		this.refarticle = refarticle;
		this.article = article;
		this.prix = prix;
		this.quantite = quantite;
		this.description = description;
		this.date_expiration = date_expiration;
	}
	
	public Consommations(String nomservice, String typeservice, String telservice, int numtrain, int idgare, int refarticle, String article, String prix, int quantite, String description, String date_expiration) {
        super(nomservice, typeservice, telservice, numtrain, idgare);
        this.refarticle = refarticle;
        this.article = article;
        this.prix = prix;
        this.quantite = quantite;
        this.description = description;
        this.date_expiration = date_expiration;
    }

	public Consommations(String nomservice, String typeservice, String telservice, int numtrain, int idgare,
			int refarticle, String article, String prix, int quantite, String description, String date_expiration,
			String date_ajout) {
		super(nomservice, typeservice, telservice, numtrain, idgare);
		this.refarticle = refarticle;
		this.article = article;
		this.prix = prix;
		this.quantite = quantite;
		this.description = description;
		this.date_expiration = date_expiration;
		this.date_ajout = date_ajout;
	}

	public int getRefarticle() {
		return this.refarticle;
	}

	public void setRefarticle(int refarticle) {
		this.refarticle = refarticle;
	}

	public String getArticle() {
		return this.article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getPrix() {
		return this.prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public int getQuantite() {
		return this.quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate_expiration() {
		return this.date_expiration;
	}

	public void setDate_expiration(String date_expiration) {
		this.date_expiration = date_expiration;
	}

	public String getDate_ajout() {
		return this.date_ajout;
	}

	public void setDate_ajout(String date_ajout) {
		this.date_ajout = date_ajout;
	}
}
