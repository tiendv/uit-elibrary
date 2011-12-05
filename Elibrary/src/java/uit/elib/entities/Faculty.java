package uit.elib.entities;
// Generated Nov 26, 2011 12:46:52 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Faculty generated by hbm2java
 */
public class Faculty  implements java.io.Serializable {


     private int facultyID;
     private String facultyNameEN;
     private String facultyNameVN;
     private Set subjects = new HashSet(0);

    public Faculty() {
    }

	
    public Faculty(int facultyID) {
        this.facultyID = facultyID;
    }
    public Faculty(int facultyID, String facultyNameEN, String facultyNameVN, Set subjects) {
       this.facultyID = facultyID;
       this.facultyNameEN = facultyNameEN;
       this.facultyNameVN = facultyNameVN;
       this.subjects = subjects;
    }
   
    public int getFacultyID() {
        return this.facultyID;
    }
    
    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }
    public String getFacultyNameEN() {
        return this.facultyNameEN;
    }
    
    public void setFacultyNameEN(String facultyNameEN) {
        this.facultyNameEN = facultyNameEN;
    }
    public String getFacultyNameVN() {
        return this.facultyNameVN;
    }
    
    public void setFacultyNameVN(String facultyNameVN) {
        this.facultyNameVN = facultyNameVN;
    }
    public Set getSubjects() {
        return this.subjects;
    }
    
    public void setSubjects(Set subjects) {
        this.subjects = subjects;
    }




}

