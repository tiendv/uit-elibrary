package uit.elib.entities;
// Generated Nov 23, 2011 9:24:01 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Resourcecategory generated by hbm2java
 */
public class Resourcecategory  implements java.io.Serializable {


     private int resourceCategoryId;
     private String resourceCategoryName;
     private String resourceCategoryNameVn;
     private Set resources = new HashSet(0);

    public Resourcecategory() {
    }

	
    public Resourcecategory(int resourceCategoryId) {
        this.resourceCategoryId = resourceCategoryId;
    }
    public Resourcecategory(int resourceCategoryId, String resourceCategoryName, String resourceCategoryNameVn, Set resources) {
       this.resourceCategoryId = resourceCategoryId;
       this.resourceCategoryName = resourceCategoryName;
       this.resourceCategoryNameVn = resourceCategoryNameVn;
       this.resources = resources;
    }
   
    public int getResourceCategoryId() {
        return this.resourceCategoryId;
    }
    
    public void setResourceCategoryId(int resourceCategoryId) {
        this.resourceCategoryId = resourceCategoryId;
    }
    public String getResourceCategoryName() {
        return this.resourceCategoryName;
    }
    
    public void setResourceCategoryName(String resourceCategoryName) {
        this.resourceCategoryName = resourceCategoryName;
    }
    public String getResourceCategoryNameVn() {
        return this.resourceCategoryNameVn;
    }
    
    public void setResourceCategoryNameVn(String resourceCategoryNameVn) {
        this.resourceCategoryNameVn = resourceCategoryNameVn;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


