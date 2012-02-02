/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import uit.elib.formbean.EditUserForm;
import uit.elib.utility.SHA512;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class EditUserAction extends org.apache.struts.action.Action {

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
        EditUserForm editUserForm  = (EditUserForm)form;
        User user = new User();
        UserBO userBO = UserBO.getUserBO();
        List<User> listUser =UserBO.getUserBO().getUser("username="+"'"+editUserForm.getTxtUserName()+"'");
        user = listUser.get(0);
        Level level = new Level();
        Group group = new Group();
        Faculty faculty = new Faculty();
        user.setStatus(editUserForm.getDropStatus());
        user.setUserName(editUserForm.getTxtUserName());
        user.setLoginName(editUserForm.getTxtLoginName());
        if(editUserForm.getTxtPassword().length()>0)
        {
            SHA512 sha512 = new SHA512();
            String password = sha512.SHA512(editUserForm.getTxtPassword());
            user.setPassWord(password);            
        }
        level.setLevelId(editUserForm.getDropLevel());
        user.setLevel(level);
        group.setGroupId(editUserForm.getDropGroup());
        user.setGroup(group);
        faculty.setFacultyId(editUserForm.getDropFaculty());
        user.setFaculty(faculty);
        user.setRealName(editUserForm.getTxtRealName());
        user.setClass_(editUserForm.getTxtClass());
        user.setSchoolYear(editUserForm.getTxtSchoolYear());
        user.setAddress(editUserForm.getTxtAddress());
        user.setWorkPlace(editUserForm.getTxtWorkPlace());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
        Date date ; 
        date = simpleDateFormat.parse(editUserForm.getBirthday());   
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        user.setBirthday(sqlDate);
        date = simpleDateFormat.parse(editUserForm.getExpiredDay());
        sqlDate = new java.sql.Date(date.getTime());
        user.setExpiredDay(date);
        userBO.UpdateUser(user);
        Boolean success =true;
        request.setAttribute("success",success);     
        String href="./LoadListOfUser.do";
        request.setAttribute("href",href);          
        return mapping.findForward(SUCCESS);        
    }
}

