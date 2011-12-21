/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import uit.elib.bo.*;
import uit.elib.dto.*;
import uit.elib.formbean.CreateResourceForm;

/**
 *
 * @author tiendv
 */
public class CreateResourceAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        
        CreateResourceForm createResourceForm = (CreateResourceForm)form;
        
        ResourceBO rsBO = ResourceBO.getResourceBO();
        SubjectBO sjBO = SubjectBO.getSubjectBO();
        
        Subject tempSJ = new Subject();
        File file;     // manage name
        FileOutputStream fileOutputStream; // save to server
        
        Resourcecategory tempRC= new Resourcecategory();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new Date(utilDate.getTime());
        
        Resource temp = new Resource();
        temp.setResourceNameVn(createResourceForm.getTxtResourceNameVN());
        temp.setResourceNameEn(createResourceForm.getTxtResourceNameEN());        
        int resourceCategoryID = createResourceForm.getDropResourceCategory();
        tempRC.setResourceCategoryId(resourceCategoryID);
        temp.setResourcecategory(tempRC);
        temp.setPostDate(sqlDate);
        /**
         * 
         * create chapter
         */
        if(resourceCategoryID == 7)
        {   
            tempSJ = sjBO.getById(createResourceForm.getDropSubjectInChapter(), true);
            temp.setOrderChapter(createResourceForm.getTxtOrderChapter());
            temp.setSubject(tempSJ);
            temp.setSummaryVn(createResourceForm.getFckChapterSummaryVN());
            temp.setSummaryEn(createResourceForm.getFckChapterSummaryEN());
            rsBO.addNew(temp);
        }
        
        /**
         * Create project
         */
        
         if(resourceCategoryID == 6)
        {
            temp.setAuthor(createResourceForm.getTxtAuthorProject());
            tempSJ = sjBO.getById(createResourceForm.getDropSubjectInProject(), true);
            temp.setSubject(tempSJ);
            FormFile fileProject = createResourceForm.getFileProject();       
            if(!fileProject.getFileName().isEmpty())
            {   temp.setSize(fileProject.getFileSize());
                temp.setUploadName(fileProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                  //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "project_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(fileProject.getFileData());
                fileOutputStream.flush();
                
                temp.setServerName(file.getName());
                String []suffixFile = fileProject.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
        }
         /***
          *  Picture and Reading
          */
         
         if(resourceCategoryID == 8 || resourceCategoryID == 9)
         {
             tempSJ = sjBO.getById(createResourceForm.getDropSubjectInReadingAndPicture(), true);
             temp.setSubject(tempSJ);
             FormFile pictureReading = createResourceForm.getFilePictureReading();
            /**
             * 
             */
        
            if(!pictureReading.getFileName().isEmpty())
            {   temp.setSize(pictureReading.getFileSize());
                temp.setUploadName(pictureReading.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "Image_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(pictureReading.getFileData());
                temp.setServerName(file.getName());
                String []suffixFile = pictureReading.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
         }
         /**
          * Resource type = video, 
          */
          if(resourceCategoryID == 4 || resourceCategoryID == 5 || resourceCategoryID == 10 || resourceCategoryID == 11)
         {
            
             tempSJ = sjBO.getById(createResourceForm.getDropSubjectInResourceChapter(), true);
             temp.setSubject(tempSJ);
             temp.setOrderChapter(createResourceForm.getDropOrderChapterSubject());
             FormFile resourceChapterProject = createResourceForm.getFileResourceChapter();
            /**
             * 
             */
        
            if(!resourceChapterProject.getFileName().isEmpty())
            {   temp.setSize(resourceChapterProject.getFileSize());
                temp.setUploadName(resourceChapterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "ResourceChapter_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(resourceChapterProject.getFileData());
                temp.setServerName(file.getName());
                String []suffixFile = resourceChapterProject.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
         }
          if(resourceCategoryID == 12)
         {
            
             tempSJ = sjBO.getById(createResourceForm.getDropSubjectInSysllabus(), true);
             temp.setSubject(tempSJ);
             FormFile resourceChapterProject = createResourceForm.getFileResourceSysllabus();
            /**
             * 
             */
        
            if(!resourceChapterProject.getFileName().isEmpty())
            {   temp.setSize(resourceChapterProject.getFileSize());
                temp.setUploadName(resourceChapterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "ResourceChapter_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(resourceChapterProject.getFileData());
                temp.setServerName(file.getName());
                String []suffixFile = resourceChapterProject.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
         }
        Boolean success =true;
        request.setAttribute("success",success);
        String href="./LoadCreateResource.do";
        request.setAttribute("href",href);
        return mapping.findForward(SUCCESS);
    }
}
