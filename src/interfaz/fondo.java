package interfaz;


import java.awt.Component;
import java.awt.Graphics;
import java.awt.Insets;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.border.Border;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author URIEL
 */
public class fondo implements Border{
     //Se declara la variable fondo

    BufferedImage fondo;
    
    public fondo(String imagen){
        try{
            URL url = new URL(getClass().getResource(imagen).toString());
            fondo= ImageIO.read(url);
        }
        catch(MalformedURLException ex){
            Logger.getLogger(fondo.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch(IOException ex){
            Logger.getLogger(fondo.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    
    
    
    @Override
    public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
        //Se va a pintar el fondo
        g.drawImage(fondo,(x+(width-fondo.getWidth())/2),(y+(height-fondo.getHeight())/2),null);
        
    }

    @Override
    public Insets getBorderInsets(Component c) {
        return new Insets(0,0,0,0);
       
    }

    @Override
    public boolean isBorderOpaque() {
        return false;
    }
    
}
