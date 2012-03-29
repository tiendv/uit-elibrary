/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectDetailBO;
import uit.elib.dto.Subject;
import uit.elib.dto.Subjectdetail;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class LoadListSubjectOfCategoryAction extends org.apache.struts.action.Action{
    
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
                    //Subject detail
                    List<Subjectdetail> listSubjectDetail = new ArrayList<Subjectdetail>();
                    if(categoryID== 1)
                    {
                        where = "subjectCategoryId="+categoryID;
                        listSubject = SubjectBO.getSubjectBO().getAllSubject(where, sort);
                    }
                    else
                    {
                        where = "subjectCategoryId="+categoryID;
                        listSubject = SubjectBO.getSubjectBO().getAllSubject(where, sort);
                        String subjectID="";
                        for(int i=0;i<listSubject.size();i++)
                            subjectID=subjectID+listSubject.get(i).getSubjectId()+",";
                        if(subjectID.length()>0)
                            subjectID=subjectID.substring(0, subjectID.length()-1);
                        listSubjectDetail = SubjectDetailBO.getSubjectDetailBO().getAllSubjectDetail("FacultyID= "+facultyID+" and SubjectID in("+subjectID+")", null);
                    }
                    
                    //sort[0]="subjectId";
                    HashMap hashMap = new HashMap();
                    for(int i=0;i<listSubject.size();i++)
                        hashMap.put(listSubject.get(i).getSubjectId(), i);
                    //begin visible TABLE
                    response.getWriter().println("<table class=resource_table>");
                    response.getWriter().println("<tr class=color_title_table>");//Title of table
                    response.getWriter().println("<td class=td1>");
                    if(language==1) //EN
                        response.getWriter().println("Subject code");
                    if(language==2) //VI
                        response.getWriter().println("Mã môn học");
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=td2>");
                    if(language==1) //EN
                        response.getWriter().println("Subject name");
                    if(language==2) //VI
                        response.getWriter().println("Tên môn học");
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=td3>");
                    if(language==1) //EN
                        response.getWriter().println("Delete");
                    if(language==2) //VI
                        response.getWriter().println("Xóa");
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=td4>");
                    if(language==1) //EN
                        response.getWriter().println("Edit");
                    if(language==2) //VI
                        response.getWriter().println("Sửa");
                    response.getWriter().println("</td>");
                    response.getWriter().println("</tr>");
                    if(categoryID==1)
                    {
                        if(listSubject.isEmpty())
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
                        if(!listSubject.isEmpty())
                        {
                            for(int i=0; i<listSubject.size();i++)
                            {
                                if(color%2==0)//thay đổi màu xen kẽ cho dòng
                                    response.getWriter().println("<tr class=color_table2>");
                                else
                                    response.getWriter().println("<tr>");
                                response.getWriter().println("<td class=center>");
                                response.getWriter().println(listSubject.get(i).getCourseCode().toString());
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td>");
                                if(language==1)
                                response.getWriter().println(listSubject.get(i).getSubjectNameEn().toString());
                                if(language==2)
                                response.getWriter().println(listSubject.get(i).getSubjectNameVn().toString());
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td class=center>");
                                response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listSubject.get(i).getSubjectId() +"\" />");
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td class=center>");
                                if(language==1)
                                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=\"editsubject("+listSubject.get(i).getSubjectId() +")\" />");
                                if(language==2)
                                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=\"editsubject("+listSubject.get(i).getSubjectId() +")\" />");
                                response.getWriter().println("</td>");
                                response.getWriter().println("</tr>");
                                color++;
                            }
                            response.getWriter().println("</table>");
                            response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listSubject.size()+"\" />");                        
                            }    
                    }
                    if(categoryID==2||categoryID==3)
                    {
                        if(listSubjectDetail.isEmpty())
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
                        if(!listSubjectDetail.isEmpty())
                        {
                            for(int i=0; i<listSubjectDetail.size();i++)
                            {
                                if(color%2==0)//thay đổi màu xen kẽ cho dòng
                                    response.getWriter().println("<tr class=color_table2>");
                                else
                                    response.getWriter().println("<tr>");
                                response.getWriter().println("<td class=center>");
                                int position = Integer.parseInt(hashMap.get(listSubjectDetail.get(i).getSubject().getSubjectId()).toString());
                                response.getWriter().println(listSubject.get(position).getCourseCode().toString());
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td>");
                                if(language==1)
                                response.getWriter().println(listSubject.get(position).getSubjectNameEn().toString());
                                if(language==2)
                                response.getWriter().println(listSubject.get(position).getSubjectNameVn().toString());
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td class=center>");
                                response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listSubject.get(position).getSubjectId() +"\" />");
                                response.getWriter().println("</td>");
                                response.getWriter().println("<td class=center>");
                                if(language==1)
                                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=\"editsubject("+listSubject.get(position).getSubjectId() +")\" />");
                                if(language==2)
                                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=\"editsubject("+listSubject.get(position).getSubjectId() +")\" />");
                                response.getWriter().println("</td>");
                                response.getWriter().println("</tr>");
                                color++;
                                
                            }
                            response.getWriter().println("</table>");
                            response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listSubjectDetail.size()+"\" />");
                        }
                    }
                }
            }
        }
        return null;
    }
}
