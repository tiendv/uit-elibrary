/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import uit.elib.bo.*;
import uit.elib.entities.*;
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
        
        CreateResourceActionForm createResourceActionForm = (CreateResourceActionForm)form;
        
        ResourceBO rsBO = new ResourceBO();
        SubjectBO sjBO = new SubjectBO();
        Subject tempSJ = new Subject();
        File file;     // manage name
        FileOutputStream fileOutputStream; // save to server
        
        Resourcecategory tempRC= new Resourcecategory();
        ResourceCategoryBO rscBO = new ResourceCategoryBO();
        
        
        SubjectCategorytBO sjcBO = new SubjectCategorytBO();
        Resource temp = new Resource();
        temp.setResourceNameVn(createResourceActionForm.getTxtResourceName());
        
        int typeResource = Integer.parseInt(createResourceActionForm.getHiddenResourceType());
        tempRC = rscBO.getById(typeResource,true);
        
        /**
         * 
         * create chappter
         */
        if(typeResource == 7)
        {   
            tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInChapter(), true);
            temp.setResourceName(createResourceActionForm.getTxtChapterUSName());
            temp.setOderChapter(createResourceActionForm.getTxtOderChapter());
            temp.setSubject(tempSJ);
            temp.setSummaryVn(createResourceActionForm.getFckChapterSummary());
            temp.setSummary(createResourceActionForm.getFckChapterSummaryUS());
            temp.setResourcecategory(tempRC);
            rsBO.addNew(temp);
            return mapping.findForward(SUCCESSCREATECHAPTER);
        }
        /**
         * Create project
         */
        
         if(typeResource == 6)
        {
            temp.setResourceName(createResourceActionForm.getTxtProjectUSName());
            temp.setAuthor(createResourceActionForm.getTxtAuthorProject());
            tempSJ = sjBO.getById(createResourceActionForm.getDropSubjectNameInProject(), true);
            temp.setSubject(tempSJ);
            temp.setResourcecategory(tempRC);
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
        
        return mapping.findForward(SUCCESS);
    }
}
