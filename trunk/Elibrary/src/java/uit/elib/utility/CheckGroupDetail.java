/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;

import java.util.Date;
import java.util.List;
import uit.elib.bo.GroupDetailBO;
import uit.elib.bo.UserBO;
import uit.elib.dto.Groupdetail;
import uit.elib.dto.User;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CheckGroupDetail {
    public boolean  GroupDetail(String username, int resourceCategoryID, int value) throws Exception
    {
        UserBO userBO = UserBO.getUserBO();
        List<User> listUser = userBO.getUser("userName='"+username+"'");
        if(listUser.size()>0)
        {
            Date today = new Date();
            if(today.getTime()>listUser.get(0).getExpiredDay().getTime()|| listUser.get(0).getStatus()==0)// account has just been locked while users are accessing or  account has just expired while users are accessing
            {
                return false;
            }
            GroupDetailBO groupDetail = GroupDetailBO.getGroupDetailBO(); 
            List<Groupdetail> listGroupDetails = groupDetail.getAllGroupDetail("groupId="+listUser.get(0).getGroup().getGroupId()+" and ResourceCategoryID="+resourceCategoryID+ " and Value="+value, null);
            if(listGroupDetails.size()==1)
                return true;
        }
        return false;
    }    
}
