package controleur;

public class Commentaires {
	
    private int idcom;
    private String contenu, date_heure_post;
    private int idu;
    
    public Commentaires(int idcom, String contenu, String date_heure_post, int idu) {
        this.idcom = idcom;
        this.contenu = contenu;
        this.date_heure_post = date_heure_post;
        this.idu = idu;
    }
    
    public Commentaires(String contenu, String date_heure_post, int idu) {
        this.idcom = 0;
        this.contenu = contenu;
        this.date_heure_post = date_heure_post;
        this.idu = idu;
    }
    
    public int getIdcom() {
        return this.idcom;
    }
    
    public void setIdcom(int idcom) {
        this.idcom = idcom;
    }
    
    public String getContenu() {
        return this.contenu;
    }
    
    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
    
    public String getDate_heure_post() {
        return this.date_heure_post;
    }
    
    public void setDate_heure_post(String date_heure_post) {
        this.date_heure_post = date_heure_post;
    }
    
    public int getIdu() {
        return this.idu;
    }
    
    public void setIdu(int idu) {
        this.idu = idu;
    }
}
