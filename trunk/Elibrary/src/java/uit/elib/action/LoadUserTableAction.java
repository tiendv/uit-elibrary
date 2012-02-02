/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.UserBO;
import uit.elib.dto.User;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadUserTableAction extends org.apache.struts.action.Action {

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
            response.setCharacterEncoding("UTF-8");
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language = 2; // VietNamese
            List<User> listUser = UserBO.getUserBO().getUser();
            int color = 1;
            if(listUser.size()>0)
            {
            if(language==1){
                response.getWriter().println("<table class=\"resource_table\">");
                response.getWriter().println("<tr class=\"color_title_table\">");
                response.getWriter().println("<td class=\"td11\">");
                response.getWriter().println("Number");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td21\">");
                response.getWriter().println("UserName");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td31\">");
                response.getWriter().println("Delete");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td41\">");
                response.getWriter().println("Edit");
                response.getWriter().println("</td>");        
                response.getWriter().println("</tr>"); 
                for(int i=0;i<listUser.size();i++){  
                    if(color%2==0)
                        response.getWriter().println("<tr class=\"color_table2\">");
                    else
                        response.getWriter().println("<tr>");
                    response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td>");
                    response.getWriter().println(listUser.get(i).getUserName());
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=\"center\">");
                    response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listUser.get(i).getUserName()+"\" />");
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=\"center\">");
                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=editUser(\""+listUser.get(i).getUserName()+"\") />");
                    response.getWriter().println("</td>");        
                    response.getWriter().println("</tr>");        
                    color++;
                }
                response.getWriter().println("</table>");
                response.getWriter().println("<div class=\"divdelete\" id=\"divdelete\"><input class=\"btn\" type=\"submit\" value=\"Delete\" onclick=\"deleteResource()\"/></div>");               
            }
            if(language==2){
                response.getWriter().println("<table class=\"resource_table\">");
                response.getWriter().println("<tr class=\"color_title_table\">");
                response.getWriter().println("<td class=\"td11\">");
                response.getWriter().println("STT");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td21\">");
                response.getWriter().println("Tên Thành Viên");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td31\">");
                response.getWriter().println("Xóa");
                response.getWriter().println("</td>");
                response.getWriter().println("<td class=\"td41\">");
                response.getWriter().println("Sửa");
                response.getWriter().println("</td>");        
                response.getWriter().println("</tr>"); 
                for(int i=0;i<listUser.size();i++){  
                    if(color%2==0)
                        response.getWriter().println("<tr class=\"color_table2\">");
                    else
                        response.getWriter().println("<tr>");
                    response.getWriter().println("<td class=\"center\">");
                        response.getWriter().println(i+1);
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td>");
                    response.getWriter().println(listUser.get(i).getUserName());
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=\"center\">");
                    response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listUser.get(i).getUserName()+"\" />");
                    response.getWriter().println("</td>");
                    response.getWriter().println("<td class=\"center\">");
                    response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=editUser(\""+listUser.get(i).getUserName()+"\") />");
                    response.getWriter().println("</td>");        
                    response.getWriter().println("</tr>");        
                    color++;
                }
                response.getWriter().println("</table>");
                response.getWriter().println("<div class=\"divdelete\" id=\"divdelete\"><input class=\"btn\" type=\"submit\" value=\"Xóa\" onclick=\"deleteResource()\"/></div>");
            }
            response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listUser.size()+"\" />");
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
