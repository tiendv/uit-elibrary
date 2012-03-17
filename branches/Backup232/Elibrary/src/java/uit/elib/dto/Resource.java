package uit.elib.dto;
// Generated Feb 17, 2012 11:57:50 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Resource generated by hbm2java
 */
public class Resource  implements java.io.Serializable {


     private Integer resourceId;
     private Faculty faculty;
     private Resourcecategory resourcecategory;
     private Level level;
     private Subject subject;
     private String resourceNameVn;
     private String resourceNameEn;
     private String summaryVn;
     private String summaryEn;
     private Date postDate;
     private Double size;
     private String format;
     private Integer downloadNumber;
     private String serverName;
     private String uploadName;
     private Integer orderChapter;
     private String author;
     private String teacher;
     private String class_;
     private Integer year;
     private String schoolYear;
     private String school;

    public Resource() {
    }

    public Resource(Faculty faculty, Resourcecategory resourcecategory, Level level, Subject subject, String resourceNameVn, String resourceNameEn, String summaryVn, String summaryEn, Date postDate, Double size, String format, Integer downloadNumber, String serverName, String uploadName, Integer orderChapter, String author, String teacher, String class_, Integer year, String schoolYear, String school) {
       this.faculty = faculty;
       this.resourcecategory = resourcecategory;
       this.level = level;
       this.subject = subject;
       this.resourceNameVn = resourceNameVn;
       this.resourceNameEn = resourceNameEn;
       this.summaryVn = summaryVn;
       this.summaryEn = summaryEn;
       this.postDate = postDate;
       this.size = size;
       this.format = format;
       this.downloadNumber = downloadNumber;
       this.serverName = serverName;
       this.uploadName = uploadName;
       this.orderChapter = orderChapter;
       this.author = author;
       this.teacher = teacher;
       this.class_ = class_;
       this.year = year;
       this.schoolYear = schoolYear;
       this.school = school;
    }
   
    public Integer getResourceId() {
        return this.resourceId;
    }
    
    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
    public Faculty getFaculty() {
        return this.faculty;
    }
    
    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    public Resourcecategory getResourcecategory() {
        return this.resourcecategory;
    }
    
    public void setResourcecategory(Resourcecategory resourcecategory) {
        this.resourcecategory = resourcecategory;
    }
    public Level getLevel() {
        return this.level;
    }
    
    public void setLevel(Level level) {
        this.level = level;
    }
    public Subject getSubject() {
        return this.subject;
    }
    
    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    public String getResourceNameVn() {
        return this.resourceNameVn;
    }
    
    public void setResourceNameVn(String resourceNameVn) {
        this.resourceNameVn = resourceNameVn;
    }
    public String getResourceNameEn() {
        return this.resourceNameEn;
    }
    
    public void setResourceNameEn(String resourceNameEn) {
        this.resourceNameEn = resourceNameEn;
    }
    public String getSummaryVn() {
        return this.summaryVn;
    }
    
    public void setSummaryVn(String summaryVn) {
        this.summaryVn = summaryVn;
    }
    public String getSummaryEn() {
        return this.summaryEn;
    }
    
    public void setSummaryEn(String summaryEn) {
        this.summaryEn = summaryEn;
    }
    public Date getPostDate() {
        return this.postDate;
    }
    
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }
    public Double getSize() {
        return this.size;
    }
    
    public void setSize(Double size) {
        this.size = size;
    }
    public String getFormat() {
        return this.format;
    }
    
    public void setFormat(String format) {
        this.format = format;
    }
    public Integer getDownloadNumber() {
        return this.downloadNumber;
    }
    
    public void setDownloadNumber(Integer downloadNumber) {
        this.downloadNumber = downloadNumber;
    }
    public String getServerName() {
        return this.serverName;
    }
    
    public void setServerName(String serverName) {
        this.serverName = serverName;
    }
    public String getUploadName() {
        return this.uploadName;
    }
    
    public void setUploadName(String uploadName) {
        this.uploadName = uploadName;
    }
    public Integer getOrderChapter() {
        return this.orderChapter;
    }
    
    public void setOrderChapter(Integer orderChapter) {
        this.orderChapter = orderChapter;
    }
    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
    public String getClass_() {
        return this.class_;
    }
    
    public void setClass_(String class_) {
        this.class_ = class_;
    }
    public Integer getYear() {
        return this.year;
    }
    
    public void setYear(Integer year) {
        this.year = year;
    }
    public String getSchoolYear() {
        return this.schoolYear;
    }
    
    public void setSchoolYear(String schoolYear) {
        this.schoolYear = schoolYear;
    }
    public String getSchool() {
        return this.school;
    }
    
    public void setSchool(String school) {
        this.school = school;
    }




}

