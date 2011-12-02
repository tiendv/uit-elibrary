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
public class LoadSubjectCategoryAction extends org.apache.struts.action.Action{
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int subjectID =Integer.parseInt(request.getParameter("subjectID"));
        int resourcecategoryID =Integer.parseInt(request.getParameter("resourceCategoryID"));
        int orderChapter = Integer.parseInt(request.getParameter("orderChapter"));
        ResourceBO tempResourceBO = new ResourceBO();
        List<Resource> listResource = new ArrayList<Resource>(); // danh sách tài nguyên của
        List<Resource> listChapter = new ArrayList<Resource>(); // danh sách chương của môn học
        listResource = tempResourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID, resourcecategoryID);
        listChapter = tempResourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID, 7);
        request.setAttribute("listResource", listResource);
        request.setAttribute("listChapter", listChapter);
        request.setAttribute("subjectID", subjectID);
        request.setAttribute("resourceCategoryID", resourcecategoryID);
        request.setAttribute("orderChapter", orderChapter);
        return mapping.findForward(SUCCESS);
        
    }
    }
