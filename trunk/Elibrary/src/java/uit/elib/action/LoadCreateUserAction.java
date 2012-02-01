/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.GroupBO;
import uit.elib.bo.LevelBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Group;
import uit.elib.dto.Level;
import uit.elib.formbean.LoadCreateUserForm;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadCreateUserAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        LoadCreateUserForm loadCreateUserForm = (LoadCreateUserForm)form;
        List<Group> listGroup = GroupBO.getGroupBO().getAllGroup();
        loadCreateUserForm.setListDropGroup(listGroup);
        List<Level> listLevel = LevelBO.getLevelBO().getAllLevel();
        loadCreateUserForm.setListDropLevel(listLevel);
        List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty();
        loadCreateUserForm.setListDropFaculty(listFaculty);        
        return mapping.findForward(SUCCESS);
    }
}
