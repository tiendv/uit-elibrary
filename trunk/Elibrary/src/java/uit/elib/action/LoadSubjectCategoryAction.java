/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import  uit.elib.bo.SubjectBO;
import uit.elib.dto.Resource;
import uit.elib.dto.Subject;
import uit.elib.utility.CheckGroupDetail;
import uit.elib.utility.IsNumber;
/**
 *
 * @author HERO
 */
public class LoadSubjectCategoryAction extends org.apache.struts.action.Action{
    private static final String SUCCESS = "success";
    private static final String UNSUCCESS = "unsuccess";
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
            String username = null;
            HttpSession session = request.getSession();
            if(session.getAttribute("username")!=null)
                username = (String)session.getAttribute("username");
            CheckGroupDetail checkGroupDetail = new CheckGroupDetail();
            if(checkGroupDetail.GroupDetail(username,resourcecategoryID,1)==true)
            {             
                List<Resource> listResource = new ArrayList<Resource>(); // danh sách tài nguyên của
                List<Resource> listChapter = new ArrayList<Resource>(); // danh sách chương của môn học
                listResource = ResourceBO.getResourceBO().getAllResource(subjectID, resourcecategoryID);
                if(resourcecategoryID==6){
                    String []order = new String[1];
                    order[0]="year";
                    listResource = ResourceBO.getResourceBO().getAllResource(subjectID, resourcecategoryID,order);
                }
                listChapter = ResourceBO.getResourceBO().getAllResource(subjectID, 7);
                List<Subject> listSubject=SubjectBO.getSubjectBO().getSubject(subjectID);
                Subject subject = listSubject.get(0);// danh sách môn học có mã môn học tương ứng
                request.setAttribute("listResource", listResource);
                request.setAttribute("listChapter", listChapter);
                request.setAttribute("subjectID", subjectID);
                request.setAttribute("resourceCategoryID", resourcecategoryID);
                request.setAttribute("orderChapter", orderChapter);
                request.setAttribute("subject", subject);
                return mapping.findForward(SUCCESS);
            }           
        return mapping.findForward(UNSUCCESS);    
    }
}
