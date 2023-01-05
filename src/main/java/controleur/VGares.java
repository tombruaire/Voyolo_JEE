package controleur;

public class VGares {
	
	private int idgare;
	private String nomgare, type, adresse;
	private int idpays;
	private String nompays;
	private int idville;
	private String nomville;
	
	public VGares(int idgare, String nomgare, String type, String adresse, int idpays, String nompays, int idville,
			String nomville) {
		this.idgare = idgare;
		this.nomgare = nomgare;
		this.type = type;
		this.adresse = adresse;
		this.idpays = idpays;
		this.nompays = nompays;
		this.idville = idville;
		this.nomville = nomville;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getIdpays() {
		return idpays;
	}

	public void setIdpays(int idpays) {
		this.idpays = idpays;
	}

	public String getNompays() {
		return nompays;
	}

	public void setNompays(String nompays) {
		this.nompays = nompays;
	}

	public int getIdville() {
		return idville;
	}

	public void setIdville(int idville) {
		this.idville = idville;
	}

	public String getNomville() {
		return nomville;
	}

	public void setNomville(String nomville) {
		this.nomville = nomville;
	}

}
