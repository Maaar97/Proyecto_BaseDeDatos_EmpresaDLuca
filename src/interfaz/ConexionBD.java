
package interfaz;
import java.sql.*;
import javax.swing.JOptionPane;


public class ConexionBD {
    Connection conect = null;
    
    public Connection conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conect = DriverManager.getConnection("jdbc:mysql://localhost/base_de_datos_proyecto","root","marianorv");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error de conexion");
            JOptionPane.showMessageDialog(null,"Error de conexion"+e);
        }
        return conect;
    }
}
