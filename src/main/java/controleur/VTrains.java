package controleur;

public class VTrains {
	
	private int numtrain;
	private String nomtrain;
	private int nbwagon;
	private String date_creation_train;
	
	public VTrains(int numtrain, String nomtrain, int nbwagon, String date_creation_train) {
		this.numtrain = numtrain;
		this.nomtrain = nomtrain;
		this.nbwagon = nbwagon;
		this.date_creation_train = date_creation_train;
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

	public int getNbwagon() {
		return nbwagon;
	}

	public void setNbwagon(int nbwagon) {
		this.nbwagon = nbwagon;
	}

	public String getDate_creation_train() {
		return date_creation_train;
	}

	public void setDate_creation_train(String date_creation_train) {
		this.date_creation_train = date_creation_train;
	}

}
