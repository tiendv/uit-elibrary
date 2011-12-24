/*
 * To change this resourcelate, choose Tools | resourcelates
 * and open the resourcelate in the editor.
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
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Resource;
import uit.elib.dto.Resourcecategory;
import uit.elib.dto.Subject;
import uit.elib.formbean.EditResourceForm;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class EditResourceAction extends org.apache.struts.action.Action {

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
        
        EditResourceForm createResourceForm = (EditResourceForm)form;      
        ResourceBO rsBO = ResourceBO.getResourceBO();       
        Subject subject = new Subject();
        File file;     // manage name
        FileOutputStream fileOutputStream; // save to server
        
        Resourcecategory resourceCategory= new Resourcecategory();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new Date(utilDate.getTime());
        
        Resource resource = new Resource();
        resource.setResourceNameVn(createResourceForm.getTxtResourceNameVN());
        resource.setResourceNameEn(createResourceForm.getTxtResourceNameEN());
        int resourceID = createResourceForm.getTxtResourceID();
        resource = rsBO.getResourceByID(resourceID);
        int resourceCategoryID = resource.getResourcecategory().getResourceCategoryId();
        resourceCategory.setResourceCategoryId(resourceCategoryID);
        resource.setResourceId(resourceID);
        resource.setResourcecategory(resourceCategory);
        resource.setPostDate(sqlDate);
        /**
         * 
         * create chapter
         */
        if(resourceCategoryID == 7)
        {   
            subject.setSubjectId(createResourceForm.getDropSubjectInChapter());
            resource.setOrderChapter(createResourceForm.getTxtOrderChapter());
            resource.setSubject(subject);
            resource.setSummaryVn(createResourceForm.getFckChapterSummaryVN());
            resource.setSummaryEn(createResourceForm.getFckChapterSummaryEN());
        }
        
        /**
         * Create project
         */
        
         if(resourceCategoryID == 6)
        {
            resource.setAuthor(createResourceForm.getTxtAuthorProject());
            subject.setSubjectId(createResourceForm.getDropSubjectInProject());
            resource.setSubject(subject);
            FormFile fileProject = createResourceForm.getFileProject();       
            if(!fileProject.getFileName().isEmpty())
            {   
                
                // delete old file
                if(resource.getServerName()!=null)
                {
                    File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+resource.getServerName());
                    oldFile.delete();
                }                   
                resource.setSize(Double.valueOf(String.valueOf(fileProject.getFileSize())));
                resource.setUploadName(fileProject.getFileName());
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
                resource.setDownloadNumber(0);
                resource.setServerName(file.getName());
                String []suffixFile = fileProject.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);             
                fileOutputStream.close();
            }
        }
         /***
          *  Picture and Reading
          */
         
         if(resourceCategoryID == 8 || resourceCategoryID == 9)
         {
             subject.setSubjectId(createResourceForm.getDropSubjectInReadingAndPicture());
             resource.setSubject(subject);
             FormFile pictureReading = createResourceForm.getFilePictureReading();
            /**
             * 
             */
        
            if(!pictureReading.getFileName().isEmpty())
            {   
                // delete old file
                if(resource.getServerName()!=null)
                {
                    File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+resource.getServerName());
                    oldFile.delete();
                }                  
                resource.setSize(Double.valueOf(String.valueOf(pictureReading.getFileSize())));
                resource.setUploadName(pictureReading.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "Image_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(pictureReading.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = pictureReading.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                if(resourceCategoryID == 9)
                    resource.setDownloadNumber(0);
                fileOutputStream.close();
            }
         }
         /**
          * Resource type = video, 
          */
          if(resourceCategoryID == 4 || resourceCategoryID == 5 || resourceCategoryID == 10 || resourceCategoryID == 11)
         {
            
             subject.setSubjectId(createResourceForm.getDropSubjectInResourceChapter());
             resource.setSubject(subject);
             resource.setOrderChapter(createResourceForm.getDropOrderChapterSubject());
             FormFile resourceChapterProject = createResourceForm.getFileResourceChapter();
            /**
             * 
             */
        
            if(!resourceChapterProject.getFileName().isEmpty())
            {   
                // delete old file
                if(resource.getServerName()!=null)
                {
                    File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+resource.getServerName());
                    oldFile.delete();
                }                    
                resource.setSize(Double.valueOf(String.valueOf(resourceChapterProject.getFileSize())));
                resource.setUploadName(resourceChapterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "ResourceChapter_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(resourceChapterProject.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = resourceChapterProject.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                resource.setDownloadNumber(0);              
                fileOutputStream.close();
            }
         }
          if(resourceCategoryID == 12)
         {
            
             subject.setSubjectId(createResourceForm.getDropSubjectInSysllabus());
             resource.setSubject(subject);
             FormFile resourceChapterProject = createResourceForm.getFileResourceSysllabus();
            /**
             * 
             */
        
            if(!resourceChapterProject.getFileName().isEmpty())
            {   
                // delete old file
                if(resource.getServerName()!=null)
                {
                    File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+resource.getServerName());
                    oldFile.delete();
                }      
                resource.setSize(Double.valueOf(String.valueOf(resourceChapterProject.getFileSize())));
                resource.setUploadName(resourceChapterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile( "ResourceChapter_file","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(resourceChapterProject.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = resourceChapterProject.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                resource.setDownloadNumber(0);            
                fileOutputStream.close();
            }
           
        }  
        rsBO.updateResource(resource);  
        Boolean success =true;
        request.setAttribute("success",success);
        String href="./LoadResource.do";
        request.setAttribute("href",href);
        return mapping.findForward(SUCCESS);
    }
}
