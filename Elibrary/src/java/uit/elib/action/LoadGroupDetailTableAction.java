/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.GroupDetailBO;
import uit.elib.bo.ResourceCategoryBO;
import uit.elib.dto.Resourcecategory;
import uit.elib.dto.Groupdetail;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class LoadGroupDetailTableAction extends org.apache.struts.action.Action {


    /**
     * This is the action called from the Struts framework.
     *
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
            if(checkgroup==1)
            {         
                response.setCharacterEncoding("UTF-8");
                if(request.getParameter("groupID")!=null)
                {
                    String groupID = request.getParameter("groupID");
                    int language = Integer.parseInt(request.getParameter("language"));
                    List<Groupdetail> listGroupDetail = GroupDetailBO.getGroupDetailBO().getAllGroupDetail("GroupID="+groupID, null);
                    List<Resourcecategory> listResourceCategory = ResourceCategoryBO.getResourceCategoryBO().getResourcecategory();
                    // Bắt đầu hiển thị lên trang nội dung

                    response.getWriter().println("<table class=resource_table>");
                    response.getWriter().println("<tr class=color_title_table>");
                    if(language==1)
                    {
                        response.getWriter().println("<td>Order number</td>");
                        response.getWriter().println("<td>Resource type</td>");
                        response.getWriter().println("<td>View</td>");
                        response.getWriter().println("<td>Download</td>");
                    }
                    else
                    {
                        response.getWriter().println("<td>Số thứ tự</td>");
                        response.getWriter().println("<td>Loại tài nguyên</td>");
                        response.getWriter().println("<td>  Xem   </td>");
                        response.getWriter().println("<td> Tải </td>");
                    }
                    response.getWriter().println("</tr>");
                    boolean ckb_view_is_right = false; // kiểm tra đã hiển thị checkbox xem trong 1 dòng for hay chưa
                    boolean ckb_download_is_right = false; // kiểm tra đã hiển thị checkbox tải trong 1 dòng for hay chưa
                    int currentResourceCategoryID=0;// lưu lại giá trị ID của loại tài nguyên trong dòng for để so sánh với bảng groupdetail
                    for (int i = 0; i < listResourceCategory.size(); i++) {
                        ckb_view_is_right = false; // khởi tạo 1 dòng mới thì checkbox xem chưa dc hiển thị
                        ckb_download_is_right = false; // khởi tạo 1 dòng mới thì checkbox xem chưa dc hiển thị
                        currentResourceCategoryID =listResourceCategory.get(i).getResourceCategoryId(); 
                        if(i%2==0)
                        {
                            response.getWriter().println("<tr class=color_table2>");
                        }else
                        {
                            response.getWriter().println("<tr>");
                        }
                        response.getWriter().println("<td class=center>"+(i+1)+"</td>");
                        response.getWriter().println("<td class=center>");
                        if(language==1){
                            response.getWriter().println(listResourceCategory.get(i).getResourceCategoryNameEn());
                        }
                        else{
                            response.getWriter().println(listResourceCategory.get(i).getResourceCategoryNameVn());
                        }
                        response.getWriter().println("</td>");
                        for (int j = 0; j < listGroupDetail.size(); j++) { // dòng for hiển thị checkbox của xem và download
                            if(listGroupDetail.get(j).getResourcecategory().getResourceCategoryId()==currentResourceCategoryID)
                            {
                                if(listGroupDetail.get(j).getValue()==1)
                                {
                                    ckb_view_is_right=true;
                                }
                                if(listGroupDetail.get(j).getValue()==2)
                                {
                                    ckb_download_is_right = true;
                                }
                            }
                        }
                        if(ckb_view_is_right==false)
                            response.getWriter().println("<td class=center><input type=checkbox id="+ i +" value="+currentResourceCategoryID+" /></td>");
                        else
                            response.getWriter().println("<td class=center><input type=checkbox id="+ i +" checked=true value="+currentResourceCategoryID+" /></td>");
                        if(ckb_download_is_right==false)   
                            response.getWriter().println("<td class=center><input type=checkbox id="+i+listResourceCategory.size() +" value="+currentResourceCategoryID+" /></td>");
                        else
                            response.getWriter().println("<td class=center><input type=checkbox id="+i+listResourceCategory.size() +" checked=true value="+currentResourceCategoryID+" /></td>");
                        response.getWriter().println("</tr>");
                    }
                    response.getWriter().println("</table>");
                    response.getWriter().println("<input type=\"hidden\" id=\"listSize\" value=\""+listResourceCategory.size()+"\" />");
                }
            }
        }
        return null;
    }
}
