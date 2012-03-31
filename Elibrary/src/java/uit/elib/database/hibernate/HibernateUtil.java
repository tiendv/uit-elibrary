/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package uit.elib.database.hibernate;


import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.stat.Statistics;

/**
 *
 * 
 * Quan ly cac session va transaction cua Hibernate
 * 
 */
public class HibernateUtil {

    private SessionFactory sessionFactory;
    private Session session;
    private String sessionFactoryConfigPath;

    protected LockMode lockMode;
    protected Order order;
    protected Criteria criteria;
    protected Restrictions restrictions;

    public HibernateUtil() throws Exception {
        sessionFactoryConfigPath = "";
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public HibernateUtil(String sessionFactoryConfigPath) {
        this.sessionFactoryConfigPath = sessionFactoryConfigPath;
        sessionFactory = new Configuration().configure(sessionFactoryConfigPath).buildSessionFactory();
    }

    /**
     * Begin a transaction
     */
    protected void beginTransaction() {
        session = sessionFactory.openSession();
        session.beginTransaction();
        Statistics statistics = sessionFactory.getStatistics();
        statistics.setStatisticsEnabled(true);
        statistics.logSummary();
    }

    /**
     * Commit transaction and close session
     */
    protected void commitAndClose() {
        if (session != null) {
            session.flush();
            session.beginTransaction().commit();
            if (session.isOpen()) {
                session.close();
            }
        }
    }
    /**
     * Commit transaction
     */    
    protected void commit() {
        if (session != null) {
            session.flush();
            session.beginTransaction().commit();
        }
    }
    /**
     * Commit transaction and close session
     */    
    protected void close() {
        if (session != null) {
            if (session.isOpen()) {
                session.close();
            }
        }
    }
    /**
     * Get Current Session
     * @return session
     * @throws Exception
     */
    protected Session openSession() throws Exception {
        if (session == null) { // check session null
            if (sessionFactory == null) { // buil Factory Session if it's null
                if (sessionFactoryConfigPath == null || sessionFactoryConfigPath.equals("")) {
                    sessionFactory = new Configuration().configure().buildSessionFactory();
                } else {
                    sessionFactory = new Configuration().configure(this.sessionFactoryConfigPath).buildSessionFactory();
                }
            }
            session = sessionFactory.openSession();
        }
        return session;
    }
}
