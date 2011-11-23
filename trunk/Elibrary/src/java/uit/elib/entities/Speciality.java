package uit.elib.entities;
// Generated Nov 23, 2011 1:53:01 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Speciality generated by hbm2java
 */
public class Speciality  implements java.io.Serializable {


     private int specialityId;
     private String specialityName;
     private String specialityNameVn;
     private Set subjects = new HashSet(0);

    public Speciality() {
    }

	
    public Speciality(int specialityId) {
        this.specialityId = specialityId;
    }
    public Speciality(int specialityId, String specialityName, String specialityNameVn, Set subjects) {
       this.specialityId = specialityId;
       this.specialityName = specialityName;
       this.specialityNameVn = specialityNameVn;
       this.subjects = subjects;
    }
   
    public int getSpecialityId() {
        return this.specialityId;
    }
    
    public void setSpecialityId(int specialityId) {
        this.specialityId = specialityId;
    }
    public String getSpecialityName() {
        return this.specialityName;
    }
    
    public void setSpecialityName(String specialityName) {
        this.specialityName = specialityName;
    }
    public String getSpecialityNameVn() {
        return this.specialityNameVn;
    }
    
    public void setSpecialityNameVn(String specialityNameVn) {
        this.specialityNameVn = specialityNameVn;
    }
    public Set getSubjects() {
        return this.subjects;
    }
    
    public void setSubjects(Set subjects) {
        this.subjects = subjects;
    }




}


