/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.GroupBO;
import uit.elib.bo.LevelBO;
import uit.elib.bo.UserBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Group;
import uit.elib.dto.Level;
import uit.elib.dto.User;
import uit.elib.formbean.EditUserForm;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadEditUserAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String UNSUCCESS = "unsuccess";  

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
        int checkgroup =2; //visitor 
        HttpSession session = request.getSession();
        if(session.getAttribute("username")!=null){ 
            CheckGroup checkGroup = new CheckGroup();
            checkgroup = checkGroup.Group((String)session.getAttribute("username"));
            if(checkgroup==-1) // account has just been locked while users are accessing or  account has just expired while users are accessing
            {   
                 session.removeAttribute("username");
                 session.removeAttribute("group");
            }
            if(checkgroup==1)
            {          
                if(request.getParameter("username")!=null)
                {
                    UserBO userBO = UserBO.getUserBO();
                    String username = request.getParameter("username");
                    List<User> listUser = userBO.getUser("username="+"'"+username+"'");
                    if(listUser.size()>0)
                    {
                        EditUserForm editUserForm = (EditUserForm)form;
                        editUserForm.setTxtUserName(listUser.get(0).getUserName());
                        editUserForm.setTxtEmail(listUser.get(0).getEmail());
                        editUserForm.setTxtRealName(listUser.get(0).getRealName());
                        editUserForm.setTxtAddress(listUser.get(0).getAddress());
                        editUserForm.setTxtClass(listUser.get(0).getClass_());
                        editUserForm.setTxtSchoolYear(listUser.get(0).getSchoolYear());
                        editUserForm.setTxtWorkPlace(listUser.get(0).getWorkPlace());
                        editUserForm.setDropFaculty(listUser.get(0).getFaculty().getFacultyId());
                        editUserForm.setDropGroup(listUser.get(0).getGroup().getGroupId());
                        editUserForm.setDropLevel(listUser.get(0).getLevel().getLevelId());
                        editUserForm.setDropStatus(listUser.get(0).getStatus());
                        editUserForm.setTxtSchool(listUser.get(0).getSchool());
                        List<Group> listGroup = GroupBO.getGroupBO().getAllGroup("groupId<>2",null );
                        editUserForm.setListDropGroup(listGroup);
                        List<Level> listLevel = LevelBO.getLevelBO().getAllLevel();
                        editUserForm.setListDropLevel(listLevel);
                        List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty();
                        editUserForm.setListDropFaculty(listFaculty);
                        request.setAttribute("listUser",listUser);
                        return mapping.findForward(SUCCESS);
                    }
                }          
             }
        }
        return mapping.findForward(UNSUCCESS);
    }
}