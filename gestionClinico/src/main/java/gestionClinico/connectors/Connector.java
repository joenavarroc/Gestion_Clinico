package gestionClinico.connectors;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
    private static String url="jdbc:mariadb://localhost:3306/gestionClinico";
    private static String user="root";
    private static String pass="";

    private static Connection conn=null;

    private Connector(){}

    public synchronized static Connection getConnection(){
        try {
            if(conn==null || conn.isClosed()){
                conn=DriverManager.getConnection(url, user, pass);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }
    
}


