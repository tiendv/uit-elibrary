/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.UserBO;
import uit.elib.dto.User;
import uit.elib.utility.SHA512;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoginAction extends org.apache.struts.action.Action {

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
    {
        if(request.getParameter("username")!=null)
        {
            String username= request.getParameter("username");
            String password= request.getParameter("password");
            String where = "userName="+"'"+username+"'";
            try
            {
                List<User> listUser= UserBO.getUserBO().checkLogin(where);
                if(listUser.size()>0)
                {    
                    SHA512 sha512 = new SHA512();
                    if(listUser.get(0).getPassWord().equals(sha512.SHA512(password))&&listUser.get(0).getUserName().equals(username))
                    {    
                        if(listUser.get(0).getStatus()==0) // lock
                        {
                            response.getWriter().println("0");                     
                            return null;
                        }
                        if(listUser.get(0).getStatus()==1) // active
                        {
                            Date today = new Date();
                            if(today.getTime()>listUser.get(0).getExpiredDay().getTime())
                            {
                                response.getWriter().println("2"); // expired day
                                return null;
                            }
                            HttpSession httpSession = request.getSession(true);
                            httpSession.setAttribute("username", listUser.get(0).getUserName());
                            response.getWriter().println("1");                     
                            return null;
                        }                       
                    }
                }                
            }
            catch(Exception ex)
            {
                return null;
            }
        } 
        return null;
    }
}           