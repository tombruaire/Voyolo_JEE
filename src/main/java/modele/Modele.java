package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;

import controleur.*;

public class Modele {
	
	private static Bdd uneBdd = new Bdd ("localhost", "voyolo", "root", "");
	
	//
	// Sélection de toutes les tables de la base VOYOLO
	public static ArrayList<String> selectAllTables () {
		ArrayList<String> lesTables = new ArrayList<String>();
		String requete = "SHOW TABLES FROM voyolo WHERE Tables_in_voyolo NOT LIKE 'histo%' \n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vusers'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vclients'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vadmins'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vcommentaires'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vtrains'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vvilles'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vgares'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vtrajets'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'venergies'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vreservations'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vfactures'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vservices'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vlivres'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vfilms'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vconsommations'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vmoderer'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vconcerne'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vavoir'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vsesitue'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vsesitue2'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vgerer'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vpropose'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vcontenir'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vfaire'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vrealiser'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'vrepondre'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'venquetes'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'avoir'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'concerne'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'contenir'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'faire'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'gerer'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'moderer'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'propose'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'realiser'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'repondre'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'se_situe'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'se_situe_2'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'bdd'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'users'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'commentaires'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'services'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'factures'\n"
        		+ "AND Tables_in_voyolo NOT LIKE 'personnes';";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				String uneTable = new String (
						desResultats.getString("tables_in_voyolo")
					);
				lesTables.add(uneTable);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesTables;
	}
	
	
	/*** INSERT ***/
	
	public static void insertAdmin (Admins unAdmin) {
		String requete = "call insertAdmin('"
				+ unAdmin.getNom() + "', '"
				+ unAdmin.getPrenom() + "', '"
				+ unAdmin.getPseudo() + "', '"
				+ unAdmin.getEmail() + "', '"
				+ unAdmin.getMdp() + "', '"
				+ unAdmin.getRole() + "', '"
				+ unAdmin.getNum_identification() + "', '"
				+ unAdmin.getType() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertClient (Clients unClient) {
		String requete = "call insertClient('"
				+ unClient.getNom() + "', '"
				+ unClient.getPrenom() + "', '"
				+ unClient.getPseudo() + "', '"
				+ unClient.getEmail() + "', '"
				+ unClient.getMdp() + "', '"
				+ unClient.getRole() + "', '"
				+ unClient.getDate_naissance() + "', '"
				+ unClient.getTel() + "', '"
				+ unClient.getAdresse() + "', '"
				+ unClient.getCarte_avantage() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertConsommation (Consommations uneConsommation) {
		String requete = "call insertConsommation('"
				+ uneConsommation.getNomservice() + "', '"
				+ uneConsommation.getTypeservice() + "', '"
				+ uneConsommation.getTelservice() + "', "
				+ uneConsommation.getNumtrain() + ", "
				+ uneConsommation.getIdgare() + ", "
				+ uneConsommation.getRefarticle() + ", '"
				+ uneConsommation.getArticle() + "', '"
				+ uneConsommation.getPrix() + "', "
				+ uneConsommation.getQuantite() + ", '"
				+ uneConsommation.getDescription() + "', '"
				+ uneConsommation.getDate_expiration() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertEnergie (Energies uneEnergie) {
		String requete = "call insertEnergie("
				+ uneEnergie.getNumtrain() + ", "
				+ uneEnergie.getEnergie_consommee() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertEnquete (Enquetes uneEnquete) {
		String requete = "call insertEnquete('"
				+ uneEnquete.getNom_enquete() + "', '"
				+ uneEnquete.getDescription() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertFilm (Films unFilm) {
		String requete = "call insertFilm('"
				+ unFilm.getNomservice() + "', '"
				+ unFilm.getTypeservice() + "', '"
				+ unFilm.getTelservice() + "', "
				+ unFilm.getNumtrain() + ", "
				+ unFilm.getIdgare() + ", "
				+ unFilm.getReffilm() + ", '"
				+ unFilm.getNomfilm() + "', '"
				+ unFilm.getRealisateur() + "', '"
				+ unFilm.getDuree() + "', '"
				+ unFilm.getResume() + "', '"
				+ unFilm.getDisponible() + "', '"
				+ unFilm.getDate_sortie() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertGare (Gares uneGare) {
		String requete = "call insertGare('"
				+ uneGare.getNomgare() + "', '"
				+ uneGare.getType() + "', '"
				+ uneGare.getAdresse() + "', "
				+ uneGare.getIdpays() + ", "
				+ uneGare.getIdville() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertLivre (Livres unLivre) {
		String requete = "call insertLivre('"
				+ unLivre.getNomservice() + "', '"
				+ unLivre.getTypeservice() + "', '"
				+ unLivre.getTelservice() + "', "
				+ unLivre.getNumtrain() + ", "
				+ unLivre.getIdgare() + ", "
				+ unLivre.getReflivre() + ", '"
				+ unLivre.getNomlivre() + "', '"
				+ unLivre.getAuteur() + "', '"
				+ unLivre.getEdition() + "', "
				+ unLivre.getNbpages() + ", '"
				+ unLivre.getResume() + "', '"
				+ unLivre.getDisponible() + "', '"
				+ unLivre.getDate_sortie() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertPays (Pays unPays) {
		String requete = "call insertPays('"+ unPays.getNompays() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertQuestion (Questions uneQuestion) {
		String requete = "call insertQuestion('"+ uneQuestion.getEnonce() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertReservation (Reservations uneReservation) {
		String requete = "call insertReservation('"
				+ uneReservation.getStatut_reservation() + "', "
				+ uneReservation.getNbpersonne() + ", "
				+ uneReservation.getIdu() + ", "
				+ uneReservation.getNumtrain() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertTrain (Trains unTrain) {
		String requete = "call insertTrain('"
				+ unTrain.getNomtrain() + "', "
				+ unTrain.getNbwagon() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertTrajet (Trajets unTrajet) {
		String requete = "call insertTrajet("
				+ unTrajet.getNumtrain() + ", "
				+ unTrajet.getIdgare1() + ", '"
				+ unTrajet.getDate_depart() + "', '"
				+ unTrajet.getHeure_depart() + "', "
				+ unTrajet.getIdgare2() + ", '"
				+ unTrajet.getDate_arrivee() + "', '"
				+ unTrajet.getHeure_arrivee() + "', '"
				+ unTrajet.getDuree() + "', '"
				+ unTrajet.getPrix() + "', '"
				+ unTrajet.getQuai() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void insertVilles (Villes uneVille) {
		String requete = "call insertVille('"
				+ uneVille.getNomville() + "', "
				+ uneVille.getIdpays() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	
	/*** UPDATE ***/

	public static void updateAdmin (Admins unAdmin) {
		String requete = "call updateAdmin("
				+ unAdmin.getIdu() + ", '"
				+ unAdmin.getNom() + "', '"
				+ unAdmin.getPrenom() + "', '"
				+ unAdmin.getPseudo() + "', '"
				+ unAdmin.getEmail() + "', '"
				+ unAdmin.getMdp() + "', '"
				+ unAdmin.getRole() + "', '"
				+ unAdmin.getNum_identification() + "', '"
				+ unAdmin.getType() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateClient (Clients unClient) {
		String requete = "call updateClient("
				+ unClient.getIdu() + ", '"
				+ unClient.getNom() + "', '"
				+ unClient.getPrenom() + "', '"
				+ unClient.getPseudo() + "', '"
				+ unClient.getEmail() + "', '"
				+ unClient.getMdp() + "', '"
				+ unClient.getRole() + "', '"
				+ unClient.getDate_naissance() + "', '"
				+ unClient.getTel() + "', '"
				+ unClient.getAdresse() + "', '"
				+ unClient.getCarte_avantage() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateConsommation (Consommations uneConsommation) {
		String requete = "call updateConsommation("
				+ uneConsommation.getIdservice() + ", '"
				+ uneConsommation.getNomservice() + "', '"
				+ uneConsommation.getTypeservice() + "', '"
				+ uneConsommation.getTelservice() + "', "
				+ uneConsommation.getNumtrain() + ", "
				+ uneConsommation.getIdgare() + ", "
				+ uneConsommation.getRefarticle() + ", '"
				+ uneConsommation.getArticle() + "', '"
				+ uneConsommation.getPrix() + "', "
				+ uneConsommation.getQuantite() + ", '"
				+ uneConsommation.getDescription() + "', '"
				+ uneConsommation.getDate_expiration() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateEnergie (Energies uneEnergie) {
		String requete = "call updateEnergie("
				+ uneEnergie.getIdenergie() + ", "
				+ uneEnergie.getNumtrain() + ", "
				+ uneEnergie.getEnergie_consommee() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateEnquete (Enquetes uneEnquete) {
		String requete = "call updateEnquete("
				+ uneEnquete.getIdenquete() + ", '"
				+ uneEnquete.getNom_enquete() + "', '"
				+ uneEnquete.getDescription() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateFilm (Films unFilm) {
		String requete = "call updateFilm("
				+ unFilm.getIdservice() + ", '"
				+ unFilm.getNomservice() + "', '"
				+ unFilm.getTypeservice() + "', '"
				+ unFilm.getTelservice() + "', "
				+ unFilm.getNumtrain() + ", "
				+ unFilm.getIdgare() + ", "
				+ unFilm.getReffilm() + ", '"
				+ unFilm.getNomfilm() + "', '"
				+ unFilm.getRealisateur() + "', '"
				+ unFilm.getDuree() + "', '"
				+ unFilm.getResume() + "', '"
				+ unFilm.getDisponible() + "', '"
				+ unFilm.getDate_sortie() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateGare (Gares uneGare) {
		String requete = "call updateGare("
				+ uneGare.getIdgare() + ", '"
				+ uneGare.getNomgare() + "', '"
				+ uneGare.getType() + "', '"
				+ uneGare.getAdresse() + "', "
				+ uneGare.getIdpays() + ", "
				+ uneGare.getIdville() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateLivre (Livres unLivre) {
		String requete = "call updateLivre('"
				+ unLivre.getIdservice() + "', '"
				+ unLivre.getNomservice() + "', '"
				+ unLivre.getTypeservice() + "', '"
				+ unLivre.getTelservice() + "', "
				+ unLivre.getNumtrain() + ", "
				+ unLivre.getIdgare() + ", "
				+ unLivre.getReflivre() + ", '"
				+ unLivre.getNomlivre() + "', '"
				+ unLivre.getAuteur() + "', '"
				+ unLivre.getEdition() + "', "
				+ unLivre.getNbpages() + ", '"
				+ unLivre.getResume() + "', '"
				+ unLivre.getDisponible() + "', '"
				+ unLivre.getDate_sortie() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updatePays (Pays unPays) {
		String requete = "call updatePays("
				+ unPays.getIdpays() + ", '"
				+ unPays.getNompays() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateQuestion (Questions uneQuestion) {
		String requete = "call updateQuestion("+ uneQuestion.getIdquestion() +", '"+ uneQuestion.getEnonce() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateReservation (Reservations uneReservation) {
		String requete = "call updateReservation("
				+ uneReservation.getIdreservation() + ", '"
				+ uneReservation.getStatut_reservation() + "', "
				+ uneReservation.getNbpersonne() + ", "
				+ uneReservation.getIdu() + ", "
				+ uneReservation.getNumtrain() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateTrain (Trains unTrain) {
		String requete = "call updateTrain("
				+ unTrain.getNumtrain() + ", '"
				+ unTrain.getNomtrain() + "', "
				+ unTrain.getNbwagon() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateTrajet (Trajets unTrajet) {
		String requete = "call updateTrajet("
				+ unTrajet.getIdtrajet() + ", "
				+ unTrajet.getNumtrain() + ", "
				+ unTrajet.getIdgare1() + ", '"
				+ unTrajet.getDate_depart() + "', '"
				+ unTrajet.getHeure_depart() + "', "
				+ unTrajet.getIdgare2() + ", '"
				+ unTrajet.getDate_arrivee() + "', '"
				+ unTrajet.getHeure_arrivee() + "', '"
				+ unTrajet.getDuree() + "', '"
				+ unTrajet.getPrix() + "', '"
				+ unTrajet.getQuai() + "'); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void updateVilles (Villes uneVille) {
		String requete = "call updateVille("
				+ uneVille.getIdville() + ", '"
				+ uneVille.getNomville() + "', "
				+ uneVille.getIdpays() + "); ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	
	/*** DELETE ***/
	
	public static void deleteAdmin (int idu) {
		String requete = "call deleteAdmin("+idu+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteClient (int idu) {
		String requete = "call deleteClient("+idu+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteConsommation (int idservice, int refarticle) {
		String requete = "call deleteConsommation("+idservice+", "+refarticle+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteEnergie (int idenergie, int numtrain) {
		String requete = "call deleteEnergie("+idenergie+", "+numtrain+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}

	public static void deleteEnquete (int idenquete) {
		String requete = "call deleteEnquete("+idenquete+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}

	public static void deleteFilm (int idservice, int reffilm) {
		String requete = "call deleteFilm("+idservice+", "+reffilm+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteGare (int idgare) {
		String requete = "call deleteGare("+idgare+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteLivre (int idservice, int reflivre) {
		String requete = "call deleteLivre("+idservice+", "+reflivre+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deletePays (int idpays) {
		String requete = "call deletePays("+idpays+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteQuestion (int idquestion) {
		String requete = "call deleteQuestion("+idquestion+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteReservation (int idreservation) {
		String requete = "call deleteReservation("+idreservation+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteTrain (int numtrain) {
		String requete = "call deleteTrain("+numtrain+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteTrajet (int idtrajet) {
		String requete = "call deleteTrajet("+idtrajet+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	public static void deleteVille (int idville) {
		String requete = "call deleteVille("+idville+");";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
	}
	
	
	/*** DeleteAll ***/
	
	public static void deleteAllAdmins () {
		String requete1 = "DELETE FROM admins;";
		String requete2 = "DELETE FROM users WHERE role = 'admin';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete1);
			unStatement.execute(requete2);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete1);
			System.out.println("Erreur de requête (2) : " + requete2);
		}
	}
	
	public static void deleteAllClients () {
		String requete1 = "DELETE FROM clients;";
		String requete2 = "DELETE FROM users WHERE role = 'client';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete1);
			unStatement.execute(requete2);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete1);
			System.out.println("Erreur de requête (2) : " + requete2);
		}
	}
	
	public static void deleteAllConsommations () {
		String requete1 = "DELETE FROM consommations;";
		String requete2 = "DELETE FROM services WHERE typeservice = 'Consommations';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete1);
			unStatement.execute(requete2);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete1);
			System.out.println("Erreur de requête (2) : " + requete2);
		}
	}
	
	public static void deleteAllEnergies () {
		String requete = "DELETE FROM energies;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllEnquetes () {
		String requete = "DELETE FROM enquetes;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllFilms () {
		String requete1 = "DELETE FROM films;";
		String requete2 = "DELETE FROM services WHERE typeservice = 'Film';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete1);
			unStatement.execute(requete2);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete1);
			System.out.println("Erreur de requête (2) : " + requete2);
		}
	}
	
	public static void deleteAllGares () {
		String requete = "DELETE FROM gares;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllLivres () {
		String requete1 = "DELETE FROM livres;";
		String requete2 = "DELETE FROM services WHERE typeservice = 'Livre';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete1);
			unStatement.execute(requete2);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete1);
			System.out.println("Erreur de requête (2) : " + requete2);
		}
	}
	
	public static void deleteAllPays () {
		String requete = "DELETE FROM pays;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllQuestions () {
		String requete = "DELETE FROM questions;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllReservations () {
		String requete = "DELETE FROM reservations;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllTrains () {
		String requete = "DELETE FROM trains;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllTrajets () {
		String requete = "DELETE FROM trajets;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	public static void deleteAllVilles () {
		String requete = "DELETE FROM villes;";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			unStatement.execute(requete);
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête (1) : " + requete);
		}
	}
	
	
	/*** SelectAll ***/
	
	public static ArrayList<VAdmins> selectAllAdmins () {
		ArrayList<VAdmins> lesAdmins = new ArrayList<VAdmins>();
		String requete = "SELECT * FROM vadmins ORDER BY idu DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VAdmins unAdmin = new VAdmins (
						desResultats.getInt("idu"),
						desResultats.getString("nom"),
						desResultats.getString("prenom"),
						desResultats.getString("pseudo"),
						desResultats.getString("email"),
						desResultats.getString("mdp"),
						desResultats.getString("role"),
						desResultats.getInt("nbTentatives"),
						desResultats.getInt("nbConnexion"),
						desResultats.getInt("bloque"),
						desResultats.getString("last_connexion"),
						desResultats.getString("last_deconnexion"),
						desResultats.getString("creation_compte"),
						desResultats.getInt("num_identification"),
						desResultats.getString("type")
						);
				lesAdmins.add(unAdmin);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesAdmins;
	}
	
	public static ArrayList<VClients> selectAllClients () {
		ArrayList<VClients> lesClients = new ArrayList<VClients>();
		String requete = "SELECT * FROM vclients ORDER BY idu DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VClients unClient = new VClients (
						desResultats.getInt("idu"),
						desResultats.getString("nom"),
						desResultats.getString("prenom"),
						desResultats.getString("pseudo"),
						desResultats.getString("email"),
						desResultats.getString("mdp"),
						desResultats.getString("role"),
						desResultats.getInt("nbTentatives"),
						desResultats.getInt("nbConnexion"),
						desResultats.getInt("bloque"),
						desResultats.getString("last_connexion"),
						desResultats.getString("last_deconnexion"),
						desResultats.getString("creation_compte"),
						desResultats.getString("date_naissance"),
						desResultats.getString("tel"),
						desResultats.getString("adresse"),
						desResultats.getString("carte_avantage")
						);
				lesClients.add(unClient);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesClients;
	}
	
	public static ArrayList<VConsommations> selectAllConsommations () {
		ArrayList<VConsommations> lesConsommations = new ArrayList<VConsommations>();
		String requete = "SELECT * FROM vconsommations ORDER BY idservice DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VConsommations uneConsommation = new VConsommations (
						desResultats.getInt("idservice"),
						desResultats.getString("nomservice"),
						desResultats.getString("typeservice"),
						desResultats.getString("telservice"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("idgare"),
						desResultats.getString("nomgare"),
						desResultats.getInt("refarticle"),
						desResultats.getString("article"),
						desResultats.getString("prix"),
						desResultats.getInt("quantite"),
						desResultats.getString("description"),
						desResultats.getString("date_expiration"),
						desResultats.getString("date_ajout")
						);
				lesConsommations.add(uneConsommation);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesConsommations;
	}
	
	public static ArrayList<VEnergies> selectAllEnergies () {
		ArrayList<VEnergies> lesEnergies = new ArrayList<VEnergies>();
		String requete = "SELECT * FROM venergies ORDER BY idenergie DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VEnergies uneEnergie = new VEnergies (
						desResultats.getInt("idenergie"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("energie_consommee")
						);
				lesEnergies.add(uneEnergie);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesEnergies;
	}
	
	public static ArrayList<VEnquetes> selectAllEnquetes () {
		ArrayList<VEnquetes> lesEnquetes = new ArrayList<VEnquetes>();
		String requete = "SELECT * FROM venquetes ORDER BY idenquete DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VEnquetes uneEnquete = new VEnquetes (
						desResultats.getInt("idenquete"),
						desResultats.getString("nom_enquete"),
						desResultats.getString("description"),
						desResultats.getString("date_creation_enquete")
						);
				lesEnquetes.add(uneEnquete);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesEnquetes;
	}
	
	public static ArrayList<VFilms> selectAllFilms () {
		ArrayList<VFilms> lesFilms = new ArrayList<VFilms>();
		String requete = "SELECT * FROM vfilms ORDER BY idservice DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VFilms unFilm = new VFilms (
						desResultats.getInt("idservice"),
						desResultats.getString("nomservice"),
						desResultats.getString("typeservice"),
						desResultats.getString("telservice"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("idgare"),
						desResultats.getString("nomgare"),
						desResultats.getInt("reffilm"),
						desResultats.getString("nomfilm"),
						desResultats.getString("realisateur"),
						desResultats.getString("duree"),
						desResultats.getString("resume"),
						desResultats.getString("disponible"),
						desResultats.getString("date_sortie")
						);
				lesFilms.add(unFilm);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesFilms;
	}
	
	public static ArrayList<VGares> selectAllGares () {
		ArrayList<VGares> lesGares = new ArrayList<VGares>();
		String requete = "SELECT * FROM vgares ORDER BY idgare DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VGares uneGare = new VGares (
						desResultats.getInt("idgare"),
						desResultats.getString("nomgare"),
						desResultats.getString("type"),
						desResultats.getString("adresse"),
						desResultats.getInt("idpays"),
						desResultats.getString("nompays"),
						desResultats.getInt("idville"),
						desResultats.getString("nomville")
						);
				lesGares.add(uneGare);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesGares;
	}
	
	public static ArrayList<VGares> selectAllGaresSelect () {
		ArrayList<VGares> lesGares = new ArrayList<VGares>();
		String requete = "SELECT * FROM vgares ORDER BY idgare;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VGares uneGare = new VGares (
						desResultats.getInt("idgare"),
						desResultats.getString("nomgare"),
						desResultats.getString("type"),
						desResultats.getString("adresse"),
						desResultats.getInt("idpays"),
						desResultats.getString("nompays"),
						desResultats.getInt("idville"),
						desResultats.getString("nomville")
						);
				lesGares.add(uneGare);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesGares;
	}
	
	public static ArrayList<VLivres> selectAllLivres () {
		ArrayList<VLivres> lesLivres = new ArrayList<VLivres>();
		String requete = "SELECT * FROM vlivres ORDER BY idservice DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VLivres unLivre = new VLivres (
						desResultats.getInt("idservice"),
						desResultats.getString("nomservice"),
						desResultats.getString("typeservice"),
						desResultats.getString("telservice"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("idgare"),
						desResultats.getString("nomgare"),
						desResultats.getInt("reflivre"),
						desResultats.getString("nomlivre"),
						desResultats.getString("auteur"),
						desResultats.getString("edition"),
						desResultats.getInt("nbpages"),
						desResultats.getString("resume"),
						desResultats.getString("disponible"),
						desResultats.getString("date_sortie")
						);
				lesLivres.add(unLivre);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesLivres;
	}
	
	public static ArrayList<Pays> selectAllPays () {
		ArrayList<Pays> lesPays = new ArrayList<Pays>();
		String requete = "SELECT * FROM pays ORDER BY idpays DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				Pays unPays = new Pays (
						desResultats.getInt("idpays"),
						desResultats.getString("nompays")
						);
				lesPays.add(unPays);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesPays;
	}
	
	public static ArrayList<Pays> selectAllPaysSelect () {
		ArrayList<Pays> lesPays = new ArrayList<Pays>();
		String requete = "SELECT * FROM pays ORDER BY idpays;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				Pays unPays = new Pays (
						desResultats.getInt("idpays"),
						desResultats.getString("nompays")
						);
				lesPays.add(unPays);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesPays;
	}
	
	public static ArrayList<Questions> selectAllQuestions () {
		ArrayList<Questions> lesQuestions = new ArrayList<Questions>();
		String requete = "SELECT * FROM questions ORDER BY idquestion DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				Questions uneQuestion = new Questions (
						desResultats.getInt("idquestion"),
						desResultats.getString("enonce")
						);
				lesQuestions.add(uneQuestion);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesQuestions;
	}
	
	public static ArrayList<VReservations> selectAllReservations () {
		ArrayList<VReservations> lesReservations = new ArrayList<VReservations>();
		String requete = "SELECT * FROM vreservations ORDER BY idreservation DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VReservations uneReservation = new VReservations (
						desResultats.getInt("idreservation"),
						desResultats.getString("statut_reservation"),
						desResultats.getInt("nbpersonne"),
						desResultats.getInt("idu"),
						desResultats.getString("nom"),
						desResultats.getString("prenom"),
						desResultats.getString("email"),
						desResultats.getString("creation_compte"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain")
						);
				lesReservations.add(uneReservation);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesReservations;
	}
	
	public static ArrayList<VTrains> selectAllTrains () {
		ArrayList<VTrains> lesTrains = new ArrayList<VTrains>();
		String requete = "SELECT * FROM vtrains ORDER BY numtrain DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VTrains unTrain = new VTrains (
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("nbwagon"),
						desResultats.getString("date_creation_train")
						);
				lesTrains.add(unTrain);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesTrains;
	}
	
	public static ArrayList<VTrains> selectAllTrainsSelect () {
		ArrayList<VTrains> lesTrains = new ArrayList<VTrains>();
		String requete = "SELECT * FROM vtrains ORDER BY numtrain;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VTrains unTrain = new VTrains (
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("nbwagon"),
						desResultats.getString("date_creation_train")
						);
				lesTrains.add(unTrain);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesTrains;
	}
	
	public static ArrayList<VTrajets> selectAllTrajets () {
		ArrayList<VTrajets> lesTrajets = new ArrayList<VTrajets>();
		String requete = "SELECT * FROM vtrajets ORDER BY idtrajet DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VTrajets unTrajet = new VTrajets (
						desResultats.getInt("idtrajet"),
						desResultats.getInt("numtrain"),
						desResultats.getString("nomtrain"),
						desResultats.getInt("idgare1"),
						desResultats.getString("gare_depart"),
						desResultats.getString("date_depart"),
						desResultats.getString("heure_depart"),
						desResultats.getInt("idgare2"),
						desResultats.getString("gare_arrivee"),
						desResultats.getString("date_arrivee"),
						desResultats.getString("heure_arrivee"),
						desResultats.getString("duree"),
						desResultats.getString("prix"),
						desResultats.getString("quai")
						);
				lesTrajets.add(unTrajet);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesTrajets;
	}
	
	public static ArrayList<VVilles> selectAllVilles () {
		ArrayList<VVilles> lesVilles = new ArrayList<VVilles>();
		String requete = "SELECT * FROM vvilles ORDER BY idville DESC;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VVilles uneVille = new VVilles (
						desResultats.getInt("idville"),
						desResultats.getString("nomville"),
						desResultats.getInt("idpays"),
						desResultats.getString("nompays")
						);
				lesVilles.add(uneVille);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesVilles;
	}
	
	public static ArrayList<VVilles> selectAllVillesSelect () {
		ArrayList<VVilles> lesVilles = new ArrayList<VVilles>();
		String requete = "SELECT * FROM vvilles ORDER BY idville;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				VVilles uneVille = new VVilles (
						desResultats.getInt("idville"),
						desResultats.getString("nomville"),
						desResultats.getInt("idpays"),
						desResultats.getString("nompays")
						);
				lesVilles.add(uneVille);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesVilles;
	}
	
	public static ArrayList<Users> selectAllUsers () {
		ArrayList<Users> lesUsers = new ArrayList<Users>();
		String requete = "SELECT * FROM users ORDER BY idu;";
		try {
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while (desResultats.next()) {
				Users unUser = new Users (
						desResultats.getInt("idu"),
						desResultats.getString("nom"),
						desResultats.getString("prenom"),
						desResultats.getString("pseudo"),
						desResultats.getString("email"),
						desResultats.getString("mdp"),
						desResultats.getString("role"),
						desResultats.getInt("nbTentatives"),
						desResultats.getInt("nbConnexion"),
						desResultats.getInt("bloque"),
						desResultats.getString("last_connexion"),
						desResultats.getString("last_deconnexion"),
						desResultats.getString("creation_compte")
						);
				lesUsers.add(unUser);
			}
			unStat.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return lesUsers;
	}
	
	
	/*** SelectWhere ***/

	public static Admins selectWhereAdmin (int idu) {
		Admins unAdmin = null;
		String requete = "SELECT * FROM vadmins WHERE idu = "+idu+"; ";
		System.out.println(requete);
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unAdmin = new Admins (
						unResultat.getInt("idu"),
						unResultat.getString("nom"),
						unResultat.getString("prenom"),
						unResultat.getString("pseudo"),
						unResultat.getString("email"),
						unResultat.getString("mdp"),
						unResultat.getString("role"),
						unResultat.getInt("nbTentatives"),
						unResultat.getInt("nbConnexion"),
						unResultat.getInt("bloque"),
						unResultat.getString("last_connexion"),
						unResultat.getString("last_deconnexion"),
						unResultat.getString("creation_compte"),
						unResultat.getInt("num_identification"),
						unResultat.getString("type")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unAdmin;
	}
	
	public static Clients selectWhereClient (int idu) {
		Clients unClient = null;
		String requete = "SELECT * FROM vclients WHERE idu = "+idu+"; ";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unClient = new Clients (
						unResultat.getInt("idu"),
						unResultat.getString("nom"),
						unResultat.getString("prenom"),
						unResultat.getString("pseudo"),
						unResultat.getString("email"),
						unResultat.getString("mdp"),
						unResultat.getString("role"),
						unResultat.getInt("nbTentatives"),
						unResultat.getInt("nbConnexion"),
						unResultat.getInt("bloque"),
						unResultat.getString("last_connexion"),
						unResultat.getString("last_deconnexion"),
						unResultat.getString("creation_compte"),
						unResultat.getString("date_naissance"),
						unResultat.getString("tel"),
						unResultat.getString("adresse"),
						unResultat.getString("carte_avantage")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unClient;
	}
	
	public static VConsommations selectWhereConsommation (int idservice, int refarticle) {
		VConsommations uneConsommation = null;
		String requete = "SELECT * FROM vconsommations WHERE idservice = "+idservice+" AND refarticle = "+refarticle+";";
		System.out.println(requete);
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneConsommation = new VConsommations (
						unResultat.getInt("idservice"),
						unResultat.getString("nomservice"),
						unResultat.getString("typeservice"),
						unResultat.getString("telservice"),
						unResultat.getInt("numtrain"),
						unResultat.getString("nomtrain"),
						unResultat.getInt("idgare"),
						unResultat.getString("nomgare"),
						unResultat.getInt("refarticle"),
						unResultat.getString("article"),
						unResultat.getString("prix"),
						unResultat.getInt("quantite"),
						unResultat.getString("description"),
						unResultat.getString("date_expiration"),
						unResultat.getString("date_ajout")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneConsommation;
	}
	
	public static Energies selectWhereEnergie (int idenergie, int numtrain) {
		Energies uneEnergie = null;
		String requete = "SELECT * FROM venergies WHERE idenergie = "+idenergie+" AND numtrain = "+numtrain+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneEnergie = new Energies (
						unResultat.getInt("idenergie"),
						unResultat.getInt("numtrain"),
						unResultat.getInt("energie_consommee")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneEnergie;
	}
	
	public static Enquetes selectWhereEnquete (int idenquete) {
		Enquetes uneEnquete = null;
		String requete = "SELECT * FROM enquetes WHERE idenquete = "+idenquete+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneEnquete = new Enquetes (
						unResultat.getInt("idenquete"),
						unResultat.getString("nom_enquete"),
						unResultat.getString("description"),
						unResultat.getString("date_creation_enquete")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneEnquete;
	}
	
	public static Films selectWhereFilm (int idservice, int reffilm) {
		Films unFilm = null;
		String requete = "SELECT * FROM vfilms WHERE idservice = "+idservice+" AND reffilm = "+reffilm+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unFilm = new Films (
						unResultat.getInt("idservice"),
						unResultat.getString("nomservice"),
						unResultat.getString("typeservice"),
						unResultat.getString("telservice"),
						unResultat.getInt("numtrain"),
						unResultat.getInt("idgare"),
						unResultat.getInt("reffilm"),
						unResultat.getString("nomfilm"),
						unResultat.getString("realisateur"),
						unResultat.getString("duree"),
						unResultat.getString("resume"),
						unResultat.getString("disponible"),
						unResultat.getString("date_sortie")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unFilm;
	}
	
	public static Gares selectWhereGare (int idgare) {
		Gares uneGare = null;
		String requete = "SELECT * FROM vgares WHERE idgare = "+idgare+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneGare = new Gares (
						unResultat.getInt("idgare"),
						unResultat.getString("nomgare"),
						unResultat.getString("type"),
						unResultat.getString("adresse"),
						unResultat.getInt("idpays"),
						unResultat.getInt("idville")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneGare;
	}
	
	public static Livres selectWhereLivre (int idservice, int reflivre) {
		Livres unLivre = null;
		String requete = "SELECT * FROM vlivres WHERE idservice = "+idservice+" AND reflivre = "+reflivre+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unLivre = new Livres (
						unResultat.getInt("idservice"),
						unResultat.getString("nomservice"),
						unResultat.getString("typeservice"),
						unResultat.getString("telservice"),
						unResultat.getInt("numtrain"),
						unResultat.getInt("idgare"),
						unResultat.getInt("reflivre"),
						unResultat.getString("nomlivre"),
						unResultat.getString("auteur"),
						unResultat.getString("edition"),
						unResultat.getInt("nbpages"),
						unResultat.getString("resume"),
						unResultat.getString("disponible"),
						unResultat.getString("date_sortie")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unLivre;
	}
	
	public static Pays selectWherePays (int idpays) {
		Pays unPays = null;
		String requete = "SELECT * FROM pays WHERE idpays = "+idpays+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unPays = new Pays (
						unResultat.getInt("idpays"),
						unResultat.getString("nompays")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unPays;
	}
	
	public static Questions selectWhereQuestion (int idquestion) {
		Questions uneQuestion = null;
		String requete = "SELECT * FROM questions WHERE idquestion = "+idquestion+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneQuestion = new Questions (
						unResultat.getInt("idquestion"),
						unResultat.getString("enonce")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneQuestion;
	}
	
	public static Reservations selectWhereReservation (int idreservation) {
		Reservations uneReservation = null;
		String requete = "SELECT * FROM vreservations WHERE idreservation = "+idreservation+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneReservation = new Reservations (
						unResultat.getInt("idreservation"),
						unResultat.getString("statut_reservation"),
						unResultat.getInt("nbpersonne"),
						unResultat.getInt("idu"),
						unResultat.getInt("numtrain")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneReservation;
	}
	
	public static Trains selectWhereTrain (int numtrain) {
		Trains unTrain = null;
		String requete = "SELECT * FROM vtrains WHERE numtrain = "+numtrain+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unTrain = new Trains (
						unResultat.getInt("numtrain"),
						unResultat.getString("nomtrain"),
						unResultat.getInt("nbwagon"),
						unResultat.getString("date_creation_train")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unTrain;
	}
	
	public static Trajets selectWhereTrajet (int idtrajet) {
		Trajets unTrajet = null;
		String requete = "SELECT * FROM vtrajets WHERE idtrajet = "+idtrajet+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unTrajet = new Trajets (
						unResultat.getInt("idtrajet"),
						unResultat.getInt("numtrain"),
						unResultat.getInt("idgare1"),
						unResultat.getString("date_depart"),
						unResultat.getString("heure_depart"),
						unResultat.getInt("idgare2"),
						unResultat.getString("date_arrivee"),
						unResultat.getString("heure_arrivee"),
						unResultat.getString("duree"),
						unResultat.getString("prix"),
						unResultat.getString("quai")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unTrajet;
	}
	
	public static Villes selectWhereVille (int idville) {
		Villes uneVille = null;
		String requete = "SELECT * FROM vvilles WHERE idville = "+idville+";";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				uneVille = new Villes (
						unResultat.getInt("idville"),
						unResultat.getString("nomville"),
						unResultat.getInt("idpays")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return uneVille;
	}
	
	
	/*** CONNEXION ***/
	public static Users selectWhereUser (String email, String mdp) {
		Users unUser = null;
		String requete = "SELECT * FROM users WHERE email = '"+email+"' AND mdp = '"+mdp+"';";
		try {
			uneBdd.seConnecter();
			Statement unStatement = uneBdd.getMaConnexion().createStatement();
			ResultSet unResultat = unStatement.executeQuery(requete);
			if (unResultat.next()) {
				unUser = new Users (
						unResultat.getInt("idu"),
						unResultat.getString("nom"),
						unResultat.getString("prenom"),
						unResultat.getString("pseudo"),
						unResultat.getString("email"),
						unResultat.getString("mdp"),
						unResultat.getString("role"),
						unResultat.getInt("nbTentatives"),
						unResultat.getInt("nbConnexion"),
						unResultat.getInt("bloque"),
						unResultat.getString("last_connexion"),
						unResultat.getString("last_deconnexion"),
						unResultat.getString("creation_compte")
						);
			}
			unStatement.close();
			uneBdd.seDeconnecter();
		} catch (SQLException exp) {
			System.out.println("Erreur de requête : " + requete);
		}
		return unUser;
	}

}
