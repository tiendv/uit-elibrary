/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.UserBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Group;
import uit.elib.dto.Level;
import uit.elib.dto.User;
import uit.elib.formbean.CreateUserForm;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateUserAction extends org.apache.struts.action.Action {

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
        
        CreateUserForm createUserForm = (CreateUserForm)form;
        UserBO userBO = UserBO.getUserBO();
        User user = new User();
        Level level = new Level();
        Group group = new Group();
        Faculty faculty = new Faculty();
        user.setStatus(createUserForm.getDropStatus());
        user.setUserName(createUserForm.getTxtUserName());
        user.setLoginName(createUserForm.getTxtLoginName());
        user.setPassWord(createUserForm.getTxtPassword());
        level.setLevelId(createUserForm.getDropLevel());
        user.setLevel(level);
        group.setGroupId(createUserForm.getDropGroup());
        user.setGroup(group);
        faculty.setFacultyId(createUserForm.getDropFaculty());
        user.setFaculty(faculty);
        user.setRealName(createUserForm.getTxtRealName());
        user.setClass_(createUserForm.getTxtClass());
        user.setSchoolYear(createUserForm.getTxtSchoolYear());
        user.setAddress(createUserForm.getTxtAddress());
        user.setWorkPlace(createUserForm.getTxtWorkPlace());
        DateFormat formatter ; 
        Date date ; 
        formatter = new SimpleDateFormat("dd/MM/yyyy");
        date = (Date)formatter.parse(createUserForm.getBirthday());   
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        user.setBirthday(sqlDate);
        date = (Date)formatter.parse(createUserForm.getExpiredDay());
        sqlDate = new java.sql.Date(date.getTime());
        user.setExpiredDay(date);
        userBO.insert(user);
        Boolean success =true;
        request.setAttribute("success",success);     
        String href="./LoadCreateUser.do";
        request.setAttribute("href",href);          
        return mapping.findForward(SUCCESS);
    }
}
