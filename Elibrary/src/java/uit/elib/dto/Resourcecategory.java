package uit.elib.dto;
// Generated Jan 24, 2012 1:47:29 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Resourcecategory generated by hbm2java
 */
public class Resourcecategory  implements java.io.Serializable {


     private int resourceCategoryId;
     private String resourceCategoryNameVn;
     private String resourceCategoryNameEn;
     private Set groupdetails = new HashSet(0);
     private Set resources = new HashSet(0);

    public Resourcecategory() {
    }

	
    public Resourcecategory(int resourceCategoryId) {
        this.resourceCategoryId = resourceCategoryId;
    }
    public Resourcecategory(int resourceCategoryId, String resourceCategoryNameVn, String resourceCategoryNameEn, Set groupdetails, Set resources) {
       this.resourceCategoryId = resourceCategoryId;
       this.resourceCategoryNameVn = resourceCategoryNameVn;
       this.resourceCategoryNameEn = resourceCategoryNameEn;
       this.groupdetails = groupdetails;
       this.resources = resources;
    }
   
    public int getResourceCategoryId() {
        return this.resourceCategoryId;
    }
    
    public void setResourceCategoryId(int resourceCategoryId) {
        this.resourceCategoryId = resourceCategoryId;
    }
    public String getResourceCategoryNameVn() {
        return this.resourceCategoryNameVn;
    }
    
    public void setResourceCategoryNameVn(String resourceCategoryNameVn) {
        this.resourceCategoryNameVn = resourceCategoryNameVn;
    }
    public String getResourceCategoryNameEn() {
        return this.resourceCategoryNameEn;
    }
    
    public void setResourceCategoryNameEn(String resourceCategoryNameEn) {
        this.resourceCategoryNameEn = resourceCategoryNameEn;
    }
    public Set getGroupdetails() {
        return this.groupdetails;
    }
    
    public void setGroupdetails(Set groupdetails) {
        this.groupdetails = groupdetails;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


