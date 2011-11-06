/**
 *
 * @author Huynh Ngoc Tin
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.dbaccess;

import java.sql.Connection;
import uit.elib.dbconnection.ConnectionService;

public class MapperDB {

    /**
     * @uml.property  name="connection"
     */
    private Connection connection;

    /**
     * The constructor.
     * @throws Exception
     */
    public MapperDB() throws Exception {
        try {
            connection = ConnectionService.getConnection();
        } catch (Exception e) {
            System.out.println("Failed in constructor method in MapperDB:" + e);
            e.printStackTrace();
            throw e;
        }
    }

    /**
     * The constructor.
     * @param con
     */
    public MapperDB(Connection con) {
        connection = con;
    }

    /**
     * Close the connection
     * @Throws: Exception
     * @throws Exception
     * @Modify: Date :		User:
     * Decription:
     */
    public void closeConnection() throws Exception {
        try {
            getConnection().close();
        } catch (Exception e) {
            System.out.println("Failed in closeConnection method in MapperDB:" + e);
            throw e;
        }
    }

    /**
     * @return
     * @uml.property  name="connection"
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * @param  connection
     * @uml.property  name="connection"
     */
    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}