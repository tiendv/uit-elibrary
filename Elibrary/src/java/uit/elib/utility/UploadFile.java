package uit.elib.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Hoang
 */
public class UploadFile {

    /**
     * This is the action upload a file to server.
     * @param requestContentLength : length of content get from request.
     * @param requestInputStream: InputStream get from request.
     * @param directory : string path to save file to server.
     * @throws java.lang.Exception : IO Exception
     * @return false : fail to upload file
     *         true  : upload file successful
     */
    public static boolean startUploadSingleFile(int requestContentLength, ServletInputStream requestInputStream, String directory) {
        try {
            int m_currentIndex = 0;
            // gets length of the content data
            int m_totalBytes = requestContentLength;
            //to store the contents of file in byte array
            byte[] arr = new byte[m_totalBytes];
            //Get data from  stream
            int totalRead = 0;
            int readBytes = 0;
            for (; totalRead < m_totalBytes; totalRead += readBytes) {
                readBytes = requestInputStream.read(arr, totalRead, m_totalBytes - totalRead);
            }
            /* This section will get boundary marker of upload data                               */
            String m_boundary = "";
            boolean found = false;
            for (; !found && m_currentIndex < m_totalBytes; m_currentIndex++) {
                if (arr[m_currentIndex] == 13) {
                    found = true;
                } else {
                    m_boundary = m_boundary + (char) arr[m_currentIndex];
                }
            }
            m_currentIndex++;
            /* This section will get dataHeader of upload data                               */
            int start = m_currentIndex;
            int end = 0;
            found = false;
            while (!found) {
                if (arr[m_currentIndex] == 13 && arr[m_currentIndex + 2] == 13) {
                    found = true;
                    end = m_currentIndex - 1;
                    m_currentIndex = m_currentIndex + 2;
                } else {
                    m_currentIndex++;
                }
            }
            String dataHeader = new String(arr, start, (end - start) + 1);
            m_currentIndex = m_currentIndex + 2;
            /* This section will get dataContent until reach end of marker             */
            int searchPos = m_currentIndex;
            int keyPos = 0;
            int boundaryLen = m_boundary.length();
            int m_startData = m_currentIndex;
            int m_endData = 0;
            do {
                if (searchPos >= m_totalBytes) {
                    break;
                }
                if (arr[searchPos] == (byte) m_boundary.charAt(keyPos)) {
                    if (keyPos == boundaryLen - 1) {
                        m_endData = ((searchPos - boundaryLen) + 1) - 2;
                        break;
                    }
                    searchPos++;
                    keyPos++;
                } else {
                    searchPos++;
                    keyPos = 0;
                }
            } while (true);
            // Here m_startData and m_endData is what we need
            //Get file name
            String filename = dataHeader.substring(dataHeader.indexOf("filename=\"") + 10);
            filename = filename.substring(0, filename.indexOf("\n"));
            filename = filename.substring(filename.lastIndexOf("\\") + 1, filename.indexOf("\""));
            String dir = directory;
            //Now try to write output file here
            FileOutputStream fos;
            fos = new FileOutputStream(dir + filename);
            for (int n = m_startData; n < m_endData; n++) {
                fos.write(arr[n]);
            }
            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * This is the action upload a file to server.
     * @param request : input request from action.
     * @param directotyName: input the name of directory you want to upload.
     * @throws java.lang.Exception : IO Exception
     * @return false : fail to upload files
     *         true  : upload files successful
     */
    public static boolean startUploadMultiFiles(HttpServletRequest request, String directotyName) {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                } else {
                    try {
                        String itemName = item.getName();
                        File savedFile = new File(request.getServletContext().getRealPath("/") + directotyName + "/" + itemName);
                        item.write(savedFile);
                        System.out.println("<tr><td><b>Your file has been saved at the loaction: </b> < /td> < /tr> < tr> < td > <b>" + request.getServletContext().getRealPath("/") + directotyName + "\\" + itemName + "</td></tr>");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return true;
    }
}
