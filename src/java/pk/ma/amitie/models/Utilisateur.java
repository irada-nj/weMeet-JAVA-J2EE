package pk.ma.amitie.models;
// Generated 22 mars 2022 18:34:50 by Hibernate Tools 4.3.1


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Utilisateur generated by hbm2java
 */
@SequenceGenerator(sequenceName = "seq_user",name = "seq_user")
@Entity
@Table(name="UTILISATEUR"
    ,schema="AMITIE"
)
public class Utilisateur  implements java.io.Serializable {


     private int idu;
     private Ville ville;
     private String nom;
     private String prenom;
     private String email;
     private String tel;
     private Date datenaiss;
     private Date regdate;
     private String profilimg;
     private String banniereimg;
     private String status;
     private String mdp;
     private String role;
     private String question;
     private String reponse;
     private Boolean etatcpt;
     private List<Amis> amisesForIdu = new ArrayList<Amis>(0);
     private Set<Amis> amisesForIduAmis = new HashSet<Amis>(0);
     private Set<Albums> albumses = new HashSet<Albums>(0);
     private List<Posts> postses = new ArrayList<Posts>(0);
     private Set<Groupe> groupes = new HashSet<Groupe>(0);
     private Set<Partage> partagesForIdu = new HashSet<Partage>(0);
     private Set<Groupeamis> groupeamises = new HashSet<Groupeamis>(0);
     private List<Invitation> invitationsForIduInvite = new ArrayList<Invitation>(0);
     private Set<Invitation> invitationsForIdu = new HashSet<Invitation>(0);
     private Set<Commentaire> commentaires = new HashSet<Commentaire>(0);
     private Set<Partage> partagesForIduPartage = new HashSet<Partage>(0);
     private Set<Likes> likeses = new HashSet<Likes>(0);
    
  
     
     
    

    public Utilisateur() {
    }

	
    public Utilisateur(int idu) {
        this.idu = idu;
    }
    public Utilisateur(int idu, Ville ville, String nom, String prenom, String email, String tel, Date datenaiss, Date regdate, String profilimg, String banniereimg, String status, String mdp, String role, String question, String reponse, Boolean etatcpt,
 List<Amis> amisesForIdu,Set<Amis> amisesForIduAmis,Set<Albums> albumses,List<Posts> postses,Set<Groupe> groupes,Set<Partage> partagesForIdu, Set<Groupeamis> groupeamises,
 List<Invitation> invitationsForIduInvite,Set<Invitation> invitationsForIdu, 
 Set<Commentaire> commentaires,Set<Partage> partagesForIduPartage,Set<Likes> likeses) {
       this.idu = idu;
       this.ville = ville;
       this.nom = nom;
       this.prenom = prenom;
       this.email = email;
       this.tel = tel;
       this.datenaiss = datenaiss;
       this.regdate = regdate;
       this.profilimg = profilimg;
       this.banniereimg = banniereimg;
       this.status = status;
       this.mdp = mdp;
       this.role = role;
       this.question = question;
       this.reponse = reponse;
       this.etatcpt = etatcpt;
       this.amisesForIdu = amisesForIdu;
       this.amisesForIduAmis = amisesForIduAmis;
       this.albumses = albumses;
       this.groupes = groupes;
       this.partagesForIdu = partagesForIdu;
       this.groupeamises = groupeamises;
       this.invitationsForIduInvite = invitationsForIduInvite;
       this.invitationsForIdu = invitationsForIdu;
       this.commentaires = commentaires;
       this.partagesForIduPartage = partagesForIduPartage;
       this.likeses = likeses;
    }
   
     @Id 

    @GeneratedValue(generator = "seq_user",strategy = GenerationType.SEQUENCE)
    @Column(name="IDU", unique=true, nullable=false, precision=8, scale=0)
    public int getIdu() {
        return this.idu;
    }
    
    public void setIdu(int idu) {
        this.idu = idu;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDVILLE")
    public Ville getVille() {
        return this.ville;
    }
    
    public void setVille(Ville ville) {
        this.ville = ville;
    }

    
    @Column(name="NOM")
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }

    
    @Column(name="PRENOM")
    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    
    @Column(name="EMAIL", length=50)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="TEL", length=30)
    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="DATENAISS", length=7)
    public Date getDatenaiss() {
        return this.datenaiss;
    }
    
    public void setDatenaiss(Date datenaiss) {
        this.datenaiss = datenaiss;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="REGDATE", length=7)
    public Date getRegdate() {
        return this.regdate;
    }
    
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    
    @Column(name="PROFILIMG", length=50)
    public String getProfilimg() {
        return this.profilimg;
    }
    
    public void setProfilimg(String profilimg) {
        this.profilimg = profilimg;
    }

    
    @Column(name="BANNIEREIMG", length=50)
    public String getBanniereimg() {
        return this.banniereimg;
    }
    
    public void setBanniereimg(String banniereimg) {
        this.banniereimg = banniereimg;
    }

    
    @Column(name="STATUS", length=100)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    
    @Column(name="MDP", length=50)
    public String getMdp() {
        return this.mdp;
    }
    
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    
    @Column(name="ROLE", length=50)
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }

    
    @Column(name="QUESTION")
    public String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }

    
    @Column(name="REPONSE")
    public String getReponse() {
        return this.reponse;
    }
    
    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    
    @Column(name="ETATCPT", precision=1, scale=0)
    public Boolean getEtatcpt() {
        return this.etatcpt;
    }
    
    public void setEtatcpt(Boolean etatcpt) {
        this.etatcpt = etatcpt;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public Set<Groupeamis> getGroupeamises() {
        return this.groupeamises;
    }
    
    public void setGroupeamises(Set<Groupeamis> groupeamises) {
        this.groupeamises = groupeamises;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIdu")
    public Set<Partage> getPartagesForIdu() {
        return this.partagesForIdu;
    }
    
    public void setPartagesForIdu(Set<Partage> partagesForIdu) {
        this.partagesForIdu = partagesForIdu;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public Set<Groupe> getGroupes() {
        return this.groupes;
    }
    
    public void setGroupes(Set<Groupe> groupes) {
        this.groupes = groupes;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIduPartage")
    public Set<Partage> getPartagesForIduPartage() {
        return this.partagesForIduPartage;
    }
    
    public void setPartagesForIduPartage(Set<Partage> partagesForIduPartage) {
        this.partagesForIduPartage = partagesForIduPartage;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIduAmis")
    public Set<Amis> getAmisesForIduAmis() {
        return this.amisesForIduAmis;
    }
    
    public void setAmisesForIduAmis(Set<Amis> amisesForIduAmis) {
        this.amisesForIduAmis = amisesForIduAmis;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public Set<Albums> getAlbumses() {
        return this.albumses;
    }
    
    public void setAlbumses(Set<Albums> albumses) {
        this.albumses = albumses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public Set<Likes> getLikeses() {
        return this.likeses;
    }
    
    public void setLikeses(Set<Likes> likeses) {
        this.likeses = likeses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public List<Posts> getPostses() {
        return this.postses;
    }
    
    public void setPostses(List<Posts> postses) {
        this.postses = postses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIdu")
    public List<Amis> getAmisesForIdu() {
        return this.amisesForIdu;
    }
    
    public void setAmisesForIdu(List<Amis> amisesForIdu) {
        this.amisesForIdu = amisesForIdu;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateur")
    public Set<Commentaire> getCommentaires() {
        return this.commentaires;
    }
    
    public void setCommentaires(Set<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIdu")
    public Set<Invitation> getInvitationsForIdu() {
        return this.invitationsForIdu;
    }
    
    public void setInvitationsForIdu(Set<Invitation> invitationsForIdu) {
        this.invitationsForIdu = invitationsForIdu;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="utilisateurByIduInvite")
    public List<Invitation> getInvitationsForIduInvite() {
        return this.invitationsForIduInvite;
    }
    
    public void setInvitationsForIduInvite(List<Invitation> invitationsForIduInvite) {
        this.invitationsForIduInvite = invitationsForIduInvite;
    }




}

