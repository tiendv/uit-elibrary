/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Resource;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class DeleteSubjectAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */

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
            if(checkgroup==1||checkgroup==3)// admin or mod
            {               
                String subjectsID = request.getParameter("subjectsID");
                subjectsID = subjectsID.substring(0, subjectsID.length()-1);
                String sqlresource = "delete from resource where SubjectID in("+subjectsID+")";
                String sqlsubject = "delete from subject where SubjectID in("+subjectsID+")";
                List<Resource> listresource = ResourceBO.getResourceBO().getAllResource("SubjectID in("+subjectsID+")", null);
        //        ResourceBO resourceBO = ResourceBO.getResourceBO();
        //        resourceBO.DeleteResource(sqlresource);
        //        SubjectBO subjectBO = SubjectBO.getSubjectBO();
        //        subjectBO.DeleteSubject(sqlsubject);
                for (int i = 0; i < listresource.size(); i++) 
                {
                    if(listresource.get(i).getServerName()!=null)
                    {
                        String filePath = getServlet().getServletContext().getRealPath("/") +"upload/"+listresource.get(i).getServerName();
                        File file = new File(filePath);
                        file.delete();
                    }
                }

                ResourceBO.getResourceBO().DeleteResource(sqlresource);
                SubjectBO.getSubjectBO().DeleteSubject(sqlsubject);
            }
        }
        return null;
    }
}
