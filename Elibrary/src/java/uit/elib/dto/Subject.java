package uit.elib.dto;
// Generated Mar 29, 2012 10:29:08 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Subject generated by hbm2java
 */
public class Subject  implements java.io.Serializable {


     private Integer subjectId;
     private Subjectcategory subjectcategory;
     private String subjectNameVn;
     private String subjectNameEn;
     private String subjectIntroduceVn;
     private String subjectIntroduceEn;
     private Integer numberOfCredit;
     private String level;
     private Integer periodOfTheory;
     private Integer periodOfPractice;
     private String courseCode;
     private String teacher;
     private String prerequisiteSubjectVn;
     private String prerequisiteSubjectEn;
     private Integer midtermGrade;
     private Integer finalGrade;
     private Integer timeTeaching;
     private String projectRequirementEn;
     private String projectRequirementVn;
     private Integer numberChapter;
     private Set resources = new HashSet(0);
     private Set faculties = new HashSet(0);

    public Subject() {
    }

    public Subject(Subjectcategory subjectcategory, String subjectNameVn, String subjectNameEn, String subjectIntroduceVn, String subjectIntroduceEn, Integer numberOfCredit, String level, Integer periodOfTheory, Integer periodOfPractice, String courseCode, String teacher, String prerequisiteSubjectVn, String prerequisiteSubjectEn, Integer midtermGrade, Integer finalGrade, Integer timeTeaching, String projectRequirementEn, String projectRequirementVn, Integer numberChapter, Set resources, Set faculties) {
       this.subjectcategory = subjectcategory;
       this.subjectNameVn = subjectNameVn;
       this.subjectNameEn = subjectNameEn;
       this.subjectIntroduceVn = subjectIntroduceVn;
       this.subjectIntroduceEn = subjectIntroduceEn;
       this.numberOfCredit = numberOfCredit;
       this.level = level;
       this.periodOfTheory = periodOfTheory;
       this.periodOfPractice = periodOfPractice;
       this.courseCode = courseCode;
       this.teacher = teacher;
       this.prerequisiteSubjectVn = prerequisiteSubjectVn;
       this.prerequisiteSubjectEn = prerequisiteSubjectEn;
       this.midtermGrade = midtermGrade;
       this.finalGrade = finalGrade;
       this.timeTeaching = timeTeaching;
       this.projectRequirementEn = projectRequirementEn;
       this.projectRequirementVn = projectRequirementVn;
       this.numberChapter = numberChapter;
       this.resources = resources;
       this.faculties = faculties;
    }
   
    public Integer getSubjectId() {
        return this.subjectId;
    }
    
    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }
    public Subjectcategory getSubjectcategory() {
        return this.subjectcategory;
    }
    
    public void setSubjectcategory(Subjectcategory subjectcategory) {
        this.subjectcategory = subjectcategory;
    }
    public String getSubjectNameVn() {
        return this.subjectNameVn;
    }
    
    public void setSubjectNameVn(String subjectNameVn) {
        this.subjectNameVn = subjectNameVn;
    }
    public String getSubjectNameEn() {
        return this.subjectNameEn;
    }
    
    public void setSubjectNameEn(String subjectNameEn) {
        this.subjectNameEn = subjectNameEn;
    }
    public String getSubjectIntroduceVn() {
        return this.subjectIntroduceVn;
    }
    
    public void setSubjectIntroduceVn(String subjectIntroduceVn) {
        this.subjectIntroduceVn = subjectIntroduceVn;
    }
    public String getSubjectIntroduceEn() {
        return this.subjectIntroduceEn;
    }
    
    public void setSubjectIntroduceEn(String subjectIntroduceEn) {
        this.subjectIntroduceEn = subjectIntroduceEn;
    }
    public Integer getNumberOfCredit() {
        return this.numberOfCredit;
    }
    
    public void setNumberOfCredit(Integer numberOfCredit) {
        this.numberOfCredit = numberOfCredit;
    }
    public String getLevel() {
        return this.level;
    }
    
    public void setLevel(String level) {
        this.level = level;
    }
    public Integer getPeriodOfTheory() {
        return this.periodOfTheory;
    }
    
    public void setPeriodOfTheory(Integer periodOfTheory) {
        this.periodOfTheory = periodOfTheory;
    }
    public Integer getPeriodOfPractice() {
        return this.periodOfPractice;
    }
    
    public void setPeriodOfPractice(Integer periodOfPractice) {
        this.periodOfPractice = periodOfPractice;
    }
    public String getCourseCode() {
        return this.courseCode;
    }
    
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }
    public String getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
    public String getPrerequisiteSubjectVn() {
        return this.prerequisiteSubjectVn;
    }
    
    public void setPrerequisiteSubjectVn(String prerequisiteSubjectVn) {
        this.prerequisiteSubjectVn = prerequisiteSubjectVn;
    }
    public String getPrerequisiteSubjectEn() {
        return this.prerequisiteSubjectEn;
    }
    
    public void setPrerequisiteSubjectEn(String prerequisiteSubjectEn) {
        this.prerequisiteSubjectEn = prerequisiteSubjectEn;
    }
    public Integer getMidtermGrade() {
        return this.midtermGrade;
    }
    
    public void setMidtermGrade(Integer midtermGrade) {
        this.midtermGrade = midtermGrade;
    }
    public Integer getFinalGrade() {
        return this.finalGrade;
    }
    
    public void setFinalGrade(Integer finalGrade) {
        this.finalGrade = finalGrade;
    }
    public Integer getTimeTeaching() {
        return this.timeTeaching;
    }
    
    public void setTimeTeaching(Integer timeTeaching) {
        this.timeTeaching = timeTeaching;
    }
    public String getProjectRequirementEn() {
        return this.projectRequirementEn;
    }
    
    public void setProjectRequirementEn(String projectRequirementEn) {
        this.projectRequirementEn = projectRequirementEn;
    }
    public String getProjectRequirementVn() {
        return this.projectRequirementVn;
    }
    
    public void setProjectRequirementVn(String projectRequirementVn) {
        this.projectRequirementVn = projectRequirementVn;
    }
    public Integer getNumberChapter() {
        return this.numberChapter;
    }
    
    public void setNumberChapter(Integer numberChapter) {
        this.numberChapter = numberChapter;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }
    public Set getFaculties() {
        return this.faculties;
    }
    
    public void setFaculties(Set faculties) {
        this.faculties = faculties;
    }




}


