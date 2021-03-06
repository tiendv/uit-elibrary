/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.UserBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Group;
import uit.elib.dto.Level;
import uit.elib.dto.User;
import uit.elib.formbean.CreateUserForm;
import uit.elib.utility.CheckGroup;
import uit.elib.utility.SHA512;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateUserAction extends org.apache.struts.action.Action {

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
                CreateUserForm createUserForm = (CreateUserForm)form;
                UserBO userBO = UserBO.getUserBO();
                User user = new User();
                Level level = new Level();
                Group group = new Group();
                Faculty faculty = new Faculty();
                user.setStatus(createUserForm.getDropStatus());
                user.setUserName(createUserForm.getTxtUserName());
                user.setEmail(createUserForm.getTxtEmail());
                SHA512 sha512 = new SHA512();
                String password = sha512.SHA512(createUserForm.getTxtPassword());
                user.setPassWord(password);
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
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
                Date date ; 
                date = simpleDateFormat.parse(createUserForm.getBirthday());   
                java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                user.setBirthday(sqlDate);
                date = simpleDateFormat.parse(createUserForm.getExpiredDay());
                sqlDate = new java.sql.Date(date.getTime());
                user.setExpiredDay(sqlDate);
                user.setSchool(createUserForm.getTxtSchool());
                userBO.insert(user);
                Boolean success =true;
                request.setAttribute("success",success);     
                String href="./LoadListOfUser.do";
                request.setAttribute("href",href);          
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
