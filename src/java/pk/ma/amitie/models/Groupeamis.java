package pk.ma.amitie.models;
// Generated 22 mars 2022 18:34:50 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Groupeamis generated by hbm2java
 */
@Entity
@Table(name="GROUPEAMIS"
    ,schema="AMITIE"
)
public class Groupeamis  implements java.io.Serializable {


     private long idg;
     private Utilisateur utilisateur;

    public Groupeamis() {
    }

	
    public Groupeamis(long idg) {
        this.idg = idg;
    }
    public Groupeamis(long idg, Utilisateur utilisateur) {
       this.idg = idg;
       this.utilisateur = utilisateur;
    }
   
     @Id 

    
    @Column(name="IDG", unique=true, nullable=false, precision=10, scale=0)
    public long getIdg() {
        return this.idg;
    }
    
    public void setIdg(long idg) {
        this.idg = idg;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDU")
    public Utilisateur getUtilisateur() {
        return this.utilisateur;
    }
    
    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }




}


