package uit.elib.dto;
// Generated Mar 21, 2012 10:51:15 AM by Hibernate Tools 3.2.1.GA



/**
 * Advertising generated by hbm2java
 */
public class Advertising  implements java.io.Serializable {


     private Integer advertisingId;
     private String advertisingNameEn;
     private String advertisingNameVn;
     private String image;
     private String link;

    public Advertising() {
    }

    public Advertising(String advertisingNameEn, String advertisingNameVn, String image, String link) {
       this.advertisingNameEn = advertisingNameEn;
       this.advertisingNameVn = advertisingNameVn;
       this.image = image;
       this.link = link;
    }
   
    public Integer getAdvertisingId() {
        return this.advertisingId;
    }
    
    public void setAdvertisingId(Integer advertisingId) {
        this.advertisingId = advertisingId;
    }
    public String getAdvertisingNameEn() {
        return this.advertisingNameEn;
    }
    
    public void setAdvertisingNameEn(String advertisingNameEn) {
        this.advertisingNameEn = advertisingNameEn;
    }
    public String getAdvertisingNameVn() {
        return this.advertisingNameVn;
    }
    
    public void setAdvertisingNameVn(String advertisingNameVn) {
        this.advertisingNameVn = advertisingNameVn;
    }
    public String getImage() {
        return this.image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    public String getLink() {
        return this.link;
    }
    
    public void setLink(String link) {
        this.link = link;
    }




}

