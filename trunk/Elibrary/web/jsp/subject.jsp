<%-- 
    Document   : subject
    Created on : Nov 22, 2011, 8:47:13 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.Date"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/uit.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="font-size: 20px ;color:#680a12; padding-left: 17px; padding-bottom:10px "><bean:message key="text.subject"/>  </div>
        <table style="margin-left: 30px " width="500px">               
            <% 
                List<Subject> listSubject;
                listSubject = (List<Subject>)request.getAttribute("listSubject");
                int language =1; // English
                Locale locale = request.getLocale();
                if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                    language=2; // VietNamese
            %>
            <%                 
                for(int i=0;i<listSubject.size();i=i+2) {
                    String href = "#"+listSubject.get(i).getSubjectId().toString();
            %>
            <tr>          
            <td width="250px" style="color: #680a12">              
                    <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                    <% if(language==1) { %>
                        <a href =<%=href%> style="color:#680a12 " > <%=listSubject.get(i).getSubjectNameEn()%>  </a> <!--English Subject Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href =<%=href%> style="color:#680a12 " ><%=listSubject.get(i).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
                    <% } %>                         
            </td>
            <td width="250px" style="color: #680a12">
                <% if(i+1<listSubject.size()){ %>
                    <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                    <% if(language==1) {%>
                        <a href =<%=href%> style="color:#680a12" > <%=listSubject.get(i+1).getSubjectNameEn()%> </a> <!--English Subject Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href =<%=href%> style="color:#680a12" > <%=listSubject.get(i+1).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
                    <% } %>

                <% } %>    
            </td>
            </tr>
            <% } %>
        </table><br/>
        <div class="af_legends">
            <ul class="legendList">
            <li class="lectureNotes" alt="Lecture notes"
                title="Lecture notes">Lecture notes</li>
            <li class="projectsExample"
                alt="Projects and examples"
                title="Projects and examples">Projects and examples</li>
            <li class="imageGallery" alt="Image Galleries"
                title="Image Galleries">Image Galleries</li>
            <li class="SelectedLectureNotes"
                alt="Selected lecture notes"
                title="Selected lecture notes">Selected lecture notes</li>
            <li class="projectsNoExample"
                alt="Projects (no examples)"
                title="Projects (no examples)">Projects (no examples)</li>
            <li class="multimediaContent"
                alt="Multimedia content"
                title="Multimedia content">Multimedia content</li>
            <li class="assignmentsSolutions"
                alt="Assignments and solutions"
                title="Assignments and solutions">Assignments and solutions</li>
            <li class="examsSolutions" alt="Exams and solutions"
                title="Exams and solutions">Exams and solutions</li>
            <li class="ocwScholar" alt="OCW Scholar"
                title="OCW Scholar">OCW Scholar</li>
            <li class="assignmentsNoSolution"
                alt="Assignments (no solutions)"
                title="Assignments (no solutions)">Assignments (no solutions)</li>
            <li class="examNoSolution"
                alt="Exams (no solutions)"
                title="Exams (no solutions)">Exams (no solutions)</li>
            </ul>
        </div>   
        <% 
            List<Resource> listResource;
            listResource = (List<Resource>)request.getAttribute("listResource");
        %> 
        <%  int j=0;
            for(int i=0;i<listSubject.size();i++) {
                String href="./SubjectHome.do?subjectID="+listSubject.get(i).getSubjectId();
        %>
        <% if(language==1) {%>
            <div  style=" font-size: 12px; margin-left: 17px ; padding-top: 7px; padding-bottom:2px;  font-weight: bold; color: #680a12">
                <u><a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%> style="color:#680a12"><%=listSubject.get(i).getSubjectNameEn() %></a></u> <!--English Subject Name-->
            </div>    
        <% } %> 
        <% if(language==2) {%>
            <div style="font-size: 12px; margin-left: 17px ; padding-top: 7px; padding-bottom:2px; font-weight: bold; color: #680a12">
                <u><a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%> style="color:#680a12" ><%=listSubject.get(i).getSubjectNameVn() %></a></u> <!--Vietnamese Subject Name-->
            </div>    
        <% } %>
        <table cellspacing="0" style="border: 1px #B4B1A2 solid ; margin-left: 17px " width="504px"  >
            <tr style="background-color:#B4B1A2">
                <td width="40px"></td><td width="140px"></td>
                <td width="70px" style="font-weight: bold "><bean:message key="text.orderChapter"/></td>
                <td width="354px" style="font-weight: bold"><bean:message key="text.resourceName"/></td>
            </tr>
            <% int color =0; %>
            <% for(;j<listResource.size();j++) {%>
                 <%
                    int newestPosition=-1;
                    int lecturePosition =-1;
                    int []arrayIcon = new int[11] ;
                    for(int a=0;a<11;a++)
                        arrayIcon[a]=0;
                    int chapter = listResource.get(j).getOrderChapter();
                    if(!listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))
                    {
                        break;
                    }
                    while(chapter==listResource.get(j).getOrderChapter()&&(listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))){
                        if(newestPosition==-1)
                            newestPosition=j;
                        if(listResource.get(j).getResourcecategory().getResourceCategoryId()==7)
                            lecturePosition=j;
                        else
                            arrayIcon[listResource.get(j).getResourcecategory().getResourceCategoryId()-1]=1;
                        j++;
                        if(j>=listResource.size())
                            break;
                    }
                        j--;
                    if(lecturePosition>=0)
                    {    

                %>                       
                <tr>
                <% Date date = new Date(); 
                   boolean oneMonth = false;

                   if(listResource.get(newestPosition).getPostDate()!=null)
                   {
                       long time= date.getTime()- listResource.get(newestPosition).getPostDate().getTime(); // time = today - postdate
                       if(time<=((long)30*24*60*60*1000)) // time <= 30 days
                           oneMonth=true;
                   }
                  %>                                                                            
                <% if(listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))  // if resource belong to subject
                { %> 
                <td width="40px" 
                    <% if(color%2==0){ %> 
                        style="background-color:#E2E1D9"
                    <%}%>                               >
                    <% if(oneMonth==true) {%>
                        <img src="image/new-icon.gif" width="18" height="5" alt="new-icon"/> <!-- new icon  -->
                    <% } %>
                </td>

                <td width="140px" 
                    <% if(color%2==0){ %>
                        style="background-color:#E2E1D9"<%}%>>
                    <div class="displayIcon">
                    <%
                    for(int a=0;a<11;a++){
                        int resourceCategoryId = -1;
                        if(arrayIcon[a]==1)
                        resourceCategoryId=a+1 ;
                    %>                           
                    <% if(resourceCategoryId==1 ){ %>                            
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+1+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Lecture notes" class="lectureNotes" title="Lecture notes"></a><% } %>
                    <% if(resourceCategoryId==2 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+2+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Projects and examples" class="projectsExample" title="Projects and examples"></a><% } %>
                    <% if(resourceCategoryId==3 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+3+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Image Galleries" class="imageGallery" title="Image Galleries"></a><% } %>
                    <% if(resourceCategoryId==4 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+4+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Selected lecture notes" class="SelectedLectureNotes" title="Selected lecture notes"></a><% } %>
                    <% if(resourceCategoryId==5 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+5+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Projects (no examples)" class="projectsNoExample" title="Projects (no examples)"></a>  <% } %>
                    <% if(resourceCategoryId==6 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+6+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Multimedia content" class="multimediaContent" title="Multimedia content"></a>  <% } %>
                    <% if(resourceCategoryId==7 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+7+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Assignments and solutions" href="#" class="assignmentsSolutions" title="Assignments and solutions"></a><% } %>
                    <% if(resourceCategoryId==8 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+8+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Exams and solutions" class="examsSolutions" title="Exams and solutions"></a>   <% } %>
                    <% if(resourceCategoryId==9 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+9+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" OCW Scholar" class="ocwScholar" title="OCW Scholar"></a><% } %>
                    <% if(resourceCategoryId==10 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+10+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Assignments (no solutions)" class="assignmentsNoSolution" title="Assignments (no solutions)"></a> <% } %>
                    <% if(resourceCategoryId==11 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+11+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt=" Exams (no solutions)" class="examNoSolution" title="Exams (no solutions)"></a>   <% } %>
                    <%}%>       
                    </div> 
                </td>
                    <td width="70px"              
                            style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getOrderChapter() %> <!--Chapter-->
                    </td>  
                <% if(language==1) {%>                              
                    <td width="354px"              
                            style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getResourceNameEn() %> <!--English Resource Name-->
                    </td>
                <% } %> 
                <% if(language==2) {%>                               
                    <td width="354px"                           
                        style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getResourceNameVn() %> <!--Vietnamese Resource Name-->
                    </td>
                <% } %>
                <% } %>

                <% if(!listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))  break;
                %>
                <% color ++; %>
            </tr >
                <% }    
                    if(j+1>=listResource.size())
                    {
                        j++;
                        break;
                    }
                    if(j+1>=listResource.size()||!listSubject.get(i).getSubjectId().equals(listResource.get(j+1).getSubject().getSubjectId()))
                    {    
                        j++;
                        break;
                    }
                } %>
        </table>
        <% } %> 
    </body>
</html>
