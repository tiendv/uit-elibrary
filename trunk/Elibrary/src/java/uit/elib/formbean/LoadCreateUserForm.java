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
public class LoadCreateUserForm extends org.apache.struts.action.ActionForm {
    
    private List<Group> listDropGroup;
    private List<Faculty> listDropFaculty;
    private List<Level> listDropLevel;

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
    
}
