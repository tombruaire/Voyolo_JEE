package controleur;

public class VEnergies {
	
	private int idenergie, numtrain;
	private String nomtrain;
	private int energie_consommee;
	
	public VEnergies(int idenergie, int numtrain, String nomtrain, int energie_consommee) {
		this.idenergie = idenergie;
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.energie_consommee = energie_consommee;
	}
	
	public int getIdenergie() {
		return idenergie;
	}

	public void setIdenergie(int idenergie) {
		this.idenergie = idenergie;
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

	public int getEnergie_consommee() {
		return energie_consommee;
	}

	public void setEnergie_consommee(int energie_consommee) {
		this.energie_consommee = energie_consommee;
	}

}
