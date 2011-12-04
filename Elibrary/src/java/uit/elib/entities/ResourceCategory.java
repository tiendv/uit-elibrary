package uit.elib.entities;
// Generated Nov 26, 2011 12:46:52 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Resourcecategory generated by hbm2java
 */
public class ResourceCategory  implements java.io.Serializable {


     private int resourceCategoryID;
     private String resourceCategoryNameEN;
     private String resourceCategoryNameVN;
     private Set resources = new HashSet(0);

    public ResourceCategory() {
    }

	
    public ResourceCategory(int resourceCategoryID) {
        this.resourceCategoryID = resourceCategoryID;
    }
    public ResourceCategory(int resourceCategoryId, String resourceCategoryNameEN, String resourceCategoryNameVN, Set resources) {
       this.resourceCategoryID = resourceCategoryID;
       this.resourceCategoryNameEN = resourceCategoryNameEN;
       this.resourceCategoryNameVN = resourceCategoryNameVN;
       this.resources = resources;
    }
   
    public int getResourceCategoryID() {
        return this.resourceCategoryID;
    }
    
    public void setResourceCategoryID(int resourceCategoryID) {
        this.resourceCategoryID = resourceCategoryID;
    }
    public String getResourceCategoryNameEN() {
        return this.resourceCategoryNameEN;
    }
    
    public void setResourceCategoryNameEN(String resourceCategoryNameEN) {
        this.resourceCategoryNameEN = resourceCategoryNameEN;
    }
    public String getResourceCategoryNameVN() {
        return this.resourceCategoryNameVN;
    }
    
    public void setResourceCategoryNameVN(String resourceCategoryNameVN) {
        this.resourceCategoryNameVN = resourceCategoryNameVN;
    }
    public Set getResources() {
        return this.resources;
    }
    
    public void setResources(Set resources) {
        this.resources = resources;
    }




}


