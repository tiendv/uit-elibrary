/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;

import java.util.List;
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
            return listUser.get(0).getGroup().getGroupId();
        }
        return 2;// visitor
    }
}
