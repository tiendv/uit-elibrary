package uit.elib.dto;
// Generated Feb 12, 2012 10:39:26 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Faculty generated by hbm2java
 */
public class Faculty  implements java.io.Serializable {


     private int facultyId;
     private String facultyNameEn;
     private String facultyNameVn;
     private Set subjects = new HashSet(0);
     private Set resources = new HashSet(0);
     private Set users = new HashSet(0);

    public Faculty() {
    }

	
    public Faculty(int facultyId) {
        this.facultyId = facultyId;
    }
    public Faculty(int facultyId, String facultyNameEn, String facultyNameVn, Set subjects, Set resources, Set users) {
       this.facultyId = facultyId;
       this.facultyNameEn = facultyNameEn;
       this.facultyNameVn = facultyNameVn;
       this.subjects = subjects;
       this.resources = resources;
       this.users = users;
    }
   
    public int getFacultyId() {
        return this.facultyId;
    }
    
    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }
    public String getFacultyNameEn() {
        return this.facultyNameEn;
    }
    
    public void setFacultyNameEn(String facultyNameEn) {
        this.facultyNameEn = facultyNameEn;
    }
    public String getFacultyNameVn() {
        return this.facultyNameVn;
    }
    
    public void setFacultyNameVn(String facultyNameVn) {
        this.facultyNameVn = facultyNameVn;
    }
    public Set getSubjects() {
        return this.subjects;
    }
    
    public void setSubjects(Set subjects) {
        this.subjects = subjects;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


