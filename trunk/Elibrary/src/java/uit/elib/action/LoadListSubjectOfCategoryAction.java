/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Subject;
/**
 *
 * @author HERO
 */
public class LoadListSubjectOfCategoryAction extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setCharacterEncoding("UTF-8");
        String where="";
        List<Subject> listSubject;
        String[] sort = new String[]{"subjectId"};
        if(request.getParameter("subjectCategoryID")!= null && request.getParameter("facultyID")!= null ) // if both of them is valid
        {
            int color=1;
            int categoryID = Integer.parseInt(request.getParameter("subjectCategoryID"));
            int facultyID = Integer.parseInt(request.getParameter("facultyID"));
            int language = Integer.parseInt(request.getParameter("language")); // 1-EN, 2-VI
            if(facultyID== -1)
                where = "subjectCategoryId="+categoryID;
            else
                where = "subjectCategoryId="+categoryID +" and facultyId="+facultyID;
            //sort[0]="subjectId";
            listSubject = SubjectBO.getSubjectBO().getAllSubject(where, sort);
            
            
            //begin visible TABLE
            response.getWriter().println("<table class=resource_table>");
                response.getWriter().println("<tr class=color_title_table>");//Title of table
                response.getWriter().println("<td width=25%>");
                if(language==1) //EN
                    response.getWriter().println("Subject code");
                if(language==2) //VI
                    response.getWriter().println("Mã môn học");
                response.getWriter().println("</td>");
                response.getWriter().println("<td width=60%>");
                if(language==1) //EN
                    response.getWriter().println("Subject name");
                if(language==2) //VI
                    response.getWriter().println("Tên môn học");
                response.getWriter().println("</td>");
                response.getWriter().println("<td width=15%>");
                if(language==1) //EN
                    response.getWriter().println("Delete");
                if(language==2) //VI
                    response.getWriter().println("Xóa");
                response.getWriter().println("</td>");
                response.getWriter().println("</tr>");
            if(listSubject.size()==0)
            {
                response.getWriter().println("<tr>");
                response.getWriter().println("<td>");
                response.getWriter().println("</td>");
                response.getWriter().println("<td>");
                if(language==1) //EN
                    response.getWriter().println("None");
                if(language==2) //VI
                    response.getWriter().println("Không có");
                response.getWriter().println("</td>");
                response.getWriter().println("</tr>");
            }
            else
            {
                
                for(int i=0; i<listSubject.size();i++)
                {
                    response.getWriter().println("<tr>");
                    if(color%2==0)//thay đổi màu xen kẽ cho dòng
                        response.getWriter().println("<td class=color_table2>");
                    else
                    response.getWriter().println("<td>");
                    response.getWriter().println(listSubject.get(i).getCourseCode().toString());
                    response.getWriter().println("</td>");
                    if(color%2==0)//thay đổi màu xen kẽ cho dòng
                        response.getWriter().println("<td class=color_table2>");
                    else
                        response.getWriter().println("<td>");
                    if(language==1)
                    response.getWriter().println(listSubject.get(i).getSubjectNameEn().toString());
                    if(language==2)
                    response.getWriter().println(listSubject.get(i).getSubjectNameVn().toString());
                    response.getWriter().println("</td>");
                    if(color%2==0)//thay đổi màu xen kẽ cho dòng
                        response.getWriter().println("<td class=color_table2>");
                    else
                        response.getWriter().println("<td>");
                    response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listSubject.get(i).getSubjectId() +"\" />");
                    response.getWriter().println("</td>");        
                    response.getWriter().println("</tr>");
                    color++;
                }
                response.getWriter().println("</table>");
                response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listSubject.size()+"\" />");
                response.getWriter().println("<div id=\"btnDelete\"><input type=\"submit\" value=\"Delete\" onclick=\"deletesubject()\"/></div>");
            }
            
        }
        return mapping.findForward(SUCCESS);
    }
}
