package uit.elib.entities;
// Generated Dec 5, 2011 9:29:17 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Resource generated by hbm2java
 */
public class Resource  implements java.io.Serializable {


     private Integer resourceId;
     private Resourcecategory resourcecategory;
     private Subject subject;
     private String resourceNameVn;
     private String resourceNameEn;
     private Integer size;
     private String serverName;
     private String summaryVn;
     private String summaryEn;
     private Date postDate;
     private Integer viewerNumber;
     private Integer downloadNumber;
     private String format;
     private String language;
     private Integer voteMark;
     private Integer orderChapter;
     private String author;
     private String uploadName;

    public Resource() {
    }

    public Resource(Resourcecategory resourcecategory, Subject subject, String resourceNameVn, String resourceNameEn, Integer size, String serverName, String summaryVn, String summaryEn, Date postDate, Integer viewerNumber, Integer downloadNumber, String format, String language, Integer voteMark, Integer orderChapter, String author, String uploadName) {
       this.resourcecategory = resourcecategory;
       this.subject = subject;
       this.resourceNameVn = resourceNameVn;
       this.resourceNameEn = resourceNameEn;
       this.size = size;
       this.serverName = serverName;
       this.summaryVn = summaryVn;
       this.summaryEn = summaryEn;
       this.postDate = postDate;
       this.viewerNumber = viewerNumber;
       this.downloadNumber = downloadNumber;
       this.format = format;
       this.language = language;
       this.voteMark = voteMark;
       this.orderChapter = orderChapter;
       this.author = author;
       this.uploadName = uploadName;
    }
   
    public Integer getResourceId() {
        return this.resourceId;
    }
    
    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
    public Resourcecategory getResourcecategory() {
        return this.resourcecategory;
    }
    
    public void setResourcecategory(Resourcecategory resourcecategory) {
        this.resourcecategory = resourcecategory;
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
    public Integer getSize() {
        return this.size;
    }
    
    public void setSize(Integer size) {
        this.size = size;
    }
    public String getServerName() {
        return this.serverName;
    }
    
    public void setServerName(String serverName) {
        this.serverName = serverName;
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
    public Integer getViewerNumber() {
        return this.viewerNumber;
    }
    
    public void setViewerNumber(Integer viewerNumber) {
        this.viewerNumber = viewerNumber;
    }
    public Integer getDownloadNumber() {
        return this.downloadNumber;
    }
    
    public void setDownloadNumber(Integer downloadNumber) {
        this.downloadNumber = downloadNumber;
    }
    public String getFormat() {
        return this.format;
    }
    
    public void setFormat(String format) {
        this.format = format;
    }
    public String getLanguage() {
        return this.language;
    }
    
    public void setLanguage(String language) {
        this.language = language;
    }
    public Integer getVoteMark() {
        return this.voteMark;
    }
    
    public void setVoteMark(Integer voteMark) {
        this.voteMark = voteMark;
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
    public String getUploadName() {
        return this.uploadName;
    }
    
    public void setUploadName(String uploadName) {
        this.uploadName = uploadName;
    }




}


