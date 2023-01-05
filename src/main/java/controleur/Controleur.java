package controleur;

import java.util.ArrayList;

import modele.Modele;

import static java.lang.System.out;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Controleur {
	
	/*** INSERT ***/
	public static void insertAdmin (Admins unAdmin) {
		if (!unAdmin.getNom().equals("")) {
			if (!unAdmin.getPrenom().equals("")) {
				if (!unAdmin.getPseudo().equals("")) {
					if (!unAdmin.getEmail().equals("")) {
						if (!unAdmin.getMdp().equals("")) {
							if (!unAdmin.getRole().equals("")) {
								if (unAdmin.getNum_identification() > 10000000 && unAdmin.getNum_identification() < 99999999) {
									if (!unAdmin.getType().equals("")) {
										Modele.insertAdmin(unAdmin);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void insertClient (Clients unClient) {
		if (!unClient.getNom().equals("")) {
			if (!unClient.getPrenom().equals("")) {
				if (!unClient.getPseudo().equals("")) {
					if (!unClient.getEmail().equals("")) {
						if (!unClient.getMdp().equals("")) {
							if (!unClient.getRole().equals("")) {
								if (!unClient.getTel().equals("")) {
									if (!unClient.getAdresse().equals("")) {
										if (!unClient.getCarte_avantage().equals("")) {
											Modele.insertClient(unClient);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void insertConsommation (Consommations uneConsommation) {
		if (!uneConsommation.getNomservice().equals("")) {
			if (!uneConsommation.getTypeservice().equals("")) {
				if (!uneConsommation.getTelservice().equals("")) {
					if (!uneConsommation.getArticle().equals("")) {
						if (!uneConsommation.getPrix().equals("")) {
							if (!uneConsommation.getDescription().equals("")) {
								Modele.insertConsommation(uneConsommation);
							}
						}
					}
				}
			}
		}
	}
	public static void insertEnergie (Energies uneEnergie) {
		Modele.insertEnergie(uneEnergie);
	}
	public static void insertEnquete (Enquetes uneEnquete) {
		if (!uneEnquete.getNom_enquete().equals("")) {
			if (!uneEnquete.getDescription().equals("")) {
				Modele.insertEnquete(uneEnquete);
			}
		}
	}
	public static void insertFilm (Films unFilm) {
		if (!unFilm.getNomservice().equals("")) {
			if (!unFilm.getTypeservice().equals("")) {
				if (!unFilm.getTelservice().equals("")) {
					if (unFilm.getReffilm() > 0) {
						if (!unFilm.getNomfilm().equals("")) {
							if (!unFilm.getRealisateur().equals("")) {
								if (!unFilm.getDuree().equals("")) {
									if (!unFilm.getResume().equals("")) {
										Modele.insertFilm(unFilm);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void insertGare (Gares uneGare) {
		if (!uneGare.getNomgare().equals("")) {
			if (!uneGare.getType().equals("")) {
				if (!uneGare.getAdresse().equals("")) {
					Modele.insertGare(uneGare);
				}
			}
		}
	}
	public static void insertLivre (Livres unLivre) {
		if (!unLivre.getNomservice().equals("")) {
			if (!unLivre.getTypeservice().equals("")) {
				if (!unLivre.getTelservice().equals("")) {
					if (unLivre.getReflivre() > 0) {
						if (!unLivre.getNomlivre().equals("")) {
							if (!unLivre.getAuteur().equals("")) {
								if (!unLivre.getEdition().equals("")) {
									if (!unLivre.getResume().equals("")) {
										Modele.insertLivre(unLivre);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void insertPays (Pays unPays) {
		if (!unPays.getNompays().equals("")) {
			Modele.insertPays(unPays);
		}
	}
	public static void insertQuestion (Questions uneQuestion) {
		if (!uneQuestion.getEnonce().equals("")) {
			Modele.insertQuestion(uneQuestion);
		}
	}
	public static void insertReservation (Reservations uneReservation) {
		if (!uneReservation.getStatut_reservation().equals("")) {
			Modele.insertReservation(uneReservation);
		}
	}
	public static void insertTrain (Trains unTrain) {
		if (!unTrain.getNomtrain().equals("")) {
			if (unTrain.getNbwagon() > 0) {
				Modele.insertTrain(unTrain);
			}
		}
	}
	public static void insertTrajet (Trajets unTrajet) {
		if (!unTrajet.getQuai().equals("")) {
			Modele.insertTrajet(unTrajet);
		}
	}
	public static void insertVille (Villes uneVille) {
		if (!uneVille.getNomville().equals("")) {
			Modele.insertVilles(uneVille);
		}
	}
	
	/*** UPDATE ***/
	public static void updateAdmin (Admins unAdmin) {
		if (!unAdmin.getNom().equals("")) {
			if (!unAdmin.getPrenom().equals("")) {
				if (!unAdmin.getPseudo().equals("")) {
					if (!unAdmin.getEmail().equals("")) {
						if (!unAdmin.getMdp().equals("")) {
							if (!unAdmin.getRole().equals("")) {
								if (unAdmin.getNum_identification() > 10000000 && unAdmin.getNum_identification() < 99999999) {
									if (!unAdmin.getType().equals("")) {
										Modele.updateAdmin(unAdmin);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void updateClient (Clients unClient) {
		if (!unClient.getNom().equals("")) {
			if (!unClient.getPrenom().equals("")) {
				if (!unClient.getPseudo().equals("")) {
					if (!unClient.getEmail().equals("")) {
						if (!unClient.getMdp().equals("")) {
							if (!unClient.getRole().equals("")) {
								if (!unClient.getTel().equals("")) {
									if (!unClient.getAdresse().equals("")) {
										if (!unClient.getCarte_avantage().equals("")) {
											Modele.updateClient(unClient);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void updateConsommation (Consommations uneConsommation) {
		if (!uneConsommation.getNomservice().equals("")) {
			if (!uneConsommation.getTypeservice().equals("")) {
				if (!uneConsommation.getTelservice().equals("")) {
					if (!uneConsommation.getArticle().equals("")) {
						if (!uneConsommation.getPrix().equals("")) {
							if (!uneConsommation.getDescription().equals("")) {
								Modele.updateConsommation(uneConsommation);
							}
						}
					}
				}
			}
		}
	}
	public static void updateEnergie (Energies uneEnergie) {
		Modele.updateEnergie(uneEnergie);
	}
	public static void updateEnquete (Enquetes uneEnquete) {
		if (!uneEnquete.getNom_enquete().equals("")) {
			if (!uneEnquete.getDescription().equals("")) {
				Modele.updateEnquete(uneEnquete);
			}
		}
	}
	public static void updateFilm (Films unFilm) {
		if (!unFilm.getNomservice().equals("")) {
			if (!unFilm.getTypeservice().equals("")) {
				if (!unFilm.getTelservice().equals("")) {
					if (unFilm.getReffilm() > 0) {
						if (!unFilm.getNomfilm().equals("")) {
							if (!unFilm.getRealisateur().equals("")) {
								if (!unFilm.getDuree().equals("")) {
									if (!unFilm.getResume().equals("")) {
										Modele.updateFilm(unFilm);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void updateGare (Gares uneGare) {
		if (!uneGare.getNomgare().equals("")) {
			if (!uneGare.getType().equals("")) {
				if (!uneGare.getAdresse().equals("")) {
					Modele.updateGare(uneGare);
				}
			}
		}
	}
	public static void updateLivre (Livres unLivre) {
		if (!unLivre.getNomservice().equals("")) {
			if (!unLivre.getTypeservice().equals("")) {
				if (!unLivre.getTelservice().equals("")) {
					if (unLivre.getReflivre() > 0) {
						if (!unLivre.getNomlivre().equals("")) {
							if (!unLivre.getAuteur().equals("")) {
								if (!unLivre.getEdition().equals("")) {
									if (!unLivre.getResume().equals("")) {
										Modele.updateLivre(unLivre);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	public static void updatePays (Pays unPays) {
		if (!unPays.getNompays().equals("")) {
			Modele.updatePays(unPays);
		}
	}
	public static void updateQuestion (Questions uneQuestion) {
		if (!uneQuestion.getEnonce().equals("")) {
			Modele.updateQuestion(uneQuestion);
		}
	}
	public static void updateReservation (Reservations uneReservation) {
		if (!uneReservation.getStatut_reservation().equals("")) {
			Modele.updateReservation(uneReservation);
		}
	}
	public static void updateTrain (Trains unTrain) {
		if (!unTrain.getNomtrain().equals("")) {
			if (unTrain.getNbwagon() > 0) {
				Modele.updateTrain(unTrain);
			}
		}
	}
	public static void updateTrajet (Trajets unTrajet) {
		if (!unTrajet.getQuai().equals("")) {
			Modele.updateTrajet(unTrajet);
		}
	}
	public static void updateVille (Villes uneVille) {
		if (!uneVille.getNomville().equals("")) {
			Modele.updateVilles(uneVille);
		}
	}
	
	/*** DELETE ***/
	public static void deleteAdmin (int idu) {
		Modele.deleteAdmin(idu);
	}
	public static void deleteClient (int idu) {
		Modele.deleteClient(idu);
	}
	public static void deleteConsommation (int idservice, int refarticle) {
		Modele.deleteConsommation(idservice, refarticle);
	}
	public static void deleteEnergie (int idenergie, int numtrain) {
		Modele.deleteEnergie(idenergie, numtrain);
	}
	public static void deleteEnquete (int idenquete) {
		Modele.deleteEnquete(idenquete);
	}
	public static void deleteFilm (int idservice, int reffilm) {
		Modele.deleteFilm(idservice, reffilm);
	}
	public static void deleteGare (int idgare) {
		Modele.deleteGare(idgare);
	}
	public static void deleteLivre (int idservice, int reflivre) {
		Modele.deleteLivre(idservice, reflivre);
	}
	public static void deletePays (int idpays) {
		Modele.deletePays(idpays);
	}
	public static void deleteQuestion (int idquestion) {
		Modele.deleteQuestion(idquestion);
	}
	public static void deleteReservation (int idreservation) {
		Modele.deleteReservation(idreservation);
	}
	public static void deleteTrain (int numtrain) {
		Modele.deleteTrain(numtrain);
	}
	public static void deleteTrajet (int idtrajet) {
		Modele.deleteTrajet(idtrajet);
	}
	public static void deleteVille (int idville) {
		Modele.deleteVille(idville);
	}
	
	/*** deleteAll ***/
	public static void deleteAllAdmins () {
		Modele.deleteAllAdmins();
	}
	public static void deleteAllClients () {
		Modele.deleteAllClients();
	}
	public static void deleteAllConsommations () {
		Modele.deleteAllConsommations();
	}
	public static void deleteAllEnergies () {
		Modele.deleteAllEnergies();
	}
	public static void deleteAllEnquetes () {
		Modele.deleteAllEnquetes();
	}
	public static void deleteAllFilms () {
		Modele.deleteAllFilms();
	}
	public static void deleteAllGares () {
		Modele.deleteAllGares();
	}
	public static void deleteAllLivres () {
		Modele.deleteAllLivres();
	}
	public static void deleteAllPays () {
		Modele.deleteAllPays();
	}
	public static void deleteAllQuestions () {
		Modele.deleteAllQuestions();
	}
	public static void deleteAllReservations () {
		Modele.deleteAllReservations();
	}
	public static void deleteAllTrains () {
		Modele.deleteAllTrains();
	}
	public static void deleteAllTrajets () {
		Modele.deleteAllTrajets();
	}
	public static void deleteAllVilles () {
		Modele.deleteAllVilles();
	}
	
	/*** selectAll ***/
	public static ArrayList<String> selectAllTables () {
		return Modele.selectAllTables();
	}
	public static ArrayList<VAdmins> selectAllAdmins () {
		return Modele.selectAllAdmins();
	}
	public static ArrayList<VClients> selectAllClients () {
		return Modele.selectAllClients();
	}
	public static ArrayList<VConsommations> selectAllConsommations () {
		return Modele.selectAllConsommations();
	}
	public static ArrayList<VEnergies> selectAllEnergies () {
		return Modele.selectAllEnergies();
	}
	public static ArrayList<VEnquetes> selectAllEnquetes () {
		return Modele.selectAllEnquetes();
	}
	public static ArrayList<VFilms> selectAllFilms () {
		return Modele.selectAllFilms();
	}
	public static ArrayList<VGares> selectAllGares () {
		return Modele.selectAllGares();
	}
	public static ArrayList<VGares> selectAllGaresSelect () {
		return Modele.selectAllGaresSelect();
	}
	public static ArrayList<VLivres> selectAllLivres () {
		return Modele.selectAllLivres();
	}
	public static ArrayList<Pays> selectAllPays () {
		return Modele.selectAllPays();
	}
	public static ArrayList<Pays> selectAllPaysSelect () {
		return Modele.selectAllPaysSelect();
	}
	public static ArrayList<Questions> selectAllQuestions () {
		return Modele.selectAllQuestions();
	}
	public static ArrayList<VReservations> selectAllReservations () {
		return Modele.selectAllReservations();
	}
	public static ArrayList<VTrains> selectAllTrains () {
		return Modele.selectAllTrains();
	}
	public static ArrayList<VTrains> selectAllTrainsSelect () {
		return Modele.selectAllTrainsSelect();
	}
	public static ArrayList<VTrajets> selectAllTrajets () {
		return Modele.selectAllTrajets();
	}
	public static ArrayList<VVilles> selectAllVilles () {
		return Modele.selectAllVilles();
	}
	public static ArrayList<VVilles> selectAllVillesSelect () {
		return Modele.selectAllVillesSelect();
	}
	public static ArrayList<Users> selectAllUsers () {
		return Modele.selectAllUsers();
	}
	
	/*** selectWhere ***/
	public static Admins selectWhereAdmin (int idu) {
		return Modele.selectWhereAdmin(idu);
	}
	public static Clients selectWhereClient (int idu) {
		return Modele.selectWhereClient(idu);
	}
	public static VConsommations selectWhereConsommation (int idservice, int refarticle) {
		return Modele.selectWhereConsommation(idservice, refarticle);
	}
	public static Energies selectWhereEnergie (int idenergie, int numtrain) {
		return Modele.selectWhereEnergie(idenergie, numtrain);
	}
	public static Enquetes selectWhereEnquete (int idenquete) {
		return Modele.selectWhereEnquete(idenquete);
	}
	public static Films selectWhereFilm (int idservice, int reffilm) {
		return Modele.selectWhereFilm(idservice, reffilm);
	}
	public static Gares selectWhereGare (int idgare) {
		return Modele.selectWhereGare(idgare);
	}
	public static Livres selectWhereLivre (int idservice, int reflivre) {
		return Modele.selectWhereLivre(idservice, reflivre);
	}
	public static Pays selectWherePays (int idpays) {
		return Modele.selectWherePays(idpays);
	}
	public static Questions selectWhereQuestion (int idquestion) {
		return Modele.selectWhereQuestion(idquestion);
	}
	public static Reservations selectWhereReservation (int idreservation) {
		return Modele.selectWhereReservation(idreservation);
	}
	public static Trains selectWhereTrain (int numtrain) {
		return Modele.selectWhereTrain(numtrain);
	}
	public static Trajets selectWhereTrajet (int idtrajet) {
		return Modele.selectWhereTrajet(idtrajet);
	}
	public static Villes selectWhereVille (int idville) {
		return Modele.selectWhereVille(idville);
	}
	
	/*** CONNEXION ***/
	
	// Hachage du mot de passe saisi par l'utilisateur
	public static byte[] getSHA(String mdp) {
		byte[] tab = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA1");
			tab = md.digest(mdp.getBytes(StandardCharsets.UTF_8));
		} catch (NoSuchAlgorithmException exp) {
			exp.printStackTrace();
		}
		return tab;
	}
	
	public static String toHexString(byte[] tab) {
		BigInteger number = new BigInteger(1, tab);
		StringBuilder hexString = new StringBuilder(number.toString(16));
		while (hexString.length() < 32) {
			hexString.insert(0, '0');
		}
		return hexString.toString();
	}
	
	public static String controlerMdp (String mdp) {
		return toHexString(getSHA(mdp));
	}
	
	public static String controlerEmail (String email) {
		return email;
	}
	
	public static Users selectWhereUser (String email, String mdp) {
		email = controlerEmail(email);
		mdp = controlerMdp(mdp);
		return Modele.selectWhereUser(email, mdp);
	}

}
