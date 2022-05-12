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
 * Likes generated by hbm2java
 */
@Entity
@Table(name="LIKES"
    ,schema="AMITIE"
)
public class Likes  implements java.io.Serializable {


     private long idl;
     private Utilisateur utilisateur;
     private Posts posts;
     private String typelike;

    public Likes() {
    }

	
    public Likes(long idl) {
        this.idl = idl;
    }
    public Likes(long idl, Utilisateur utilisateur, Posts posts, String typelike) {
       this.idl = idl;
       this.utilisateur = utilisateur;
       this.posts = posts;
       this.typelike = typelike;
    }
   
     @Id 

    
    @Column(name="IDL", unique=true, nullable=false, precision=10, scale=0)
    public long getIdl() {
        return this.idl;
    }
    
    public void setIdl(long idl) {
        this.idl = idl;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDU")
    public Utilisateur getUtilisateur() {
        return this.utilisateur;
    }
    
    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDP")
    public Posts getPosts() {
        return this.posts;
    }
    
    public void setPosts(Posts posts) {
        this.posts = posts;
    }

    
    @Column(name="TYPELIKE", length=10)
    public String getTypelike() {
        return this.typelike;
    }
    
    public void setTypelike(String typelike) {
        this.typelike = typelike;
    }




}

