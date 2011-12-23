/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.util.List;
import org.apache.struts.Globals;
import uit.elib.bo.ResourceBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Resource;
import uit.elib.dto.Subject;
/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadResourceTableAction extends org.apache.struts.action.Action {

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
        int chapterID = -1;
        int resourceCategoryID = Integer.parseInt(request.getParameter("resourceCategoryID"));
        int subjectID = Integer.parseInt(request.getParameter("subjectID")); 
        String [] sort = new String[1];
        sort[0]="resourceId";
        String where="ResourceCategoryID="+resourceCategoryID+" and subjectID="+subjectID;
        if(resourceCategoryID==4 || resourceCategoryID==5 || resourceCategoryID==10 || resourceCategoryID==11)
        {
            chapterID = Integer.parseInt(request.getParameter("chapterID"));
            where="ResourceCategoryID="+resourceCategoryID+" and subjectID="+subjectID+" and orderChapter="+chapterID;
        }
        ResourceBO resourceBO = ResourceBO.getResourceBO();
        List<Resource> listResource = resourceBO.getAllResource(where,sort);
        SubjectBO subjectBO =  SubjectBO.getSubjectBO();
        response.setCharacterEncoding("UTF-8");
        int language =1; // English
        if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
            language = 2; // VietNamese
        if(listResource.size()>0)
        {
            if(language==1)
            {
                response.getWriter().println("<table>");
                response.getWriter().println("<tr>");
                response.getWriter().println("<td>");
                response.getWriter().println("Number");
                response.getWriter().println("</td>");
                response.getWriter().println("<td>");
                response.getWriter().println("Resource Name");
                response.getWriter().println("</td>");        
                response.getWriter().println("</tr>");
                if(resourceCategoryID ==12)
                {    
                    for(int i=0;i<listResource.size();i++)
                    {       
                        response.getWriter().println("<tr>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        List<Subject> listSubject = subjectBO.getSubject(subjectID);
                        response.getWriter().println(listSubject.get(0).getSubjectNameEn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                    }
                }
                else
                {
                    for(int i=0;i<listResource.size();i++)
                    {
                        response.getWriter().println("<tr>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(listResource.get(i).getResourceNameEn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                    }                
                }
                response.getWriter().println("</table>"); 
                response.getWriter().println("<div id=\"btnDelete\"><input type=\"submit\" value=\"Delete\" onclick=\"deleteResource()\"/></div>");
            }
            if(language==2)
            {
                response.getWriter().println("<table>");
                response.getWriter().println("<tr>");
                response.getWriter().println("<td>");
                response.getWriter().println("STT");
                response.getWriter().println("</td>");
                response.getWriter().println("<td>");
                response.getWriter().println("Tên tài nguyên");
                response.getWriter().println("</td>");        
                response.getWriter().println("</tr>");
                if(resourceCategoryID ==12)
                {    
                    for(int i=0;i<listResource.size();i++)
                    {
                        response.getWriter().println("<tr>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        List<Subject> listSubject = subjectBO.getSubject(subjectID);
                        response.getWriter().println(listSubject.get(0).getSubjectNameVn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                    }
                }
                else
                {                
                    for(int i=0;i<listResource.size();i++)
                    {
                        response.getWriter().println("<tr>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(listResource.get(i).getResourceNameVn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>"); 
                        response.getWriter().println("<td>");
                        response.getWriter().println("<input type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                    }
                }
                response.getWriter().println("</table>");
                response.getWriter().println("<div id=\"btnDelete\"><input type=\"submit\" value=\"Xóa\" onclick=\"deleteResource()\"/></div>");
            }
            response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listResource.size()+"\" />");

        }
        else
        {
            if(language==1)
                response.getWriter().println("Updating");
            if(language==2)
                response.getWriter().println("Đang cập nhật");
        }

        return null;
    }
}
