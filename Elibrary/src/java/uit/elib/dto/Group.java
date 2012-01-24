package uit.elib.dto;
// Generated Jan 25, 2012 1:04:40 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Group generated by hbm2java
 */
public class Group  implements java.io.Serializable {


     private Integer groupId;
     private String groupNameEn;
     private String groupNameVn;
     private Set groupdetails = new HashSet(0);
     private Set users = new HashSet(0);

    public Group() {
    }

    public Group(String groupNameEn, String groupNameVn, Set groupdetails, Set users) {
       this.groupNameEn = groupNameEn;
       this.groupNameVn = groupNameVn;
       this.groupdetails = groupdetails;
       this.users = users;
    }
   
    public Integer getGroupId() {
        return this.groupId;
    }
    
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
    public String getGroupNameEn() {
        return this.groupNameEn;
    }
    
    public void setGroupNameEn(String groupNameEn) {
        this.groupNameEn = groupNameEn;
    }
    public String getGroupNameVn() {
        return this.groupNameVn;
    }
    
    public void setGroupNameVn(String groupNameVn) {
        this.groupNameVn = groupNameVn;
    }
    public Set getGroupdetails() {
        return this.groupdetails;
    }
    
    public void setGroupdetails(Set groupdetails) {
        this.groupdetails = groupdetails;
    }
    public Set getUsers() {
        return this.users;
    }
    
    public void setUsers(Set users) {
        this.users = users;
    }




}


