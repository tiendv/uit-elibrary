/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.jboss.weld.context.http.Http;
import uit.elib.bo.ResourceBO;
import uit.elib.entities.Resource;
/**
 *
 * @author HERO
 */
public class LoadLectureNoteAction extends org.apache.struts.action.Action{
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int subjectID =Integer.parseInt(request.getParameter("SubjectID"));
        int resourcecategoryID =Integer.parseInt(request.getParameter("ResourceCategoryID"));
        ResourceBO tempResourceBO = new ResourceBO();
        List<Resource> listResource = new ArrayList<Resource>();
        listResource = tempResourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID, resourcecategoryID);
        //listResource = tempResourceBO.getAllChapterOfSubject(13);
        request.setAttribute("listResource", listResource);
        return mapping.findForward(SUCCESS);
    }
    }
