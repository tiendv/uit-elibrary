/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.NewsBO;
import uit.elib.dto.News;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadNewsTableAction extends org.apache.struts.action.Action {

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
                    int language =1; // English
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
                        language = 2; // VietNamese
                    String []sort = new String[1];
                    sort[0]="postDate desc";
                    List<News> listNews = NewsBO.getNewsBO().getAllNews(sort);
                    int color = 1;
                    if(listNews.size()>0)
                    {
                    if(language==1){
                        response.getWriter().println("<table class=\"resource_table\">");
                        response.getWriter().println("<tr class=\"color_title_table\">");
                        response.getWriter().println("<td class=\"td11\">");
                        response.getWriter().println("Number");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"td21\">");
                        response.getWriter().println("Title");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"td31\">");
                        response.getWriter().println("Delete");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"td41\">");
                        response.getWriter().println("Edit");
                        response.getWriter().println("</td>");        
                        response.getWriter().println("</tr>"); 
                        for(int i=0;i<listNews.size();i++){  
                            if(color%2==0)
                                response.getWriter().println("<tr class=\"color_table2\">");
                            else
                                response.getWriter().println("<tr>");
                            response.getWriter().println("<td class=\"center\">");
                                response.getWriter().println(i+1);
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td>");
                            response.getWriter().println(listNews.get(i).getNewsTitleEn());
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td class=\"center\">");
                            response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listNews.get(i).getNewsId()+"\" />");
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td class=\"center\">");
                            response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Edit\" onclick=editNews(\""+listNews.get(i).getNewsId()+"\") />");
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
                        response.getWriter().println("Tiêu đề");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"td31\">");
                        response.getWriter().println("Xóa");
                        response.getWriter().println("</td>");
                        response.getWriter().println("<td class=\"td41\">");
                        response.getWriter().println("Sửa");
                        response.getWriter().println("</td>");        
                        response.getWriter().println("</tr>"); 
                        for(int i=0;i<listNews.size();i++){  
                            if(color%2==0)
                                response.getWriter().println("<tr class=\"color_table2\">");
                            else
                                response.getWriter().println("<tr>");
                            response.getWriter().println("<td class=\"center\">");
                                response.getWriter().println(i+1);
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td>");
                            response.getWriter().println(listNews.get(i).getNewsTitleVn());
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td class=\"center\">");
                            response.getWriter().println("<input type=\"checkbox\" id=\""+i+"\" value=\""+listNews.get(i).getNewsId()+"\" />");
                            response.getWriter().println("</td>");
                            response.getWriter().println("<td class=\"center\">");
                            response.getWriter().println("<input class=\"btn\" type=\"submit\" value=\"Sửa\" onclick=editNews(\""+listNews.get(i).getNewsId()+"\") />");
                            response.getWriter().println("</td>");        
                            response.getWriter().println("</tr>");        
                            color++;
                        }
                        response.getWriter().println("</table>");
                        response.getWriter().println("<div class=\"divdelete\" id=\"divdelete\"><input class=\"btn\" type=\"submit\" value=\"Xóa\" onclick=\"deleteResource()\"/></div>");
                    }
                    response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listNews.size()+"\" />");
                }
                else
                {
                    if(language==1)
                        response.getWriter().println("Updating");
                    if(language==2)
                        response.getWriter().println("Đang cập nhật");
                }
            }
        }
        return null;
    }
}
