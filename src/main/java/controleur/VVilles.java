package controleur;

public class VVilles {
	
	private int idville;
	private String nomville;
	private int idpays;
	private String nompays;
	
	public VVilles(int idville, String nomville, int idpays, String nompays) {
		this.idville = idville;
		this.nomville = nomville;
		this.idpays = idpays;
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

}
