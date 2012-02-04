/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

import java.util.List;
import uit.elib.dto.Faculty;
import uit.elib.dto.Group;
import uit.elib.dto.Level;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class EditUserForm extends org.apache.struts.action.ActionForm {
    private String txtUserName;
    private String txtEmail;
    private String txtPassword;
    private String txtRePassword;
    private String txtRealName;
    private String txtClass;
    private String txtSchoolYear;
    private String txtAddress;
    private String txtWorkPlace;    
    private int dropGroup;
    private int dropLevel;
    private int dropFaculty;
    private int dropStatus;
    private String expiredDay;
    private String birthday;
    private List<Group> listDropGroup;
    private List<Faculty> listDropFaculty;
    private List<Level> listDropLevel;

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getDropFaculty() {
        return dropFaculty;
    }

    public void setDropFaculty(int dropFaculty) {
        this.dropFaculty = dropFaculty;
    }

    public int getDropGroup() {
        return dropGroup;
    }

    public void setDropGroup(int dropGroup) {
        this.dropGroup = dropGroup;
    }

    public int getDropLevel() {
        return dropLevel;
    }

    public void setDropLevel(int dropLevel) {
        this.dropLevel = dropLevel;
    }

    public int getDropStatus() {
        return dropStatus;
    }

    public void setDropStatus(int dropStatus) {
        this.dropStatus = dropStatus;
    }

    public String getExpiredDay() {
        return expiredDay;
    }

    public void setExpiredDay(String expiredDay) {
        this.expiredDay = expiredDay;
    }

    public List<Faculty> getListDropFaculty() {
        return listDropFaculty;
    }

    public void setListDropFaculty(List<Faculty> listDropFaculty) {
        this.listDropFaculty = listDropFaculty;
    }

    public List<Group> getListDropGroup() {
        return listDropGroup;
    }

    public void setListDropGroup(List<Group> listDropGroup) {
        this.listDropGroup = listDropGroup;
    }

    public List<Level> getListDropLevel() {
        return listDropLevel;
    }

    public void setListDropLevel(List<Level> listDropLevel) {
        this.listDropLevel = listDropLevel;
    }

    public String getTxtAddress() {
        return txtAddress;
    }

    public void setTxtAddress(String txtAddress) {
        this.txtAddress = txtAddress;
    }

    public String getTxtClass() {
        return txtClass;
    }

    public void setTxtClass(String txtClass) {
        this.txtClass = txtClass;
    }

    public String getTxtEmail() {
        return txtEmail;
    }

    public void setTxtEmail(String txtEmail) {
        this.txtEmail = txtEmail;
    }

    public String getTxtPassword() {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) {
        this.txtPassword = txtPassword;
    }

    public String getTxtRePassword() {
        return txtRePassword;
    }

    public void setTxtRePassword(String txtRePassword) {
        this.txtRePassword = txtRePassword;
    }

    public String getTxtRealName() {
        return txtRealName;
    }

    public void setTxtRealName(String txtRealName) {
        this.txtRealName = txtRealName;
    }

    public String getTxtSchoolYear() {
        return txtSchoolYear;
    }

    public void setTxtSchoolYear(String txtSchoolYear) {
        this.txtSchoolYear = txtSchoolYear;
    }

    public String getTxtUserName() {
        return txtUserName;
    }

    public void setTxtUserName(String txtUserName) {
        this.txtUserName = txtUserName;
    }

    public String getTxtWorkPlace() {
        return txtWorkPlace;
    }

    public void setTxtWorkPlace(String txtWorkPlace) {
        this.txtWorkPlace = txtWorkPlace;
    }
}
