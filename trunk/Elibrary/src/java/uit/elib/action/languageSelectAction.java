package uit.elib.action;
import java.util.Locale;

//
//    Document   : Language selection Action
//    Created on : Nov 14, 2011, 8:19:03 AM
//    Author     : Nguyen Hoang Tan
//

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class languageSelectAction extends DispatchAction {

    private ActionForward myAction;

    public ActionForward vietnamese(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String url = request.getParameter("page");
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, new Locale("vi","VN"));
        if (!url.isEmpty()) {
            myAction = new ActionForward(url, true);
        }
        request.getSession().setAttribute("PreAction", url);
        return myAction;
    }

    public ActionForward english(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String url = request.getParameter("page");
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, Locale.ENGLISH);
        if (!url.isEmpty()) {
            myAction = new ActionForward(url,true);
        }
        request.getSession().setAttribute("PreAction", url);
        return myAction;
    }
}
