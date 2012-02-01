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
        if(resourceCategoryID==2) //Thesis
            where="ResourceCategoryID="+resourceCategoryID;
        ResourceBO resourceBO = ResourceBO.getResourceBO();
        List<Resource> listResource = resourceBO.getAllResource(where,sort);
        SubjectBO subjectBO =  SubjectBO.getSubjectBO();
        response.setCharacterEncoding("UTF-8");
        int language =1; // English
        if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
            language = 2; // VietNamese
        int color = 1;
        if(listResource.size()>0)
        {
            if(language==1)
            {
                response.getWriter().println("<table class=\"resource_table\">");
                response.getWriter().println("<tr class=\"color_title_table\">");
                response.getWriter().println("<td class=\"td11\">");
                response.getWriter().println("Number");
                response.getWriter().println("</td>");
                response.getWriter().println("<td wclass=\"td21\">");
                response.getWriter().println("Resource Name");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td31\">");
                response.getWriter().println("Delete");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td41\">");
                response.getWriter().println("Edit");
                response.getWriter().println("</td>");                
                response.getWriter().println("</tr>");
                if(resourceCategoryID ==12 || resourceCategoryID ==8) // Syllabus || Image
                {    
                    for(int i=0;i<listResource.size();i++)
                    {       
                        if(color%2==0)
                            response.getWriter().println("<tr class=\"color_table2\">");
                        else
                            response.getWriter().println("<tr>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        List<Subject> listSubject = subjectBO.getSubject(subjectID);
                        if(resourceCategoryID ==12)
                            response.getWriter().println(listSubject.get(0).getSubjectNameEn()+ " Syllabus" );
                        if(resourceCategoryID ==8)
                            response.getWriter().println(listSubject.get(0).getSubjectNameEn()+ " Image");   
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                        color++;
                    }
                }
                else
                {
                    for(int i=0;i<listResource.size();i++)
                    {
                        if(color%2==0)
                            response.getWriter().println("<tr class=\"color_table2\">");
                        else
                            response.getWriter().println("<tr>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(listResource.get(i).getResourceNameEn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                        color++;
                    }                
                }
                response.getWriter().println("</table>"); 
                response.getWriter().println("<div class=\"divdelete\" id=\"divdelete\"><input class=\"btn\" type=\"submit\" value=\"Delete\" onclick=\"deleteResource()\"/></div>");
            }
            if(language==2)
            {
                response.getWriter().println("<table class=\"resource_table\">");
                response.getWriter().println("<tr class=\"color_title_table\">");
                response.getWriter().println("<td class=\"td11\">");
                response.getWriter().println("STT");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td21\">");
                response.getWriter().println("Tên tài nguyên");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td31\">");
                response.getWriter().println("Xóa");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td41\">");
                response.getWriter().println("Sửa");
                response.getWriter().println("</td>");                
                response.getWriter().println("</tr>");
                if(resourceCategoryID ==12 || resourceCategoryID ==8) // Syllabus || Image
                {    
                    for(int i=0;i<listResource.size();i++)
                    {
                        if(color%2==0)
                            response.getWriter().println("<tr class=\"color_table2\">");
                        else
                            response.getWriter().println("<tr>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        List<Subject> listSubject = subjectBO.getSubject(subjectID);
                        if(resourceCategoryID ==12)
                            response.getWriter().println("Đề cương môn học "+listSubject.get(0).getSubjectNameVn());
                        if(resourceCategoryID ==8)
                            response.getWriter().println("Ảnh môn học "+listSubject.get(0).getSubjectNameVn());                        
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                        color++;
                    }
                }
                else
                {                
                    for(int i=0;i<listResource.size();i++)
                    {
                        if(color%2==0)
                            response.getWriter().println("<tr class=\"color_table2\">");
                        else
                            response.getWriter().println("<tr>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td>");
                        response.getWriter().println(listResource.get(i).getResourceNameVn());
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listResource.get(i).getResourceId() +"\" />");
                        response.getWriter().println("</td>"); 
                        response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=\"editResource("+listResource.get(i).getResourceId() +")\" />");
                        response.getWriter().println("</td>");                        
                        response.getWriter().println("</tr>");
                        color++;
                    }
                }
                response.getWriter().println("</table>");
                response.getWriter().println("<div class=\"divdelete\" id=\"divdelete\"><input class=\"btn\" type=\"submit\" value=\"Xóa\" onclick=\"deleteResource()\"/></div>");
            }
            response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listResource.size()+"\" />");

        }
        else
        {
            if(language==1)
                response.getWriter().println("<div class=\"left\">Updating</div>");
            if(language==2)
                response.getWriter().println("<div class=\"left\">Đang cập nhật</div>");
        }

        return null;
    }
}
