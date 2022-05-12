package pk.ma.amitie.models;
// Generated 22 mars 2022 18:34:50 by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Invitation generated by hbm2java
 */
@Entity
@Table(name="INVITATION"
    ,schema="AMITIE"
)
@SequenceGenerator(name = "seq_inv",sequenceName = "seq_inv")
public class Invitation  implements java.io.Serializable {


     private int idinv;
     private Utilisateur utilisateurByIduInvite;
     private Utilisateur utilisateurByIdu;
     
     private Date dateinvitation;
     private Date dateacceptation;
     private String status;

    public Invitation() {
    }

	
    public Invitation(int idinv) {
        this.idinv = idinv;
    }
    public Invitation(int idinv,Utilisateur utilisateurByIduInvite, Utilisateur utilisateurByIdu,  Date dateinvitation, Date dateacceptation, String status) {
       this.idinv = idinv;
         this.utilisateurByIduInvite = utilisateurByIduInvite;
       this.utilisateurByIdu = utilisateurByIdu;
     
       this.dateinvitation = dateinvitation;
       this.dateacceptation = dateacceptation;
       this.status = status;
    }
   
     @Id 

    @GeneratedValue(generator = "seq_inv",strategy = GenerationType.SEQUENCE)
    @Column(name="IDINV", unique=true, nullable=false, precision=10, scale=0)
    public int getIdinv() {
        return this.idinv;
    }
    
    public void setIdinv(int idinv) {
        this.idinv = idinv;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDU")
    public Utilisateur getUtilisateurByIdu() {
        return this.utilisateurByIdu;
    }
    
    public void setUtilisateurByIdu(Utilisateur utilisateurByIdu) {
        this.utilisateurByIdu = utilisateurByIdu;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDU_INVITE")
    public Utilisateur getUtilisateurByIduInvite() {
        return this.utilisateurByIduInvite;
    }
    
    public void setUtilisateurByIduInvite(Utilisateur utilisateurByIduInvite) {
        this.utilisateurByIduInvite = utilisateurByIduInvite;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="DATEINVITATION", length=7)
    public Date getDateinvitation() {
        return this.dateinvitation;
    }
    
    public void setDateinvitation(Date dateinvitation) {
        this.dateinvitation = dateinvitation;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="DATEACCEPTATION", length=7)
    public Date getDateacceptation() {
        return this.dateacceptation;
    }
    
    public void setDateacceptation(Date dateacceptation) {
        this.dateacceptation = dateacceptation;
    }

    
    @Column(name="STATUS", length=20)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


