package uit.elib.dto;
// Generated Feb 4, 2012 8:53:00 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * News generated by hbm2java
 */
public class News  implements java.io.Serializable {


     private Integer newsId;
     private String newsTitleEn;
     private String newsTitleVn;
     private String newsImage;
     private String newsHeadlineEn;
     private String newsHeadlineVn;
     private String newsContentEn;
     private String newsContentVn;
     private Date postDate;

    public News() {
    }

    public News(String newsTitleEn, String newsTitleVn, String newsImage, String newsHeadlineEn, String newsHeadlineVn, String newsContentEn, String newsContentVn, Date postDate) {
       this.newsTitleEn = newsTitleEn;
       this.newsTitleVn = newsTitleVn;
       this.newsImage = newsImage;
       this.newsHeadlineEn = newsHeadlineEn;
       this.newsHeadlineVn = newsHeadlineVn;
       this.newsContentEn = newsContentEn;
       this.newsContentVn = newsContentVn;
       this.postDate = postDate;
    }
   
    public Integer getNewsId() {
        return this.newsId;
    }
    
    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }
    public String getNewsTitleEn() {
        return this.newsTitleEn;
    }
    
    public void setNewsTitleEn(String newsTitleEn) {
        this.newsTitleEn = newsTitleEn;
    }
    public String getNewsTitleVn() {
        return this.newsTitleVn;
    }
    
    public void setNewsTitleVn(String newsTitleVn) {
        this.newsTitleVn = newsTitleVn;
    }
    public String getNewsImage() {
        return this.newsImage;
    }
    
    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage;
    }
    public String getNewsHeadlineEn() {
        return this.newsHeadlineEn;
    }
    
    public void setNewsHeadlineEn(String newsHeadlineEn) {
        this.newsHeadlineEn = newsHeadlineEn;
    }
    public String getNewsHeadlineVn() {
        return this.newsHeadlineVn;
    }
    
    public void setNewsHeadlineVn(String newsHeadlineVn) {
        this.newsHeadlineVn = newsHeadlineVn;
    }
    public String getNewsContentEn() {
        return this.newsContentEn;
    }
    
    public void setNewsContentEn(String newsContentEn) {
        this.newsContentEn = newsContentEn;
    }
    public String getNewsContentVn() {
        return this.newsContentVn;
    }
    
    public void setNewsContentVn(String newsContentVn) {
        this.newsContentVn = newsContentVn;
    }
    public Date getPostDate() {
        return this.postDate;
    }
    
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }




}


