/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author user
 */
public class Usuario {
    
    public Usuario() {
    
    }
    
    public String MD5(String md5){
        StringBuffer sb = new StringBuffer();
        try{
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            
            for (int i = 0; i < array.length; i++ ){
                sb.append(Integer.toHexString((array[i] & 0xFF)| 0X100).substring(1,3));
            }
            return sb.toString();
        }catch(java.security.NoSuchAlgorithmException e){
            
        }
        return sb.toString();
    }
    
    public int autenticar(String sUsuario, String sContraseña) throws SQLException{
        int resultado = -1;
        
        ConexionBD conec = new ConexionBD();
        Connection connectbd = conec.conexion();
        String comando = "SELECT * FROM usuario WHERE Nombre LIKE '%" + sUsuario + "%' AND Contraseña LIKE '%" + sContraseña + "%'";
        
        PreparedStatement pst = connectbd.prepareStatement(comando);
        ResultSet result = null;
        result = pst.executeQuery(comando);
        while(result.next()){
            resultado++;
        }
        
        return resultado;
    }
}
