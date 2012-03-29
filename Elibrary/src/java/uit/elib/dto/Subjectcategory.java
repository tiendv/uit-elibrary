package uit.elib.dto;
// Generated Mar 29, 2012 10:29:08 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Subjectcategory generated by hbm2java
 */
public class Subjectcategory  implements java.io.Serializable {


     private int subjectCategoryId;
     private String subjectCategoryNameEn;
     private String subjectCategoryNameVn;
     private Set subjects = new HashSet(0);

    public Subjectcategory() {
    }

	
    public Subjectcategory(int subjectCategoryId) {
        this.subjectCategoryId = subjectCategoryId;
    }
    public Subjectcategory(int subjectCategoryId, String subjectCategoryNameEn, String subjectCategoryNameVn, Set subjects) {
       this.subjectCategoryId = subjectCategoryId;
       this.subjectCategoryNameEn = subjectCategoryNameEn;
       this.subjectCategoryNameVn = subjectCategoryNameVn;
       this.subjects = subjects;
    }
   
    public int getSubjectCategoryId() {
        return this.subjectCategoryId;
    }
    
    public void setSubjectCategoryId(int subjectCategoryId) {
        this.subjectCategoryId = subjectCategoryId;
    }
    public String getSubjectCategoryNameEn() {
        return this.subjectCategoryNameEn;
    }
    
    public void setSubjectCategoryNameEn(String subjectCategoryNameEn) {
        this.subjectCategoryNameEn = subjectCategoryNameEn;
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


