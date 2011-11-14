/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Class for connecting to the database.
 */
public class ConnectionService {

    /**
     * Return the connection.
     *
     * @return Connection to the database
     * @throws NamingException
     * @throws SQLException
     */
    public static Connection getConnection() throws NamingException, SQLException {
        Connection con = null;
        try {
            DataSource ds = (DataSource) new InitialContext().lookup("");
            con = ds.getConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
