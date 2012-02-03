/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateIPForm extends org.apache.struts.action.ActionForm {
    int dropStatus;
    String txtSourceIP;
    String txtDestinationIP;

    public String getTxtDestinationIP() {
        return txtDestinationIP;
    }

    public void setTxtDestinationIP(String txtDestinationIP) {
        this.txtDestinationIP = txtDestinationIP;
    }

    public String getTxtSourceIP() {
        return txtSourceIP;
    }

    public void setTxtSourceIP(String txtSourceIP) {
        this.txtSourceIP = txtSourceIP;
    }

    public int getDropStatus() {
        return dropStatus;
    }

    public void setDropStatus(int dropStatus) {
        this.dropStatus = dropStatus;
    }
}
