package uit.elib.utility;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletInputStream;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Hoang
 */
public class UploadFile {

    public static void writeToFile(InputStream is, String file) {
        try {
            DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
            int c;
            while ((c = is.read()) != -1) {
                out.writeByte(c);
            }
            is.close();
            out.close();
        } catch (IOException e) {
            System.err.println("Error Writing/Reading Streams.");
        }
    }
}
