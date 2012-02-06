/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoginForm extends org.apache.struts.action.ActionForm {
    String txtUserName;
    String txtPassWord;

    public String getTxtPassWord() {
        return txtPassWord;
    }

    public void setTxtPassWord(String txtPassWord) {
        this.txtPassWord = txtPassWord;
    }

    public String getTxtUserName() {
        return txtUserName;
    }

    public void setTxtUserName(String txtUserName) {
        this.txtUserName = txtUserName;
    }
    
}
