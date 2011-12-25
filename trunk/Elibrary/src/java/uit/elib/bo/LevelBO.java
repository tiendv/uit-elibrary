/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import java.util.List;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LevelBO extends ManagerBase<Level> {
   private static LevelBO levelBO = null;

    public LevelBO() throws Exception {
    }
    public static LevelBO getLevelBO() throws Exception{
        if(levelBO == null){
            levelBO = new LevelBO();
        }
        return levelBO;
    }    
    public List getAllLevel() {
    try {
        String[] sort = new String[]{"levelId"}; // tang dan
        //String[] sort = new String[]{"name desc"}; // giam dan

        List<Level> list = getBySQLQuery(sort, 0);
        return list;

        } catch (Exception ex) {
            Logger.getLogger(LevelBO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            return null;
        }
    }   
}
