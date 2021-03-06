package uit.elib.dto;
// Generated Mar 29, 2012 10:29:08 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Level generated by hbm2java
 */
public class Level  implements java.io.Serializable {


     private int levelId;
     private String levelNameEn;
     private String levelNameVn;
     private Set users = new HashSet(0);
     private Set resources = new HashSet(0);

    public Level() {
    }

	
    public Level(int levelId) {
        this.levelId = levelId;
    }
    public Level(int levelId, String levelNameEn, String levelNameVn, Set users, Set resources) {
       this.levelId = levelId;
       this.levelNameEn = levelNameEn;
       this.levelNameVn = levelNameVn;
       this.users = users;
       this.resources = resources;
    }
   
    public int getLevelId() {
        return this.levelId;
    }
    
    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }
    public String getLevelNameEn() {
        return this.levelNameEn;
    }
    
    public void setLevelNameEn(String levelNameEn) {
        this.levelNameEn = levelNameEn;
    }
    public String getLevelNameVn() {
        return this.levelNameVn;
    }
    
    public void setLevelNameVn(String levelNameVn) {
        this.levelNameVn = levelNameVn;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


