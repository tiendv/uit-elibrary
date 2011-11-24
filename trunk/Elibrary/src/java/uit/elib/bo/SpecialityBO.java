/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.entities.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tiendv
 */
public class SpecialityBO extends ManagerBase<Speciality> {

    public SpecialityBO() throws Exception {
    }
    
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
    
     public List getAllSpeciality() {
        try {
            String[] sort = new String[]{"specialityId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Speciality> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(Subject.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

     
 
}
