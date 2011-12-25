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
        
        Subject subject = new Subject();
        File file;     // manage name
        FileOutputStream fileOutputStream; // save to server
        
        Resourcecategory resourceCategory= new Resourcecategory();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new Date(utilDate.getTime());
        
        Resource resource = new Resource();      
        int resourceCategoryID = createResourceForm.getDropResourceCategory();
        if(resourceCategoryID!=8&&resourceCategoryID!=12)//image && syllabus
        {
            resource.setResourceNameVn(createResourceForm.getTxtResourceNameVN());
            resource.setResourceNameEn(createResourceForm.getTxtResourceNameEN());  
        }
        resourceCategory.setResourceCategoryId(resourceCategoryID);
        resource.setResourcecategory(resourceCategory);
        resource.setPostDate(sqlDate);
        /**
         * 
         * create Thesis
         */        
        if(resourceCategoryID == 2)
        {
            
            Level level  = new Level();
            level.setLevelId(createResourceForm.getDropLevel());
            Faculty faculty = new Faculty();
            faculty.setFacultyId(createResourceForm.getDropFaculty());
            resource.setLevel(level);
            resource.setFaculty(faculty);
            resource.setAuthor(createResourceForm.getTxtThesisAuthor());
            resource.setTeacher(createResourceForm.getTxtTeacher());
            resource.setClass_(createResourceForm.getTxtClass());
            resource.setSchool(createResourceForm.getTxtSchool());
            resource.setYear(createResourceForm.getTxtYear());
            resource.setSchoolYear(createResourceForm.getTxtSchoolYear());
            FormFile fileThesis = createResourceForm.getFileThesis();
            resource.setSummaryVn(createResourceForm.getFckThesisSummaryVN());
            resource.setSummaryEn(createResourceForm.getFckThesisSummaryEN());            
            /**
             * 
             */
        
            if(!fileThesis.getFileName().isEmpty())
            {   resource.setSize(Double.valueOf(String.valueOf(fileThesis.getFileSize())));
                resource.setUploadName(fileThesis.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile("File_Thesis_","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(fileThesis.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = fileThesis.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                resource.setDownloadNumber(0);
                fileOutputStream.close();
            }
            
         }        
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
            resource.setAuthor(createResourceForm.getTxtProjectAuthor());
            subject.setSubjectId(createResourceForm.getDropSubjectInProject());
            resource.setSubject(subject);
            FormFile fileProject = createResourceForm.getFileProject();       
            if(!fileProject.getFileName().isEmpty())
            {   resource.setSize(Double.valueOf(String.valueOf(fileProject.getFileSize())));
                resource.setUploadName(fileProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                  //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile("File_Project_","",file);
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
             FormFile filePictureReading = createResourceForm.getFilePictureReading();

             if(!filePictureReading.getFileName().isEmpty())
             {  
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }              
                fileOutputStream=null;
                String []suffixFile = filePictureReading.getFileName().split("\\.");
                if(resourceCategoryID == 8) // Image
                {
                    file = File.createTempFile("Image_","."+suffixFile[suffixFile.length-1],file);
                    fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                    fileOutputStream.write(filePictureReading.getFileData());                   
                    resource.setServerName(file.getName());
                }
                if(resourceCategoryID == 9)// Reading
                {
                    file = File.createTempFile("File_Reading_","",file);
                    fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                    fileOutputStream.write(filePictureReading.getFileData());
                    resource.setServerName(file.getName());
                    resource.setDownloadNumber(0);
                    resource.setFormat(suffixFile[suffixFile.length-1]);
                    resource.setSize(Double.valueOf(String.valueOf(filePictureReading.getFileSize())));     
                    resource.setUploadName(filePictureReading.getFileName());
                }
                fileOutputStream.close();
             }
         }
         /**
          *  Assignment, Example, Lecture, Video, 
          */
          if(resourceCategoryID == 4 || resourceCategoryID == 5 || resourceCategoryID == 10 || resourceCategoryID == 11)
          {
            
             subject.setSubjectId(createResourceForm.getDropSubjectInResourceChapter());
             resource.setSubject(subject);
             resource.setOrderChapter(createResourceForm.getDropOrderChapterSubject());
             FormFile resourceChapterProject = createResourceForm.getFileResourceChapter();
        
            if(!resourceChapterProject.getFileName().isEmpty())
            {   resource.setSize(Double.valueOf(String.valueOf(resourceChapterProject.getFileSize())));
                resource.setUploadName(resourceChapterProject.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                if(resourceCategoryID == 4)
                    file = File.createTempFile("File_Assignment_","",file);
                if(resourceCategoryID == 5)
                    file = File.createTempFile("File_Example_","",file);
                if(resourceCategoryID == 10)
                    file = File.createTempFile("File_Lecture_","",file);
                if(resourceCategoryID == 11)
                    file = File.createTempFile("File_Video_","",file);                
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(resourceChapterProject.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = resourceChapterProject.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                resource.setDownloadNumber(0);
                fileOutputStream.close();
            }
         }
        /**
         * Syllabus
         */         
          if(resourceCategoryID == 12)
          {
            
             subject.setSubjectId(createResourceForm.getDropSubjectInSyllabus());
             resource.setSubject(subject);
             FormFile fileSyllabus = createResourceForm.getFileSyllabus();
            /**
             * 
             */
        
            if(!fileSyllabus.getFileName().isEmpty())
            {   resource.setSize(Double.valueOf(String.valueOf(fileSyllabus.getFileSize())));
                resource.setUploadName(fileSyllabus.getFileName());
                String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
                //create the upload folder if not exists
                file = new File(filePath);
                if(!file.exists()){
                    file.mkdir();
                }
                file = File.createTempFile("File_Syllabus_","",file);
                fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                fileOutputStream.write(fileSyllabus.getFileData());
                resource.setServerName(file.getName());
                String []suffixFile = fileSyllabus.getFileName().split("\\.");
                resource.setFormat(suffixFile[suffixFile.length-1]);
                resource.setDownloadNumber(0);
                fileOutputStream.close();
            }
            
         }
        rsBO.addNew(resource);  
        Boolean success =true;
        request.setAttribute("success",success);
        String href="./LoadCreateResource.do";
        request.setAttribute("href",href);
        return mapping.findForward(SUCCESS);
    }
}
