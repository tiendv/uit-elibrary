/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import uit.elib.bo.UserBO;
import uit.elib.dto.User;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CheckGroup {
    public int Group(String username) throws Exception
    {
        UserBO userBO = UserBO.getUserBO();
        List<User> listUser = userBO.getUser("userName='"+username+"'");
        if(listUser.size()>0)
        {
            Date today = new Date();
            if(today.getTime()>listUser.get(0).getExpiredDay().getTime()|| listUser.get(0).getStatus()==0)
            {
                return -1;// account has just been locked while users are accessing or  account has just expired while users are accessing
            }
            return listUser.get(0).getGroup().getGroupId();
        }
        return 2;// visitor
    }
}
