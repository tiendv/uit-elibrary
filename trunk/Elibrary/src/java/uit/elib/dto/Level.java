package uit.elib.dto;
// Generated Dec 25, 2011 1:02:34 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Level generated by hbm2java
 */
public class Level  implements java.io.Serializable {


     private int levelId;
     private String levelNameEn;
     private String levelNameVn;
     private Set resources = new HashSet(0);

    public Level() {
    }

	
    public Level(int levelId) {
        this.levelId = levelId;
    }
    public Level(int levelId, String levelNameEn, String levelNameVn, Set resources) {
       this.levelId = levelId;
       this.levelNameEn = levelNameEn;
       this.levelNameVn = levelNameVn;
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
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


