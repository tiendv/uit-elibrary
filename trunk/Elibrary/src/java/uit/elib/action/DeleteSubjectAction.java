/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.ResourceBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HERO
 */
public class DeleteSubjectAction {
    private static final String SUCCESS = "success";
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String subjectsID = request.getParameter("subjectsID");
        subjectsID = subjectsID.substring(0, subjectsID.length()-1);
        String sqlresource = "delete from resource where SubjectID in("+subjectsID+")";
        String sqlsubject = "delete from subject where SubjectID in("+subjectsID+")";
        ResourceBO resourceBO = ResourceBO.getResourceBO();
        resourceBO.DeleteResource(sqlresource);
        SubjectBO subjectBO = SubjectBO.getSubjectBO();
        subjectBO.DeleteSubject(sqlsubject);
//        ResourceBO.getResourceBO().DeleteResource(sqlresource);
//        SubjectBO.getSubjectBO().DeleteSubject(sqlsubject);
        return mapping.findForward(SUCCESS);
    }
}
