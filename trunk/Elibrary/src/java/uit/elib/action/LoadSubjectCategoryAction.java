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
import uit.elib.dto.Resource;
import uit.elib.dto.Subject;
import uit.elib.utility.IsNumber;
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
        IsNumber isnumber = new IsNumber(); // kiểm tra có phải là số không
        if(request.getParameter("subjectID")!= null && isnumber.checkInt(request.getParameter("subjectID")))
            subjectID = Integer.parseInt(request.getParameter("subjectID"));
        else
            subjectID = 1;
        if(request.getParameter("resourceCategoryID")!= null && isnumber.checkInt(request.getParameter("resourceCategoryID")))
            resourcecategoryID =Integer.parseInt(request.getParameter("resourceCategoryID"));
        else
            resourcecategoryID = 1;
        if(request.getParameter("orderChapter")!= null && isnumber.checkInt(request.getParameter("orderChapter")))
            orderChapter = Integer.parseInt(request.getParameter("orderChapter"));
        else
            orderChapter = 1;
        List<Resource> listResource = new ArrayList<Resource>(); // danh sách tài nguyên của
        List<Resource> listChapter = new ArrayList<Resource>(); // danh sách chương của môn học
        Subject subject = new Subject(); // danh sách môn học có mã môn học tương ứng
        listResource = ResourceBO.getResourceBO().getAllResourceOfSubjectAndResourceCategory(subjectID, resourcecategoryID);
        listChapter = ResourceBO.getResourceBO().getAllResourceOfSubjectAndResourceCategory(subjectID, 7);
        subject = SubjectBO.getSubjectBO().getSubjectByID(subjectID);
        request.setAttribute("listResource", listResource);
        request.setAttribute("listChapter", listChapter);
        request.setAttribute("subjectID", subjectID);
        request.setAttribute("resourceCategoryID", resourcecategoryID);
        request.setAttribute("orderChapter", orderChapter);
        request.setAttribute("subject", subject);
        return mapping.findForward(SUCCESS);
        
    }
    }
