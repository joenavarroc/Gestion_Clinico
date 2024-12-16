package gestionClinico;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.ResultSet;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import gestionClinico.connectors.Connector;

@SpringBootTest
public class TestConnector {
    
    private Connection connection=Connector.getConnection();

    @Test
    public void TestDeConexion(){
        try (ResultSet rs=connection
                                    .createStatement()
                                    .executeQuery("select version()")){
            if(rs.next()){
                String version=rs.getString(1);
                if(version!=null && !version.isEmpty()){
                    assertEquals(true, true);
                }else{
                    assertEquals(true, false);
                }
            }else{
                assertEquals(true, false);
            }
        } catch (Exception e) {
            assertEquals(true, false);
        }
    }

}

