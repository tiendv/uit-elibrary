package uit.elib.dto;
// Generated Jan 24, 2012 1:47:29 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * News generated by hbm2java
 */
public class News  implements java.io.Serializable {


     private Integer newsId;
     private String newsTitle;
     private String newsImage;
     private String newsHeadline;
     private String newsContent;
     private Date postDate;

    public News() {
    }

    public News(String newsTitle, String newsImage, String newsHeadline, String newsContent, Date postDate) {
       this.newsTitle = newsTitle;
       this.newsImage = newsImage;
       this.newsHeadline = newsHeadline;
       this.newsContent = newsContent;
       this.postDate = postDate;
    }
   
    public Integer getNewsId() {
        return this.newsId;
    }
    
    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }
    public String getNewsTitle() {
        return this.newsTitle;
    }
    
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
    public String getNewsImage() {
        return this.newsImage;
    }
    
    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage;
    }
    public String getNewsHeadline() {
        return this.newsHeadline;
    }
    
    public void setNewsHeadline(String newsHeadline) {
        this.newsHeadline = newsHeadline;
    }
    public String getNewsContent() {
        return this.newsContent;
    }
    
    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
    public Date getPostDate() {
        return this.postDate;
    }
    
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }




}


