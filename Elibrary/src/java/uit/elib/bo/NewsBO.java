/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.News;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class NewsBO extends ManagerBase<News> {
    private static NewsBO newsBO = null;

    public NewsBO() throws Exception {
    }
    
     public static NewsBO getNewsBO() throws Exception{
         if (newsBO == null ){
              newsBO = new NewsBO();
          }
         return newsBO;
    }
    public void insert(News news) {
        try {
            addNew(news);
        } catch (Exception ex) {
            Logger.getLogger(NewsBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List getAllNews(String[] sort) {
        try {
            List<News> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(NewsBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public List getAllNews(String query,String []order)
    {
        List<News> list;
        try {
            list = getBySQLQuery(query, order, 0);
            return  list;
        } catch (Exception ex) {
            Logger.getLogger(NewsBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }    
    public int DeleteNews(String sql) throws Exception
    {
        try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(NewsBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }              
    }
    public void updateNews(News n)throws Exception
    {
         try {
             update(n);
        } catch (Exception ex) {
            Logger.getLogger(NewsBO.class.getName()).log(Level.SEVERE, null, ex);
        }             
    }    
}
