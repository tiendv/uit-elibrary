package uit.elib.dto;
// Generated Feb 5, 2012 12:04:53 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private String userName;
     private Group group;
     private Faculty faculty;
     private Level level;
     private String passWord;
     private String email;
     private String class_;
     private String schoolYear;
     private Date expiredDay;
     private String realName;
     private Date birthday;
     private String address;
     private String workPlace;
     private Integer status;

    public User() {
    }

	
    public User(String userName) {
        this.userName = userName;
    }
    public User(String userName, Group group, Faculty faculty, Level level, String passWord, String email, String class_, String schoolYear, Date expiredDay, String realName, Date birthday, String address, String workPlace, Integer status) {
       this.userName = userName;
       this.group = group;
       this.faculty = faculty;
       this.level = level;
       this.passWord = passWord;
       this.email = email;
       this.class_ = class_;
       this.schoolYear = schoolYear;
       this.expiredDay = expiredDay;
       this.realName = realName;
       this.birthday = birthday;
       this.address = address;
       this.workPlace = workPlace;
       this.status = status;
    }
   
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public Group getGroup() {
        return this.group;
    }
    
    public void setGroup(Group group) {
        this.group = group;
    }
    public Faculty getFaculty() {
        return this.faculty;
    }
    
    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    public Level getLevel() {
        return this.level;
    }
    
    public void setLevel(Level level) {
        this.level = level;
    }
    public String getPassWord() {
        return this.passWord;
    }
    
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getClass_() {
        return this.class_;
    }
    
    public void setClass_(String class_) {
        this.class_ = class_;
    }
    public String getSchoolYear() {
        return this.schoolYear;
    }
    
    public void setSchoolYear(String schoolYear) {
        this.schoolYear = schoolYear;
    }
    public Date getExpiredDay() {
        return this.expiredDay;
    }
    
    public void setExpiredDay(Date expiredDay) {
        this.expiredDay = expiredDay;
    }
    public String getRealName() {
        return this.realName;
    }
    
    public void setRealName(String realName) {
        this.realName = realName;
    }
    public Date getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getWorkPlace() {
        return this.workPlace;
    }
    
    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }




}


