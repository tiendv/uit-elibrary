package uit.elib.entities;
// Generated Nov 26, 2011 12:46:52 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Subjectcategory generated by hbm2java
 */
public class Subjectcategory  implements java.io.Serializable {


     private int subjectCategoryId;
     private String subjectCategoryName;
     private String subjectCategoryNameVn;
     private Set subjects = new HashSet(0);

    public Subjectcategory() {
    }

	
    public Subjectcategory(int subjectCategoryId) {
        this.subjectCategoryId = subjectCategoryId;
    }
    public Subjectcategory(int subjectCategoryId, String subjectCategoryName, String subjectCategoryNameVn, Set subjects) {
       this.subjectCategoryId = subjectCategoryId;
       this.subjectCategoryName = subjectCategoryName;
       this.subjectCategoryNameVn = subjectCategoryNameVn;
       this.subjects = subjects;
    }
   
    public int getSubjectCategoryId() {
        return this.subjectCategoryId;
    }
    
    public void setSubjectCategoryId(int subjectCategoryId) {
        this.subjectCategoryId = subjectCategoryId;
    }
    public String getSubjectCategoryName() {
        return this.subjectCategoryName;
    }
    
    public void setSubjectCategoryName(String subjectCategoryName) {
        this.subjectCategoryName = subjectCategoryName;
    }
    public String getSubjectCategoryNameVn() {
        return this.subjectCategoryNameVn;
    }
    
    public void setSubjectCategoryNameVn(String subjectCategoryNameVn) {
        this.subjectCategoryNameVn = subjectCategoryNameVn;
    }
    public Set getSubjects() {
        return this.subjects;
    }
    
    public void setSubjects(Set subjects) {
        this.subjects = subjects;
    }




}


