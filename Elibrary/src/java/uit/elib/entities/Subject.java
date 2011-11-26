package uit.elib.entities;
// Generated Nov 26, 2011 12:46:52 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Subject generated by hbm2java
 */
public class Subject  implements java.io.Serializable {


     private Integer subjectId;
     private Subjectcategory subjectcategory;
     private Speciality speciality;
     private String subjectName;
     private String subjectIntroduce;
     private Integer creditNumber;
     private String level;
     private Integer periodOfTheory;
     private Integer periodOfPractice;
     private String courseCode;
     private String teacher;
     private String prerequisiteSubject;
     private Integer midtermGrade;
     private Integer finalGrade;
     private String subjectNameVn;
     private String subjectIntroduceVn;
     private String timeTeaching;
     private String projectRequitement;
     private String projectRequitementUs;
     private Set resources = new HashSet(0);

    public Subject() {
    }

    public Subject(Subjectcategory subjectcategory, Speciality speciality, String subjectName, String subjectIntroduce, Integer creditNumber, String level, Integer periodOfTheory, Integer periodOfPractice, String courseCode, String teacher, String prerequisiteSubject, Integer midtermGrade, Integer finalGrade, String subjectNameVn, String subjectIntroduceVn, String timeTeaching, String projectRequitement, String projectRequitementUs, Set resources) {
       this.subjectcategory = subjectcategory;
       this.speciality = speciality;
       this.subjectName = subjectName;
       this.subjectIntroduce = subjectIntroduce;
       this.creditNumber = creditNumber;
       this.level = level;
       this.periodOfTheory = periodOfTheory;
       this.periodOfPractice = periodOfPractice;
       this.courseCode = courseCode;
       this.teacher = teacher;
       this.prerequisiteSubject = prerequisiteSubject;
       this.midtermGrade = midtermGrade;
       this.finalGrade = finalGrade;
       this.subjectNameVn = subjectNameVn;
       this.subjectIntroduceVn = subjectIntroduceVn;
       this.timeTeaching = timeTeaching;
       this.projectRequitement = projectRequitement;
       this.projectRequitementUs = projectRequitementUs;
       this.resources = resources;
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
    public Speciality getSpeciality() {
        return this.speciality;
    }
    
    public void setSpeciality(Speciality speciality) {
        this.speciality = speciality;
    }
    public String getSubjectName() {
        return this.subjectName;
    }
    
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    public String getSubjectIntroduce() {
        return this.subjectIntroduce;
    }
    
    public void setSubjectIntroduce(String subjectIntroduce) {
        this.subjectIntroduce = subjectIntroduce;
    }
    public Integer getCreditNumber() {
        return this.creditNumber;
    }
    
    public void setCreditNumber(Integer creditNumber) {
        this.creditNumber = creditNumber;
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
    public String getPrerequisiteSubject() {
        return this.prerequisiteSubject;
    }
    
    public void setPrerequisiteSubject(String prerequisiteSubject) {
        this.prerequisiteSubject = prerequisiteSubject;
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
    public String getSubjectNameVn() {
        return this.subjectNameVn;
    }
    
    public void setSubjectNameVn(String subjectNameVn) {
        this.subjectNameVn = subjectNameVn;
    }
    public String getSubjectIntroduceVn() {
        return this.subjectIntroduceVn;
    }
    
    public void setSubjectIntroduceVn(String subjectIntroduceVn) {
        this.subjectIntroduceVn = subjectIntroduceVn;
    }
    public String getTimeTeaching() {
        return this.timeTeaching;
    }
    
    public void setTimeTeaching(String timeTeaching) {
        this.timeTeaching = timeTeaching;
    }
    public String getProjectRequitement() {
        return this.projectRequitement;
    }
    
    public void setProjectRequitement(String projectRequitement) {
        this.projectRequitement = projectRequitement;
    }
    public String getProjectRequitementUs() {
        return this.projectRequitementUs;
    }
    
    public void setProjectRequitementUs(String projectRequitementUs) {
        this.projectRequitementUs = projectRequitementUs;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


