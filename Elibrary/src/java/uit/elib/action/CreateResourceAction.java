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
import uit.elib.formbean.CreateResourceActionForm;

/**
 *
 * @author tiendv
 */
public class CreateResourceAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String SUCCESSCREATECHAPTER ="createchapter";
    private static final String  SUCCESSCREATEPROJECT ="createproject";

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
        
        CreateResourceActionForm createResourceActionForm = (CreateResourceActionForm)form;
        
        ResourceBO rsBO = ResourceBO.getResourceBO();
        SubjectBO sjBO = SubjectBO.getSubjectBO();
        
        Subject tempSJ = new Subject();
        File file;     // manage name
        FileOutputStream fileOutputStream; // save to server
        
        Resourcecategory tempRC= new Resourcecategory();
        ResourceCategoryBO rscBO = ResourceCategoryBO.getResourceCategoryBO();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new Date(utilDate.getTime());
        
        
        SubjectCategoryBO sjcBO = SubjectCategoryBO.getSubjectBO();
        Resource temp = new Resource();
        temp.setResourceNameVn(createResourceActionForm.getTxtResourceName());
        
        int typeResource = Integer.parseInt(createResourceActionForm.getHiddenResourceType());
        tempRC = rscBO.getById(typeResource,true);
        temp.setResourcecategory(tempRC);
        
        /**
         * 
         * create chapter
         */
        if(typeResource == 7)
        {   
            tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInChapter(), true);
            temp.setResourceNameEn(createResourceActionForm.getTxtChapterUSName());
            temp.setOrderChapter(createResourceActionForm.getTxtOrderChapter());
            temp.setSubject(tempSJ);
            temp.setSummaryVn(createResourceActionForm.getFckChapterSummaryVN());
            temp.setSummaryEn(createResourceActionForm.getFckChapterSummaryEN());
            rsBO.addNew(temp);
            rsBO.update(temp);
            return mapping.findForward(SUCCESSCREATECHAPTER);
        }
        
        /**
         * Create project
         */
        
         if(typeResource == 6)
        {
            temp.setResourceNameEn(createResourceActionForm.getTxtProjectNameEN());
            temp.setAuthor(createResourceActionForm.getTxtAuthorProject());
            tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInProject(), true);
            temp.setSubject(tempSJ);
            temp.setPostDate(sqlDate);
            FormFile fileProject = createResourceActionForm.getFileProject();
            /**
             * 
             */
        
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
                temp.setServerName(file.getName());
                String []suffixFile = fileProject.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
            return mapping.findForward(SUCCESSCREATEPROJECT);
        }
         /***
          *  Picture and Reading
          */
         
         if(typeResource == 8 || typeResource == 9)
         {
             temp.setSummaryEn(createResourceActionForm.getTxtNote());
             tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInReadingAndPicture(), true);
             temp.setSubject(tempSJ);
             FormFile picuterProject = createResourceActionForm.getFilePictureReading();
            /**
             * 
             */
        
            if(!picuterProject.getFileName().isEmpty())
            {   temp.setSize(picuterProject.getFileSize());
                temp.setUploadName(picuterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "Image_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(picuterProject.getFileData());
                temp.setServerName(file.getName());
                String []suffixFile = picuterProject.getFileName().split("\\.");
                temp.setFormat(suffixFile[suffixFile.length-1]);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
            return mapping.findForward(SUCCESSCREATEPROJECT); 
         }
         
          if(typeResource == 5 || typeResource == 10 || typeResource == 11)
         {
            
             tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInResourceChapter(), true);
             temp.setSubject(tempSJ);
             temp.setOrderChapter(createResourceActionForm.getDropOrderChapterSubject());
             FormFile resourceChapterProject = createResourceActionForm.getFilePictureReading();
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
                temp.setPostDate(sqlDate);
                fileOutputStream.close();
            }
            rsBO.addNew(temp);
            return mapping.findForward(SUCCESSCREATEPROJECT); 
         }
        
        return mapping.findForward(SUCCESS);
    }
}
