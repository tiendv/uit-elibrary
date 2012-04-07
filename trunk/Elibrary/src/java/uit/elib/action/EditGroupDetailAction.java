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
import uit.elib.bo.GroupDetailBO;
import uit.elib.dto.Groupdetail;
import uit.elib.dto.Resourcecategory;
import uit.elib.bo.ResourceCategoryBO;
import uit.elib.dto.Resourcecategory;
import uit.elib.dto.Group;
import java.util.List;
import javax.servlet.http.HttpSession;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class EditGroupDetailAction extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "success";

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
                String listView="";
                String[] listViewArray={""};
                String listDownload="";
                String[] listDownloadArray={""};
                if(request.getParameter("view")!="")
                {
                    listView = request.getParameter("view");
                listView = listView.substring(0, listView.length()-1);
                listViewArray = listView.split(","); // chuỗi các loại tài nguyên ID xem
                }
                if(request.getParameter("download")!="")
                {
                    listDownload = request.getParameter("download");
                listDownload = listDownload.substring(0, listDownload.length()-1);
                listDownloadArray = listDownload.split(","); // chuỗi các loại tài nguyên download
                }
                int groupID = Integer.parseInt(request.getParameter("groupID"));
                // xóa chi tiết nhóm cũ
                String delete_old_groupdetail = "delete from `groupdetail` where GroupID="+groupID;
                GroupDetailBO.getGroupDetailBO().deleteGroupDetail(delete_old_groupdetail);
                Resourcecategory resourceCategory = new Resourcecategory();
                Groupdetail groupDetail = new Groupdetail();
                Group group = new Group();
                if(request.getParameter("view")!="") // nếu listViewArray.length=1 nghỉa là ko có checkbox nào được check => ko cần insert vào csdl
                    for (int i = 0; i < listViewArray.length; i++) { // i=0 là giá trị listviewArray[0] = -1
                        resourceCategory.setResourceCategoryId(Integer.parseInt(listViewArray[i]));
                        group.setGroupId(groupID);
                        groupDetail.setResourcecategory(resourceCategory);
                        groupDetail.setValue(1);
                        groupDetail.setGroup(group);
                        GroupDetailBO.getGroupDetailBO().insertGroupDetail(groupDetail);
                    }
                if(request.getParameter("download")!="")
                    for (int j = 0; j < listDownloadArray.length; j++) { //j=0 là giá trị listdownloadArray[0] = -1
                        resourceCategory.setResourceCategoryId(Integer.parseInt(listDownloadArray[j]));
                        group.setGroupId(groupID);
                        groupDetail.setResourcecategory(resourceCategory);
                        groupDetail.setValue(2);
                        groupDetail.setGroup(group);
                        GroupDetailBO.getGroupDetailBO().insertGroupDetail(groupDetail);
                    }
                        Boolean success =true;
                        String href="./LoadListOfGroupDetail.do";
                        request.setAttribute("success",success);
                        request.setAttribute("href",href);
            }
        }
        return null;
    }
}
