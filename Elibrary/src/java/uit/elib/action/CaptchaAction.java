package uit.elib.action;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThanhIT
 */
/**
 * Servlet implementation class CaptchaServlet
 */
public class CaptchaAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int width = 150;
        int height = 50;

        char data[][] = {
            {'z', 'e', 't', 'c', 'o', 'd', 'e'},
            {'l', 'i', 'n', 'u', 'x'},
            {'l', 'i', 'n', 'u', 'x'},
            {'l', 'a', 'b', 'u', 'x'},
            {'l', 'c', 'n', 'a', 'x'},
            {'l', 'l', 'o', 'u', 'm'},
            {'l', 'b', 'n', 'o', 'n'},
            {'f', 'r', 'e', 'e', 'b', 's', 'd'},
            {'j', 'e', 'e', 'a', 'b'},
            {'j', '2', 'e'},
            {'a', 'c', 'b', 'e'},
            {'n', 'c', 'b'},
            {'n', 'n', 'a'},
            {'c', 'a', 'k', 'e'},
            {'b', 'c', 'b', 'a'},
            {'q', 'n', 'a', 'a', 'j'},
            {'l', 'm', 'm', 'u', 'k'},
            {'j', 'l', 'k', 'e', 'u', 'e'}
        };


        BufferedImage bufferedImage = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);

        Graphics2D g2d = bufferedImage.createGraphics();

        Font font = new Font("Georgia", Font.BOLD, 18);
        g2d.setFont(font);

        RenderingHints rh = new RenderingHints(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);

        rh.put(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);

        g2d.setRenderingHints(rh);

        GradientPaint gp = new GradientPaint(0, 0,
                Color.white, 0, height / 2, Color.blue, true);

        g2d.setPaint(gp);
        g2d.fillRect(0, 0, width, height);

        g2d.setColor(new Color(200, 153, 0));

        Random r = new Random();
        int index = Math.abs(r.nextInt()) % 5;

        String captcha = String.copyValueOf(data[index]);
        request.getSession().setAttribute("captcha", captcha);

        int x = 0;
        int y = 0;

        for (int i = 0; i < data[index].length; i++) {
            x += 10 + (Math.abs(r.nextInt()) % 15);
            y = 20 + Math.abs(r.nextInt()) % 20;
            g2d.drawChars(data[index], i, 1, x, y);
        }

        g2d.dispose();

        response.setContentType("image/png");
        OutputStream os = response.getOutputStream();
        ImageIO.write(bufferedImage, "png", os);
        os.close();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
