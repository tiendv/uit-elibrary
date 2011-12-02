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
import  uit.elib.bo.SubjectBO;
import uit.elib.entities.Resource;
import uit.elib.entities.Subject;
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
        
        int subjectID, resourcecategoryID, orderChapter ;
        subjectID =Integer.parseInt(request.getParameter("subjectID"));
        resourcecategoryID =Integer.parseInt(request.getParameter("resourceCategoryID"));
        orderChapter = Integer.parseInt(request.getParameter("orderChapter"));
        ResourceBO tempResourceBO = new ResourceBO();
        SubjectBO tempSubjectBO = new SubjectBO();
        List<Resource> listResource = new ArrayList<Resource>(); // danh sách tài nguyên của
        List<Resource> listChapter = new ArrayList<Resource>(); // danh sách chương của môn học
        Subject subject = new Subject(); // danh sách môn học có mã môn học tương ứng
        listResource = tempResourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID, resourcecategoryID);
        listChapter = tempResourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID, 7);
        subject = tempSubjectBO.getSubjectByID(subjectID);
        request.setAttribute("listResource", listResource);
        request.setAttribute("listChapter", listChapter);
        request.setAttribute("subjectID", subjectID);
        request.setAttribute("resourceCategoryID", resourcecategoryID);
        request.setAttribute("orderChapter", orderChapter);
        request.setAttribute("subject", subject);
        return mapping.findForward(SUCCESS);
        
    }
    }
